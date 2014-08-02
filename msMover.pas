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
  FListWithOtherShapes : TmsShapeList;
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
{ TmsMover }

constructor TmsMover.Create(const aStartPoint: TPointF;
  aListWithOtherShapes: TmsShapeList);
begin
 inherited;
 FListWithOtherShapes := aListWithOtherShapes;
end;

procedure TmsMover.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Finish : TPointF;
 l_Ctx : TmsDrawContext;
begin
 inherited;
 aCtx.rCanvas.Fill.Color := FillColor;
 // l_Ctx.rMoving := true;
 // А вот тут надо вызвать f_Moving.DrawTo(l_Ctx);
 l_Ctx := aCtx;
 l_Ctx.rMoving := True;

 f_Moving := ShapeByPt(StartPoint, FListWithOtherShapes);
 if (f_Moving<>nil) then
  f_Moving.DrawTo(l_Ctx);

 DoDrawDebugInfo(l_Ctx.rCanvas, ClassName);

 {l_Finish := TPointF.Create(StartPoint.X + 150,
                            StartPoint.Y + 150);

  aCtx.rCanvas.DrawRect(TRectF.Create(StartPoint,
                                l_Finish),
                                0,
                                0,
                                AllCorners,
                                0.5,
                                TCornerType.ctRound);

 aCtx.rCanvas.FillRect(TRectF.Create(StartPoint,
                                l_Finish),
                                0,
                                0,
                                AllCorners,
                                0.5,
                                TCornerType.ctRound);    }
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
