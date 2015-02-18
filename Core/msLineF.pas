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
 end;//TmsPointF

 TmsLineF = record
 public
  procedure ToLog(aLog: TmsLog);
 end;//TmsLineF

implementation

// TmsPointF

constructor TmsPointF.Create(const aPoint: TPointF);
begin
 P := aPoint;
end;

constructor TmsPointF.Create(aX: Pixel; aY: Pixel);
begin
 Create(TPointF.Create(aX, aY));
end;

// TmsLineF

procedure TmsLineF.ToLog(aLog: TmsLog);
begin
 aLog.ToLog('dump line');
end;

end.
