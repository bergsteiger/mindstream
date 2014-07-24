unit msLine;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types
 ;

type
 TmsLine = class(TmsShape)
 private
  FFinishPoint: TPointF;
 protected
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
  property FinishPoint : TPointF Read FFinishPoint;
 public
  class function IsNeedsSecondClick : Boolean; override;
  procedure EndTo(const aFinishPoint: TPointF); override;
  constructor Create(const aStartPoint: TPointF); override;
 end;

implementation

uses
 SysUtils,
 msPointCircle
 ;

constructor TmsLine.Create(const aStartPoint: TPointF);
begin
 inherited;
 FFinishPoint := aStartPoint;
end;

procedure TmsLine.EndTo(const aFinishPoint: TPointF);
begin
 FFinishPoint := aFinishPoint;
end;

procedure TmsLine.DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
var
 l_Proxy : TmsShape;
begin
 if (StartPoint = FFinishPoint) then
 begin
  l_Proxy := TmsPointCircle.Create(StartPoint);
  try
   l_Proxy.DrawTo(aCanvas, aOrigin);
  finally
   FreeAndNil(l_Proxy);
  end;//try..finally
 end//StartPoint = FinishPoint
 else
  aCanvas.DrawLine(StartPoint.Add(aOrigin),
                   FFinishPoint.Add(aOrigin), 1);
end;

class function TmsLine.IsNeedsSecondClick: Boolean;
begin
 Result := True;
end;

initialization
 TmsLine.Register;

end.
