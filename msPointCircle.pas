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
  class function IsNeedsSecondClick : Boolean; override;
 end;

implementation

{ TmsPointCircle }

const
 c_CircleRadius = 10;

procedure TmsPointCircle.DrawTo(const aCanvas: TCanvas;
                                   const aOrigin : TPointF);
var
 l_StartPoint, l_FinalPoint: TPointF;
begin
 l_StartPoint.X := StartPoint.X - c_CircleRadius;
 l_StartPoint.Y := StartPoint.Y - c_CircleRadius;

 l_FinalPoint.X := StartPoint.X + c_CircleRadius;
 l_FinalPoint.Y := StartPoint.Y + c_CircleRadius;

 aCanvas.DrawEllipse(TRectF.Create(l_StartPoint.Add(aOrigin),
                                   l_FinalPoint.Add(aOrigin)), 1);
end;

class function TmsPointCircle.IsNeedsSecondClick: Boolean;
begin
  Result := False;
end;

end.
