unit msMover;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types,
 System.UITypes,
 msTool,
 msInterfaces
 ;

type
 TmsMover = class(TmsTool)
 private
  f_Moving : ImsShape;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape);
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
  class function ButtonShape(const aStartPoint: TPointF): ImsShape; override;
  function IsNeedsSecondClick : Boolean; override;
  procedure EndTo(const aCtx: TmsEndShapeContext); override;
 end;//TmsMover

implementation

uses
 msBlackTriangle,
 FMX.Types,
 System.SysUtils,
 msMoverIcon,
 msLineWithArrow
 ;

constructor TmsMover.CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape);
begin
 inherited CreateInner(aStartPoint);
 f_Moving := aMoving;
end;

class function TmsMover.ButtonShape(const aStartPoint: TPointF): ImsShape;
begin
// Result := TmsMoverIcon.CreateInner(TPointF.Create(50, 50));
 Result := TmsLineWithArrow.CreateCompleted(TPointF.Create(50, 50), TPointF.Create(0, 0));
end;

class function TmsMover.Create(const aCtx: TmsMakeShapeContext): ImsShape;
var
 l_Moving : ImsShape;
begin
 Assert(aCtx.rShapesController <> nil);
 l_Moving := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
 if (l_Moving <> nil) then
  Result := CreateInner(aCtx.rStartPoint, l_Moving)
 else
  Result := nil;
end;

function TmsMover.IsNeedsSecondClick : Boolean;
begin
 Result := true;
end;

procedure TmsMover.EndTo(const aCtx: TmsEndShapeContext);
begin
 if (f_Moving <> nil) then
  f_Moving.MoveTo(aCtx.rStartPoint);
 f_Moving := nil;
 aCtx.rShapesController.RemoveShape(Self);
 // - теперь надо —≈Ѕя удалить
end;

procedure TmsMover.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Ctx : TmsDrawContext;
begin
 if (f_Moving <> nil) then
 begin
  l_Ctx := aCtx;
  l_Ctx.rMoving := True;
  f_Moving.DrawTo(l_Ctx);
 end;//f_Moving <> nil
end;

end.

