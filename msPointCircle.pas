unit msPointCircle;

interface

uses
 FMX.Graphics,
 System.Types,
 msShape;
const
 c_CircleRadius = 10;

type
 TmsPointCircle = class(TmsShape)
 private
   procedure DrawShape(const aCanvas : TCanvas); override;
 end;

implementation

{ TmsPointCircle }

procedure TmsPointCircle.DrawShape(const aCanvas: TCanvas);
var
 l_StartPoint, l_FinalPoint: TPointF;
begin
 l_StartPoint.X := FStartPoint.X - c_CircleRadius;
 l_StartPoint.Y := FStartPoint.Y - c_CircleRadius;

 l_FinalPoint.X := FStartPoint.X + c_CircleRadius;
 l_FinalPoint.Y := FStartPoint.Y + c_CircleRadius;

 aCanvas.DrawEllipse(TRectF.Create(l_StartPoint, l_FinalPoint), 1);
end;

end.
