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
  f_Moving : ImsShape;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape);
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
  function IsNeedsSecondClick : Boolean; override;
  procedure EndTo(const aCtx: TmsEndShapeContext); override;
  class function IsTool: Boolean; override;
 end;//TmsMover

implementation

uses
 msRectangle,
 FMX.Types,
 System.SysUtils;

constructor TmsMover.CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape);
begin
 inherited CreateInner(aStartPoint);
 f_Moving := aMoving;
end;

class function TmsMover.Create(const aCtx: TmsMakeShapeContext): ImsShape;
var
 l_Moving : ImsShape;
begin
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

class function TmsMover.IsTool: Boolean;
begin
 Result := true;
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
