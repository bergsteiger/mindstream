unit l3CoordinateMap;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3InternalInterfaces,
  l3FrameLine,
  l3FrameLineList,
  l3CProtoObject
  ;

type
 Tl3CoordinateMap = class(Tl3CProtoObject)
  {* Объект группирующий горизонтальные или вертикальные выравнивающие линии. }
 private
 // private fields
   f_IsVertical : Boolean;
    {* Ориентация линии}
   f_PrevIndex : Integer;
    {* Индекс предыдущей линии}
   f_VBuffer : Integer;
    {* Буфер для выравнивания последней горизонтальной линии.}
   f_Values : Tl3FrameLineList;
    {* Массив списка линий по данной координате}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(anOrientation: Boolean); reintroduce;
   procedure DrawLines(const aCanvas: Il3Canvas;
    const aColorArray: Tl3LinesColorArray;
    aWidth: Integer);
     {* Отрисовать все элементы для объекта с anObjectID }
   function AddLine(aMapValue: Integer;
    aLine: Tl3FrameLine;
    aToBuffer: Boolean): Tl3FrameLine;
     {* Добавляет значение в мапу }
   procedure AlignBoundary(aStart: Integer;
    aFinish: Integer;
    aDestList: Tl3CoordinateMap);
     {* Применить выравнивающие ограничения - выравниванием все линии от aStart
         до aFinish по значению aFinish. }
   procedure AlignAllLines(aValue: Integer;
    aDestList: Tl3CoordinateMap); virtual;
     {* Выравнять все линии по значению aValue (используется для выравнивания отсвшихся горизонтальных линий) }
   procedure CheckLine(aMinBound: Integer;
    aMaxBound: Integer);
     {* Вызывает CheckCoordinate для всех отрезков. }
   procedure ClearPrev(aClearAll: Boolean);
     {* Сбрасывает индекс предыдущего }
   function GetAlignData: Il3IntegerList;
     {* Получить данные о выравнивании }
   procedure SetAlignData(const aData: Il3IntegerList);
     {* Сохранить данные о выравнивании }
   procedure SavePrev;
     {* Запомнить PrevIndex для последующего применения. }
   procedure Clear;
     {* Очищает данные о линиях. }
   function GetValues: Tl3FrameLineList;
 end;//Tl3CoordinateMap

implementation

uses
  l3Base,
  l3Types,
  l3Const,
  l3InterfacedIntegerList,
  SysUtils,
  l3UnitsTools
  ;

// start class Tl3CoordinateMap

constructor Tl3CoordinateMap.Create(anOrientation: Boolean);
//#UC START# *48CA5D1F037A_48CA5CB001A3_var*
//#UC END# *48CA5D1F037A_48CA5CB001A3_var*
begin
//#UC START# *48CA5D1F037A_48CA5CB001A3_impl*
 inherited Create;
 f_IsVertical := anOrientation;
 f_Values := Tl3FrameLineList.Make;
 f_PrevIndex := -1; 
//#UC END# *48CA5D1F037A_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.Create

procedure Tl3CoordinateMap.DrawLines(const aCanvas: Il3Canvas;
  const aColorArray: Tl3LinesColorArray;
  aWidth: Integer);
//#UC START# *48CA5D5101AE_48CA5CB001A3_var*

 function DrawElement(Data: PObject; Index: Integer): Boolean; 
 begin
  Result := True;
  Tl3FrameLine(Data^).DrawLine(aCanvas, aColorArray, f_IsVertical, aWidth);
 end;

//#UC END# *48CA5D5101AE_48CA5CB001A3_var*
begin
//#UC START# *48CA5D5101AE_48CA5CB001A3_impl*
 f_Values.IterateAllF(l3L2IA(@DrawElement));
//#UC END# *48CA5D5101AE_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.DrawLines

function Tl3CoordinateMap.AddLine(aMapValue: Integer;
  aLine: Tl3FrameLine;
  aToBuffer: Boolean): Tl3FrameLine;
//#UC START# *48CA5D78038C_48CA5CB001A3_var*
var
 l_Index      : Integer;
 l_FrameLine  : Tl3FrameLine;
 l_FoundIndex : Integer;
