unit msLineF;

interface

uses
 System.Types,

 FMX.DUnit.msLog
 ;

type
 Pixel = Single;

 TmsPointF = record
 public
  P : TPointF;
  constructor Create(const aPoint: TPointF); overload;
  constructor Create(aX: Pixel; aY: Pixel); overload;
  procedure ToLog(aLog: TmsLog);
  class function Normalize(const aPt: TmsPointF): TmsPointF; static;
  function N: TmsPointF;
  function ToString: String;
  property X: Pixel
   read P.X
   write P.X;
  property Y: Pixel
   read P.Y
   write P.Y;
 end;//TmsPointF

 TmsLineF = record
 public
  A : TmsPointF;
  B : TmsPointF;
  procedure ToLog(aLog: TmsLog);
  function ToString: String;
  function Cross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;
  // - пересечение линий
  function SegmentsCross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;
  // - пересечение отрезков
  constructor Create(const aA: TmsPointF; const aB: TmsPointF); overload;
  constructor Create(const aA: TPointF; const aB: TPointF); overload;
  constructor Create(aAX, aAY: Pixel; aBX, aBY: Pixel); overload;
  function dX: Pixel;
  function dY: Pixel;
  function Length: Pixel;
  function ScalarMul(const anOther: TmsLineF): Pixel;
  function CosA(const anOther: TmsLineF): Single;
 end;//TmsLineF

 TmsLineFPair = record
 public
  L1 : TmsLineF;
  L2 : TmsLineF;
  constructor Create(const aL1: TmsLineF; const aL2: TmsLineF);
  procedure ToLog(aLog: TmsLog);
  function ToString: String;
  function Cross(out theCross: TmsPointF): Boolean;
  // - пересечение линий
  function SegmentsCross(out theCross: TmsPointF): Boolean;
  // - пересечение отрезков
 end;//TmsLineFPair

 TmsLineFPairs = array of TmsLineFPair;

 TmsRectF = record
 public
  R : TRectF;
  constructor Create(const aR: TRectF);
  function Cross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;
 end;//TmsRectF

implementation

uses
 System.SysUtils,
 Math
 ;

// TmsPointF

constructor TmsPointF.Create(const aPoint: TPointF);
begin
 P := aPoint;
end;

constructor TmsPointF.Create(aX: Pixel; aY: Pixel);
begin
 Create(TPointF.Create(aX, aY));
end;

procedure TmsPointF.ToLog(aLog: TmsLog);
var
 l_N : TmsPointF;
begin
 l_N := Self.N;
 aLog.ToLog('X:');
 aLog.ToLog(FloatToStr(l_N.P.X));
 aLog.ToLog('Y:');
 aLog.ToLog(FloatToStr(l_N.P.Y));
end;

class function TmsPointF.Normalize(const aPt: TmsPointF): TmsPointF;
begin
 Result := aPt;
end;

function TmsPointF.N: TmsPointF;
begin
 Result := Normalize(Self);
end;

function TmsPointF.ToString: String;
var
 l_P : TmsPointF;
begin
 l_P := Self.N;
 Result := FloatToStr(l_P.X) + '_' + FloatToStr(l_P.Y);
end;

// TmsLineF

procedure TmsLineF.ToLog(aLog: TmsLog);
begin
 aLog.ToLog('dump line:');
 aLog.ToLog('A:');
 A.ToLog(aLog);
 aLog.ToLog('B:');
 B.ToLog(aLog);
end;

function TmsLineF.ToString: String;
begin
 Result := A.ToString + '_' + B.ToString;
end;

procedure DoCross(const Self: TmsLineF; const anOther: TmsLineF; out theCross: TmsPointF);
var
 dXdY : Pixel;
 dYdX : Pixel;
 dYdY : Pixel;
begin//DoCross
 Assert(not IsZero(Self.dY));

 // - теперь тут можно будет вставить ЛЮБОЙ ДРУГОЙ алгоритм и посмотреть - "что будет"

 dXdY := Self.dX * anOther.dY;
 dYdX := Self.dY * anOther.dX;
 dYdY := Self.dY * anOther.dY;

 theCross.Y := (
                 dXdY * Self.A.Y -
                 dYdX * anOther.A.Y +
                 dYdY * (anOther.A.X - Self.A.X)
               )
                /
               (dXdY - dYdX);

 theCross.X := Self.A.X +
               Self.dX * (theCross.Y - Self.A.Y)
                /
               Self.dY;
end;//DoCross

function TmsLineF.Cross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;
var
 l_Angle : Single;
