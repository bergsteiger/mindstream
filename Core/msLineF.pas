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
 end;//TmsPointF

 TmsLineF = record
 public
  A : TmsPointF;
  B : TmsPointF;
  procedure ToLog(aLog: TmsLog);
 end;//TmsLineF

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

// TmsLineF

procedure TmsLineF.ToLog(aLog: TmsLog);
begin
 aLog.ToLog('dump line:');
 aLog.ToLog('A:');
 A.ToLog(aLog);
 aLog.ToLog('B:');
 B.ToLog(aLog);
end;

end.