//#UC END# *48CA5D78038C_48CA5CB001A3_var*
begin
//#UC START# *48CA5D78038C_48CA5CB001A3_impl*
 l_FoundIndex := -1;
 if aMapValue <> cWaitAlignMean then
 begin
  if (f_PrevIndex > -1) and not aToBuffer and f_IsVertical then
   l_FoundIndex := f_PrevIndex
  else
  for l_Index := f_Values.Count - 1 downto 0 do
  begin
   if (Abs(aMapValue - f_Values[l_Index].LineCoordinate) <= L3FrameLinesDelta) then
   begin
    l_FoundIndex := l_Index; 
    Break;
   end; // Abs(aMapValue - f_Values[l_Index].LineCoordinate) <= L3FrameLinesDelta 
  end; // for l_Index := f_Values.Count - 1 downto 0 do
 end; // if aMapValue <> cWaitAlignMean then
 if l_FoundIndex = -1 then 
 // Если не нашли ни одной подходящей линии, то пытаемся создать новую.
 begin
  l_FrameLine := Tl3FrameLine.Create(aMapValue);
  try
   l_FoundIndex := f_Values.Add(l_FrameLine);
   Result := l_FrameLine;
  finally
   l3Free(l_FrameLine);
  end;//try..finally
 end//if l_FoundIndex = -1 then 
 else
 begin
  Result := f_Values[l_FoundIndex];
  if f_VBuffer = l_FoundIndex then
  begin
   Result.LineCoordinate := aMapValue;
   f_VBuffer := -1;
  end; // if f_VBuffer = l_FoundIndex then
 end;
 if aLine <> nil then 
  Result.AssignData(aLine); 
 if aToBuffer and f_IsVertical then
  f_PrevIndex := l_FoundIndex
 else
  f_PrevIndex := -1;
//#UC END# *48CA5D78038C_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.AddLine

procedure Tl3CoordinateMap.AlignBoundary(aStart: Integer;
  aFinish: Integer;
  aDestList: Tl3CoordinateMap);
//#UC START# *48CA5D9D008E_48CA5CB001A3_var*
var
 l_Last  : Integer; 
 l_Index : Integer;
 l_Line  : Tl3FrameLine;
//#UC END# *48CA5D9D008E_48CA5CB001A3_var*
begin
//#UC START# *48CA5D9D008E_48CA5CB001A3_impl*
 l_Last := f_Values.Count - 1; 
 for l_Index := l_Last downto 0 do
 begin
  l_Line := f_Values[l_Index];
  if (l_Line.LineCoordinate <> cWaitAlignMean) then
   if (l_Line.LineCoordinate = cAlingByBoundary) or
     ((aStart - L3FrameLinesDelta) <= l_Line.LineCoordinate) and
     (l_Line.LineCoordinate <= (aFinish + L3FrameLinesDelta)) then
   begin
    aDestList.AddLine(aFinish, l_Line, False);
    l_Line := nil;
    f_Values.Delete(l_Index);
   end;//if ((aStart - L3FrameLinesDelta) <= f_Values[l_Index].LineCoordinate) and
 end;//for l_Index := l_Last downto 0 do
//#UC END# *48CA5D9D008E_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.AlignBoundary

procedure Tl3CoordinateMap.AlignAllLines(aValue: Integer;
  aDestList: Tl3CoordinateMap);
//#UC START# *491448230196_48CA5CB001A3_var*
var
 l_Last  : Integer;
 l_Index : Integer;
 l_Line  : Tl3FrameLine;
//#UC END# *491448230196_48CA5CB001A3_var*
begin
//#UC START# *491448230196_48CA5CB001A3_impl*
 l_Last := f_Values.Count - 1;
 for l_Index := l_Last downto 0 do
 begin
  if (f_Values[l_Index].LineCoordinate = cWaitAlignMean) then
  begin
   l_Line := f_Values[l_Index];
   aDestList.AddLine(aValue, l_Line, False);
   l_Line := nil;
   f_Values.Delete(l_Index);
  end;//if ((aStart - L3FrameLinesDelta) <= f_Values[l_Index].LineCoordinate) and
 end;//for l_Index := l_Last downto 0 do
//#UC END# *491448230196_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.AlignAllLines

