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
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); override;
  class function IsNeedsSecondClick : Boolean; override;
 end;

implementation

const
 c_CircleRadius = 50;

{ TmsCircle }

constructor TmsCircle.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 inherited Create(TPointF.Create(aStartPoint.X - c_CircleRadius, aStartPoint.Y - c_CircleRadius),
                  TPointF.Create(aStartPoint.X + c_CircleRadius, aStartPoint.Y + c_CircleRadius));
end;

procedure TmsCircle.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
begin
 aCanvas.DrawEllipse(TRectF.Create(StartPoint.Add(aOrigin),
                                   FinishPoint.Add(aOrigin)), 1);

end;

class function TmsCircle.IsNeedsSecondClick: Boolean;
begin
 Result := False;
end;

end.
