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
  class function IsNeedsSecondClick : Boolean; override;
 end;

implementation

const
 c_CircleRadius = 50;

{ TmsCircle }

procedure TmsCircle.DrawTo(const aCanvas: TCanvas; const aOrigin : TPointF);
var
 l_StartPoint, l_FinalPoint: TPointF;
begin
 l_StartPoint := TPointF.Create(FStartPoint.X - c_CircleRadius, FStartPoint.Y - c_CircleRadius);
 l_FinalPoint := TPointF.Create(FStartPoint.X + c_CircleRadius, FStartPoint.Y + c_CircleRadius);

 aCanvas.DrawEllipse(TRectF.Create(l_StartPoint.Add(aOrigin),
                                   l_FinalPoint.Add(aOrigin)), 1);

end;

class function TmsCircle.IsNeedsSecondClick: Boolean;
begin
 Result := False;
end;

end.
