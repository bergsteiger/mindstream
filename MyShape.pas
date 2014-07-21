unit MyShape;

interface
uses
 FMX.Graphics, System.Types, FMX.Types, Generics.Collections, System.SysUtils;

const
 c_CircleRadius = 10;

type
 TmsShape = class
 private
  FStartPoint, FFinalPoint: TPointF;
  procedure DrawShape(const aCanvas : TCanvas); virtual; abstract;
 public
  Constructor Create(const aStartPoint, aFinalPoint: TPointF); overload;
  procedure DrawTo(const aCanvas : TCanvas);
 end;

 TmsLine = class(TmsShape)
 private
   procedure DrawShape(const aCanvas : TCanvas); override;
 end;

 TmsRectangle = class(TmsShape)
 private
   procedure DrawShape(const aCanvas : TCanvas); override;
 end;

 TmsPointCircle = class(TmsShape)
 private
   procedure DrawShape(const aCanvas : TCanvas); override;
 end;

implementation

constructor TmsShape.Create(const aStartPoint, aFinalPoint: TPointF);
begin
 FStartPoint := aStartPoint;
 FFinalPoint := aFinalPoint;
end;

procedure TmsShape.DrawTo(const aCanvas: TCanvas);
begin
  aCanvas.BeginScene;
  DrawShape(aCanvas);
  aCanvas.EndScene;
end;

{ TLine }

procedure TmsLine.DrawShape(const aCanvas : TCanvas);
begin
 aCanvas.DrawLine(FStartPoint, FFinalPoint, 1);
end;

{ TRectangle }

procedure TmsRectangle.DrawShape(const aCanvas: TCanvas);
begin
 aCanvas.DrawRect(TRectF.Create(FStartPoint, FFinalPoint),
                                0, 0,
                                AllCorners, 1,
                                TCornerType.ctRound);
end;

{ TPointRound }

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
