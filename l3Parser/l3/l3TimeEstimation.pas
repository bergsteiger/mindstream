unit l3TimeEstimation;

{
 Tl3TimeEstimation - предназначен дл€ оценки оставшегос€ времени в секундах.

 ѕример использовани€:

 l_TimeEstimation := Tl3TimeEstimation.Create(100, 5); // дожидаемс€ 100, используютс€ не более 5 последних значений
 try
  while (l_Percentage < 100) do                      // крутим долгий цикл
  begin
   VeryLongOperation;                                // ќооочень продолжительна€ операци€

   l_Percentage := GetCurrentPercentage;             // вычисление текущего значени€
   l_TimeEstimation.CurrentValue(l_Percentage);      // и его ввод.

   if l_TimeEstimation.LeftToFinish(l_Secs) then     // вычисление (оценка) секунд до достижени€ 100
    Info := Format('%d secs to finish', [l_Secs]);   // и отображение информации (то, ради чего все и сделано)
  end;
 finally
  l3Free(l_TimeEstimation);
 end;
}

{ $Id: l3TimeEstimation.pas,v 1.9 2013/04/24 09:35:37 lulin Exp $ }

// $Log: l3TimeEstimation.pas,v $
// Revision 1.9  2013/04/24 09:35:37  lulin
// - портируем.
//
// Revision 1.8  2010/03/16 17:34:06  lulin
// {RequestLink:197494962}.
// - используем более простого предка.
//
// Revision 1.7  2008/02/22 18:26:37  lulin
// - доперевЄл списки на модель.
//
// Revision 1.6  2005/10/17 11:20:26  step
// добавлен метод дл€ отладки (Tl3TimeEstimation.DumpToLog)
//
// Revision 1.5  2005/02/01 17:33:08  step
// no message
//
// Revision 1.4  2005/01/12 14:01:43  step
// переименование TTimeEstimation --> Tl3TimeEstimation
//
// Revision 1.3  2005/01/12 10:28:26  step
// замена Integer --> Int64
//
// Revision 1.2  2005/01/12 10:03:15  step
// переименовани€, оформление
//
// Revision 1.1  2005/01/11 17:00:04  step
// занесено в CVS
//

interface

uses
 Classes,
 {Contnrs,}
 l3Base,
 l3DynamicArrayEx,
 l3ProtoObject
 ;

type
 // te - сокр. TimeEstimation

 TteNumber = Single;

 PtePoint = ^TtePoint;
 TtePoint = record
  X, Y, X2, XY: TteNumber;
 end;

 TtePoints = class(Tl3ProtoObject)
 private
  f_Array: Tl3DynamicArrayEx;
  f_Amount: Integer;
  f_Last: Integer;
 protected
  procedure Cleanup; override;
  procedure DumpToLog(aStream: TStream); // чисто дл€ отладки
 public
  constructor Create(const aMaxAmount: Integer); reintroduce;
  procedure Add(const aX, aY: TteNumber);
  procedure CalcSums(var aS1, aSX, aSY, aSX2, aSXY: TteNumber);
  property Amount: Integer read f_Amount;
 end;

 TteLine = class(Tl3ProtoObject)
 private
  f_Points: TtePoints;
 protected
  procedure Cleanup; override;
 public
  constructor Create(const aPointsAmount: Integer); reintroduce;
  procedure AddPoint(const aX, aY: TteNumber);
  function IsEmpty: Boolean;
  function Extrapolate(const aY: TteNumber;
                       var   aX: TteNumber): Boolean;
 end;

 Tl3TimeEstimation = class(Tl3ProtoObject)
 private
  f_FinishValue: TteNumber;
  f_StartTime: TDateTime;
  f_Line: TteLine;
  function TimeToNum(aTime: TDateTime): TteNumber;
  function NumToTime(aNum: TteNumber): TDateTime;
  function TimeToSecs(aTime: TDateTime): Int64;
 protected
  procedure Cleanup; override;
 public
  constructor Create(const aFinishValue: TteNumber; // значение, достижение которого мы дожидаемс€
                     const aValuesAmount: Integer // в расчетах используютс€ только последние введенные значени€.
                                                  // Ёто - их количество. Ѕолее старые - отбрасываютс€.
                     ); reintroduce;
  procedure CurrentValue(const aValue: TteNumber); // ввод очередного текущего значени€
  function LeftToFinish(out aSeconds: Int64): Boolean; // собственно оценка "оставшихс€ секунд".
                                                         // ¬озвращает ложь при невозможности вычислить.
  procedure DumpToLog(aStream: TStream); // чисто дл€ отладки
 end;

implementation

uses
 SysUtils, Math;

const
 c_Zero = 0.0;
 c_Epsilon = 0.0001;
 c_EmptyPoint: TtePoint = (X: c_Zero;
                           Y: c_Zero;
                           X2: c_Zero;
                           XY: c_Zero);

{ TteLine }

procedure TteLine.AddPoint(const aX, aY: TteNumber);
begin
 f_Points.Add(aX, aY);
end;