procedure Tl3CoordinateMap.CheckLine(aMinBound: Integer;
  aMaxBound: Integer);
//#UC START# *49BE609800C6_48CA5CB001A3_var*
 function CheckElement(Data: PObject; Index: Integer): Boolean;
 begin
  if (Tl3FrameLine(Data^).LineCoordinate = cWaitAlignMean) then
   Tl3FrameLine(Data^).CheckCoordinate(aMinBound, aMaxBound);
  Result := True;
 end;
//#UC END# *49BE609800C6_48CA5CB001A3_var*
begin
//#UC START# *49BE609800C6_48CA5CB001A3_impl*
 f_Values.IterateAllF(l3L2IA(@CheckElement));
//#UC END# *49BE609800C6_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.CheckLine

procedure Tl3CoordinateMap.ClearPrev(aClearAll: Boolean);
//#UC START# *4AB1D0CF01E7_48CA5CB001A3_var*
//#UC END# *4AB1D0CF01E7_48CA5CB001A3_var*
begin
//#UC START# *4AB1D0CF01E7_48CA5CB001A3_impl*
 f_PrevIndex := -1;
 if aClearAll then
  f_VBuffer := -1;
//#UC END# *4AB1D0CF01E7_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.ClearPrev

function Tl3CoordinateMap.GetAlignData: Il3IntegerList;
//#UC START# *4AB8773101B3_48CA5CB001A3_var*
var
 i: Integer;
 l_IL : Tl3InterfacedIntegerList;
//#UC END# *4AB8773101B3_48CA5CB001A3_var*
begin
//#UC START# *4AB8773101B3_48CA5CB001A3_impl*
 l_IL := Tl3InterfacedIntegerList.Create;
 try
  l_IL.Count := f_Values.Count;
  for i := 0 to f_Values.Count - 1 do
   l_IL[i] := f_Values[i].LineCoordinate;
  Result := l_IL; 
 finally
  FreeAndNil(l_IL);
 end;//try..finally
//#UC END# *4AB8773101B3_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.GetAlignData

procedure Tl3CoordinateMap.SetAlignData(const aData: Il3IntegerList);
//#UC START# *4AB8775E017C_48CA5CB001A3_var*
var
 i       : Integer;
 l_Count : Integer;
//#UC END# *4AB8775E017C_48CA5CB001A3_var*
begin
//#UC START# *4AB8775E017C_48CA5CB001A3_impl*
 for i := 0 to aData.Count - 1 do
  AddLine(aData[i], nil, False);
//#UC END# *4AB8775E017C_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.SetAlignData

procedure Tl3CoordinateMap.SavePrev;
//#UC START# *4C18991501FE_48CA5CB001A3_var*
//#UC END# *4C18991501FE_48CA5CB001A3_var*
begin
//#UC START# *4C18991501FE_48CA5CB001A3_impl*
 f_VBuffer := f_PrevIndex;
//#UC END# *4C18991501FE_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.SavePrev

procedure Tl3CoordinateMap.Clear;
//#UC START# *4C651ED702E4_48CA5CB001A3_var*
//#UC END# *4C651ED702E4_48CA5CB001A3_var*
begin
//#UC START# *4C651ED702E4_48CA5CB001A3_impl*
 ClearPrev(True);
 f_Values.Clear;
//#UC END# *4C651ED702E4_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.Clear

function Tl3CoordinateMap.GetValues: Tl3FrameLineList;
//#UC START# *4D00BD46021B_48CA5CB001A3_var*
//#UC END# *4D00BD46021B_48CA5CB001A3_var*
begin
//#UC START# *4D00BD46021B_48CA5CB001A3_impl*
 Result := f_Values;
//#UC END# *4D00BD46021B_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.GetValues

procedure Tl3CoordinateMap.Cleanup;
//#UC START# *479731C50290_48CA5CB001A3_var*
//#UC END# *479731C50290_48CA5CB001A3_var*
begin
//#UC START# *479731C50290_48CA5CB001A3_impl*
 l3Free(f_Values);
 f_PrevIndex := -1;
 inherited; 
//#UC END# *479731C50290_48CA5CB001A3_impl*
end;//Tl3CoordinateMap.Cleanup

end.