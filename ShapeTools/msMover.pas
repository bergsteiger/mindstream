unit msMover;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types,
 System.UITypes,
 msTool,
 msInterfaces,
 msShapesList
 ;

type
 TmsMover = class(TmsTool)
 private
  f_Moving : ImsShape;
  f_FloatingButtons : TmsShapesList;
  // - кнопки "плавающие" вокруг примитива f_Moving.
  //   https://bitbucket.org/ingword/mindstream/issue/43/------------------------------------------
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape);
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
  destructor Destroy; override;
  class function ButtonShape: ImsShape; override;
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

// TmsMover

constructor TmsMover.CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape);
begin
 inherited CreateInner(aStartPoint);
 f_Moving := aMoving;
end;

class function TmsMover.ButtonShape: ImsShape;
begin
 Result := TmsMoverIcon.Create(TPointF.Create(50, 50));
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

destructor TmsMover.Destroy;
begin
 inherited;
 FreeAndNil(f_FloatingButtons);
end;

function TmsMover.IsNeedsSecondClick : Boolean;
begin
 Result := true;
end;

procedure TmsMover.EndTo(const aCtx: TmsEndShapeContext);
var
 l_FloatingButton : ImsShape;
begin
 if (f_Moving <> nil) then
  f_Moving.MoveTo(aCtx.rStartPoint);
 f_Moving := nil;
 if (f_FloatingButtons <> nil) then
  for l_FloatingButton in f_FloatingButtons do
   aCtx.rShapesController.RemoveShape(l_FloatingButton);
   // - надо удалить "плавающие кнопки".
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

