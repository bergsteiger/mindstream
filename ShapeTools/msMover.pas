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
  constructor CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape; const aController: ImsShapesController);
  function AddButton(const aButton: ImsShape): ImsShape;
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
 msLineWithArrow,
 msSpecialArrow,
 msUpArrow,
 msDownArrow,
 msLeftArrow,
 msRightArrow,
 msShapesGroup,
 msCircle
 ;

// TmsMover

function TmsMover.AddButton(const aButton: ImsShape): ImsShape;
begin
 Assert(f_FloatingButtons <> nil);
 Result := f_FloatingButtons.AddShape(TmsShapesGroup.Create([
            TmsCircle.Create(aButton.StartPoint),
            aButton
            ]));
end;

constructor TmsMover.CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape; const aController: ImsShapesController);
var
 l_B : TRectF;
 l_Mid : TPointF;
begin
 inherited CreateInner(aStartPoint);
 f_Moving := aMoving;
 Assert(f_FloatingButtons = nil);
 f_FloatingButtons := TmsShapesList.Create;
 l_B := f_Moving.DrawBounds;
 l_Mid.X := (l_B.Left + l_B.Right) / 2;
 l_Mid.Y := (l_B.Top + l_B.Bottom) / 2;
 aController.AddShape(AddButton(TmsUpArrow.Create(TPointF.Create(l_Mid.X, l_B.Top - TmsSpecialArrow.InitialLength))));
 aController.AddShape(AddButton(TmsDownArrow.Create(TPointF.Create(l_Mid.X, l_B.Bottom))));
 aController.AddShape(AddButton(TmsLeftArrow.Create(TPointF.Create(l_B.Left - TmsSpecialArrow.InitialLength, l_Mid.Y))));
 aController.AddShape(AddButton(TmsRightArrow.Create(TPointF.Create(l_B.Right, l_Mid.Y))));
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
 begin
  Result := CreateInner(aCtx.rStartPoint, l_Moving, aCtx.rShapesController);
 end//l_Moving <> nil
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

