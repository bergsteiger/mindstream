unit msShape;

interface
uses
 FMX.Graphics,
 System.Types,
 FMX.Types;

type
 TmsShape = class
 protected
  FStartPoint, FFinalPoint: TPointF;
  procedure DrawShape(const aCanvas : TCanvas); virtual; abstract;
 public
  Constructor Create(const aStartPoint, aFinalPoint: TPointF); overload;
  procedure DrawTo(const aCanvas : TCanvas);
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



end.
