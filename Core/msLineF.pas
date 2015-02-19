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
begin//DoCross
 Assert(not IsZero(Self.dY));
 dXdY := Self.dX * anOther.dY;
 theCross.Y := (dXdY * Self.A.Y
                 - anOther.dX * Self.dY * anOther.A.Y
                 + (anOther.A.X - Self.A.X) * Self.dY * anOther.dY) /
               (dXdY - anOther.dX * Self.dY);
 theCross.X := Self.dX * (theCross.Y - Self.A.Y) / Self.dY + Self.A.X;
end;//DoCross

function TmsLineF.Cross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;
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

 // ƒальше нужно проверить параллельность пр€мых
 if IsZero(ArcCos(Self.CosA(anOther))) then
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
   DoCross(anOther, Self, theCross);
   Result := true;
   Exit;
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

 // ƒальше можно по идее примен€ть ћишин алгоритм:

 DoCross(Self, anOther, theCross);
 Result := true;
end;

function TmsLineF.SegmentsCross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;
begin
 Result := Cross(anOther, theCross);
end;

constructor TmsLineF.Create(const aA: TmsPointF; const aB: TmsPointF);
begin
 A := aA;
 B := aB;
end;

constructor TmsLineF.Create(aAX, aAY: Pixel; aBX, aBY: Pixel);
begin
 Create(TmsPointF.Create(aAX, aAY), TmsPointF.Create(aBX, aBY));
end;

function TmsLineF.dX: Pixel;
begin
 Result := B.X - A.X;
end;

function TmsLineF.dY: Pixel;
begin
 Result := B.Y - A.Y;
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

end.
