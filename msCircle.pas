unit msCircle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types;

type
 TmsCircle = class(TmsShape)
 protected
  class function Radius: Integer; virtual;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); override;
 end;

implementation

{ TmsCircle }

class function TmsCircle.Radius: Integer;
begin
 Result := 50;
end;

constructor TmsCircle.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 inherited Create(TPointF.Create(aStartPoint.X - Radius, aStartPoint.Y - Radius),
                  TPointF.Create(aStartPoint.X + Radius, aStartPoint.Y + Radius));
end;

procedure TmsCircle.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 aCanvas.DrawEllipse(TRectF.Create(StartPoint.Add(aOrigin),
                                   FinishPoint.Add(aOrigin)), 1);
end;

end.