function TteLine.Extrapolate(const aY: TteNumber; var aX: TteNumber): Boolean;
var
 l_S1, l_SX, l_SY, l_SX2, l_SXY: TteNumber;
 l_D, l_Db, l_Dc: TteNumber;
 l_B, l_C: TteNumber;
begin
 Result := False;

 if f_Points.Amount < 2 then
  Exit;

 f_Points.CalcSums(l_S1, l_SX, l_SY, l_SX2, l_SXY);

 l_D := l_S1 * l_SX2 - l_SX * l_SX;
 if IsZero(l_D, c_Epsilon) then
  Exit;

 l_Db := l_S1  * l_SXY - l_SX * l_SY;
 l_Dc := l_SX2 * l_SY  - l_SX * l_SXY;

 l_B := l_Db / l_D;
 l_C := l_Dc / l_D;

 if IsZero(l_B, c_Epsilon) then
  Exit;

 aX := (aY - l_C) / l_B;
 Result := True;
end;

constructor TteLine.Create(const aPointsAmount: Integer);
begin
 inherited Create;

 f_Points := TtePoints.Create(aPointsAmount);
end;

procedure TteLine.Cleanup;
begin
 l3Free(f_Points);

 inherited;
end;

function TteLine.IsEmpty: Boolean;
begin
 Result := f_Points.Amount = 0;
end;

{ TtePoints }

procedure TtePoints.Add(const aX, aY: TteNumber);
begin
 f_Last := (f_Last + 1) mod f_Array.Count;
 f_Amount := Max(f_Amount, f_Last + 1);
 with PtePoint(f_Array[f_Last])^ do
 begin
  X  := aX;
  Y  := aY;
  X2 := aX * aX;
  XY := aX * aY;
 end;
end;

procedure TtePoints.CalcSums(var aS1, aSX, aSY, aSX2, aSXY: TteNumber);
var
 I: Integer;
begin
 aS1  := f_Amount;
 aSX  := c_Zero;
 aSY  := c_Zero;
 aSX2 := c_Zero;
 aSXY := c_Zero;
 for I := 0 to f_Amount - 1 do
  with PtePoint(f_Array[I])^ do
  begin
   aSX   := aSX   + X;
   aSY   := aSY   + Y;
   aSX2  := aSX2  + X2;
   aSXY  := aSXY  + XY;
  end;
end;

procedure TtePoints.Cleanup;
begin
 l3Free(f_Array);
 inherited;
end;

constructor TtePoints.Create(const aMaxAmount: Integer);
var
 I: Integer;
begin
 inherited Create;
 
 f_Array := Tl3DynamicArrayEx.Create(SizeOf(TtePoint));
 f_Array.Count := Max(aMaxAmount, 2); // точек не может быть менее двух
 for I := 0 to f_Array.Count - 1 do
  PtePoint(f_Array[I])^ := c_EmptyPoint;

 f_Amount := 0;
 f_Last := -1;
end;

procedure TtePoints.DumpToLog(aStream: TStream);
 procedure Log(const aStr: string);
 begin
  aStream.Write(aStr[1], aStream.Size);
 end;
var
 I: Integer;
begin
 Log(SysUtils.Format(' ол-во точек: %d'#13#10, [f_Amount]));
 for I := 0 to f_Amount - 1 do
  with PtePoint(f_Array[I])^ do
   Log(SysUtils.Format('%f ; %f'#13#10, [X, Y]));
end;

{ Tl3TimeEstimation }

constructor Tl3TimeEstimation.Create(const aFinishValue: TteNumber;
                                   const aValuesAmount: Integer);
begin
 inherited Create;
 f_FinishValue := aFinishValue;
 f_Line := TteLine.Create(aValuesAmount);
end;

function Tl3TimeEstimation.LeftToFinish(out aSeconds: Int64): Boolean;
var
 l_FinishTime: TteNumber;
begin
 try
  Result := f_Line.Extrapolate(f_FinishValue, l_FinishTime);
 except
  Result := False;
 end;

 if Result then
 begin
  aSeconds := TimeToSecs(f_StartTime + NumToTime(l_FinishTime) - Time);
  Result := aSeconds >= 0; // остаток времени не может быть отрицательным
 end;
end;

function Tl3TimeEstimation.NumToTime(aNum: TteNumber): TDateTime;
begin
 Result := aNum / (24 * 60 * 60);
end;

procedure Tl3TimeEstimation.CurrentValue(const aValue: TteNumber);
begin
 if f_Line.IsEmpty then
  f_StartTime := Time;

 f_Line.AddPoint(TimeToNum(Time - f_StartTime), aValue);
end;

function Tl3TimeEstimation.TimeToNum(aTime: TDateTime): TteNumber;
begin
 Result := aTime * 24 * 60 * 60;
end;

function Tl3TimeEstimation.TimeToSecs(aTime: TDateTime): Int64;
begin
 Result := Round(aTime * 24 * 60 * 60);
end;

procedure Tl3TimeEstimation.Cleanup;
begin
 l3Free(f_Line);
 inherited;
end;

procedure Tl3TimeEstimation.DumpToLog(aStream: TStream);
begin
 f_Line.f_Points.DumpToLog(aStream);
end;

end.
