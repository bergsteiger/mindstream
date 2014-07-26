unit msPointCircle;

interface

uses
 FMX.Graphics,
 System.Types,
 msShape;

type
 TmsPointCircle = class(TmsShape)
 protected
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); override;
 end;

implementation

{ TmsPointCircle }

const
 c_CircleRadius = 10;

constructor TmsPointCircle.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 inherited Create(TPointF.Create(aStartPoint.X - c_CircleRadius, aStartPoint.Y - c_CircleRadius),
                  TPointF.Create(aStartPoint.X + c_CircleRadius, aStartPoint.Y + c_CircleRadius));
end;

procedure TmsPointCircle.DrawTo(const aCanvas: TCanvas;
                                const aOrigin : TPointF);
begin
 aCanvas.DrawEllipse(TRectF.Create(StartPoint.Add(aOrigin),
                                   FinishPoint.Add(aOrigin)), 1);
end;

end.
