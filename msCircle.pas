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
  procedure DrawShape(const aCanvas : TCanvas; const aOrigin : TPointF); override;
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
 inherited;
end;

procedure TmsCircle.DrawShape(const aCanvas: TCanvas; const aOrigin : TPointF);
var
 l_StartPoint, l_FinalPoint: TPointF;
begin
 l_StartPoint.X := FStartPoint.X - c_CircleRadius;
 l_StartPoint.Y := FStartPoint.Y - c_CircleRadius;

 l_FinalPoint.X := FStartPoint.X + c_CircleRadius;
 l_FinalPoint.Y := FStartPoint.Y + c_CircleRadius;

 aCanvas.DrawEllipse(TRectF.Create(l_StartPoint.Add(aOrigin),
                                   l_FinalPoint.Add(aOrigin)), 1);

 aCanvas.DrawEllipse(TRectF.Create(FStartPoint.add(aOrigin),
                                   FFinishPoint.add(aOrigin)),
                                   1);
end;

class function TmsCircle.IsNeedsSecondClick: Boolean;
begin
 Result := False;
end;

end.
