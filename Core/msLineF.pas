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
   read P.X;
  property Y: Pixel
   read P.Y;
 end;//TmsPointF

 TmsLineF = record
 public
  A : TmsPointF;
  B : TmsPointF;
  procedure ToLog(aLog: TmsLog);
  function ToString: String;
  function Cross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;
 end;//TmsLineF

 TmsLineFPair = record
 public
  L1 : TmsLineF;
  L2 : TmsLineF;
  constructor Create(const aL1: TmsLineF; const aL2: TmsLineF);
 end;//TmsLineFPair

implementation

uses
 System.SysUtils
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

function TmsLineF.Cross(const anOther: TmsLineF; out theCross: TmsPointF): Boolean;
begin
 Result := false;
 theCross := TmsPointF.Create(High(Integer), High(Integer));
end;

// TmsLineFPair

constructor TmsLineFPair.Create(const aL1: TmsLineF; const aL2: TmsLineF);
begin
 L1 := aL1;
 L2 := aL2;
end;

end.
