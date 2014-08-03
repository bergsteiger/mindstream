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
  f_ListWithOtherShapes : TmsShapeList;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor Create(const aStartPoint: TPointF; aListWithOtherShapes: TmsShapeList; aMoving: TmsShape);
 public
  class function Make(const aStartPoint: TPointF; aListWithOtherShapes: TmsShapeList): TmsShape; override;
  class function IsNeedsSecondClick : Boolean; override;
  procedure EndTo(const aFinishPoint: TPointF); override;
 end;//TmsMover

implementation

uses
 msRectangle,
 FMX.Types,
 System.SysUtils;

constructor TmsMover.Create(const aStartPoint: TPointF; aListWithOtherShapes: TmsShapeList; aMoving: TmsShape);
begin
 inherited Create(aStartPoint);
 f_ListWithOtherShapes := aListWithOtherShapes;
 f_Moving := aMoving;
end;

class function TmsMover.Make(const aStartPoint: TPointF;
  aListWithOtherShapes: TmsShapeList): TmsShape;
var
 l_Moving : TmsShape;
begin
 Result := nil;
 l_Moving := ShapeByPt(aStartPoint, aListWithOtherShapes);
 if (l_Moving <> nil) then
 begin
  Result := Create(aStartPoint, aListWithOtherShapes, l_Moving);
 end;//l_Moving <> nil
end;

class function TmsMover.IsNeedsSecondClick : Boolean;
begin
 Result := true;
end;

procedure TmsMover.EndTo(const aFinishPoint: TPointF);
begin
 if (f_Moving <> nil) then
  f_Moving.MoveTo(aFinishPoint);
 f_ListWithOtherShapes.Remove(Self);
 // - теперь надо —≈Ѕя удалить
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

initialization
 TmsMover.Register;

end.
