unit msMover;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types,
 System.UITypes
 ;

type
 TmsMover = class(TmsShape)
 private
  f_Moving : TmsShape;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function StrokeDash: TStrokeDash; override;
  function FillColor: TAlphaColor; override;
  function StrokeColor: TAlphaColor; override;
  function StrokeThickness: Single; override;
 public
  constructor Create(const aStartPoint: TPointF; aListWithOtherShapes: TmsShapeList); override;
 end;//TmsMover

implementation

uses
 msRectangle,
 FMX.Types,
 System.SysUtils;

constructor TmsMover.Create(const aStartPoint: TPointF;
  aListWithOtherShapes: TmsShapeList);
begin
 inherited;
 f_Moving := ShapeByPt(aStartPoint, aListWithOtherShapes);
end;

procedure TmsMover.DoDrawTo(const aCtx: TmsDrawContext);
var
 //l_Finish : TPointF;
 l_Ctx : TmsDrawContext;
begin
 inherited;
 //aCtx.rCanvas.Fill.Color := FillColor;

 if (f_Moving <> nil) then
 begin
  l_Ctx := aCtx;
  l_Ctx.rMoving := True;
  f_Moving.DrawTo(l_Ctx);
 end;//f_Moving <> nil

 //DoDrawDebugInfo(l_Ctx.rCanvas, ClassName);
end;

function TmsMover.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Darkred;
end;

function TmsMover.StrokeColor: TAlphaColor;
begin
 Result := TAlphaColors.Darkmagenta;
end;

function TmsMover.StrokeDash: TStrokeDash;
begin
 Result :=  TStrokeDash.sdDashDot;
end;

function TmsMover.StrokeThickness: Single;
begin
 Result := 4;
end;

initialization
 TmsMover.Register;

end.