begin
 Result := false;
 theCross := TmsPointF.Create(High(Integer), High(Integer));
 if IsZero(Self.Length) then
 begin
  theCross.X := 0;
  if IsZero(anOther.Length) then
   theCross.Y := 0;
  Exit;
 end//IsZero(Self.Length)
 else
 if IsZero(anOther.Length) then
 begin
  theCross.Y := 0;
  Exit;
 end;//IsZero(anOther.Length)

 // Дальше нужно проверить параллельность прямых
 l_Angle := ArcCos(Self.CosA(anOther));
 if IsZero(l_Angle) OR SameValue(l_Angle, pi) then
 begin
  theCross.X := -1;
  theCross.Y := -1;
  Exit;
 end;//IsZero(ArcCos(Self.CosA(anOther)))

 if IsZero(Self.dY) then
 begin
  if IsZero(anOther.dX) then
  begin
   Result := true;
   theCross.X := anOther.A.X;
   theCross.Y := Self.A.Y;
   Exit;
  end//IsZero(anOther.dX)
  else
  begin
   if IsZero(anOther.dY) then
   begin
    Result := false;
    Exit;
   end//IsZero(anOther.dY)
   else
   begin
    DoCross(anOther, Self, theCross);
    Result := true;
    Exit;
   end;//IsZero(anOther.dY)
  end;//IsZero(anOther.dX)
 end//IsZero(Self.dY)
 else
 if IsZero(anOther.dY) then
 begin
  if IsZero(Self.dX) then
  begin
   Result := true;
   theCross.X := Self.A.X;
   theCross.Y := anOther.A.Y;
   Exit;
  end;//IsZero(Self.dX)
 end;//IsZero(anOther.dY)

 // Дальше можно по идее применять Мишин алгоритм:

 DoCross(Self, anOther, theCross);
 Result := true;
end;

function TmsLineF.SegmentsCross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;

 function Btwn(aValue, aB1, aB2: Pixel): Boolean;
 var
  l_Min : Pixel;
  l_Max : Pixel;
 begin//Btwn
  l_Min := Min(aB1, aB2);
  l_Max := Max(aB1, aB2);
  Result := ((aValue >= l_Min) OR SameValue(aValue, l_Min)) and
            ((aValue <= l_Max) OR SameValue(aValue, l_Max));
 end;//Btwn

begin
 Result := Cross(anOther, theCross);
 if Result then
 begin
  Result := Btwn(theCross.X, Self.A.X, Self.B.X) and
            Btwn(theCross.X, anOther.A.X, anOther.B.X) and
            Btwn(theCross.Y, Self.A.Y, Self.B.Y) and
            Btwn(theCross.Y, anOther.A.Y, anOther.B.Y);
 end;//Result
end;

constructor TmsLineF.Create(const aA: TmsPointF; const aB: TmsPointF);
begin
 A := aA;
 B := aB;
end;

constructor TmsLineF.Create(const aA: TPointF; const aB: TPointF);
begin
 Create(TmsPointF.Create(aA.X, aA.Y), TmsPointF.Create(aB.X, aB.Y));
end;


constructor TmsLineF.Create(aAX, aAY: Pixel; aBX, aBY: Pixel);
begin
 Create(TmsPointF.Create(aAX, aAY), TmsPointF.Create(aBX, aBY));
end;

function TmsLineF.dX: Pixel;
begin
 Result := (B.X - A.X);
end;

function TmsLineF.dY: Pixel;
begin
 Result := (B.Y - A.Y);
end;

function TmsLineF.Length: Pixel;
begin
 Result := Sqrt(dX * dX + dY * dY);
end;

function TmsLineF.ScalarMul(const anOther: TmsLineF): Pixel;
begin
 Result := Self.dX * anOther.dX + Self.dY * anOther.dY;
end;

function TmsLineF.CosA(const anOther: TmsLineF): Single;
begin
 Result := Self.ScalarMul(anOther) / (Self.Length * anOther.Length);
end;

// TmsLineFPair

constructor TmsLineFPair.Create(const aL1: TmsLineF; const aL2: TmsLineF);
begin
 L1 := aL1;
 L2 := aL2;
end;

procedure TmsLineFPair.ToLog(aLog: TmsLog);
begin
 aLog.ToLog('L1:');
 L1.ToLog(aLog);
 aLog.ToLog('L2:');
 L2.ToLog(aLog);
end;

function TmsLineFPair.ToString: String;
begin
 Result := L1.ToString + '_' + L2.ToString;
end;

function TmsLineFPair.Cross(out theCross: TmsPointF): Boolean;
begin
 Result := L1.Cross(L2, theCross);
end;

function TmsLineFPair.SegmentsCross(out theCross: TmsPointF): Boolean;
begin
 Result := L1.SegmentsCross(L2, theCross);
end;

// TmsRectF

constructor TmsRectF.Create(const aR: TRectF);
begin
 R := aR;
end;

function TmsRectF.Cross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;
var
 l_R : array [0..3] of TmsLineF;
 l_L : TmsLineF;
begin
 Result := true;

 l_R[0] := TmsLineF.Create(TPointF.Create(R.Left, R.Top), TPointF.Create(R.Right, R.Top));
 l_R[1] := TmsLineF.Create(TPointF.Create(R.Right, R.Top), TPointF.Create(R.Right, R.Bottom));
 l_R[2] := TmsLineF.Create(TPointF.Create(R.Left, R.Bottom), TPointF.Create(R.Right, R.Bottom));
 l_R[3] := TmsLineF.Create(TPointF.Create(R.Left, R.Top), TPointF.Create(R.Left, R.Bottom));

 for l_L in l_R do
  if l_L.SegmentsCross(anOther, theCross) then
   Exit;

 Result := false;
end;

end.
