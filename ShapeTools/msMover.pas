unit msMover;

interface

uses
 msShape,
 FMX.Graphics,
 System.Types,
 System.UITypes,
 msTool,
 msInterfaces,
 msShapesList,
 msShapeTool
 ;

type
 TmsFloatingButton = (
  // - http://18delphi.blogspot.ru/2014/05/blog-post.html
  ms_fbLeft,
  ms_fbRight,
  ms_fbUp,
  ms_fbDown,

  ms_fbUpLeft,
  ms_fbUpRight,
  ms_fbDownLeft,
  ms_fbDownRight
 );//TmsFloatingButton

 TmsMover = class(TmsTool)
 private
  f_Moving : ImsShape;
  f_FloatingButtons : TmsShapesList;
  // - кнопки "плавающие" вокруг примитива f_Moving.
  //   https://bitbucket.org/ingword/mindstream/issue/43/------------------------------------------
  f_WasMoved : Boolean;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape; const aController: ImsShapesController);
  function AddButton(aToolClass: RmsShapeTool; const aButton: ImsShape): ImsShape;
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
  procedure Cleanup; override;
  class function ButtonShape: ImsShape; override;
  function IsNeedsSecondClick : Boolean; override;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; override;
  class function RectForButtons(const aShape: ImsShape): TRectF;
  class function BP(aButton: TmsFloatingButton; const aR: TRectF): TPointF;
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
 msCircle,
 msCircleWithRadius,
 Math,
 msProxyShape,
 msMoveShapeUp,
 msMoveShapeDown,
 msMoveShapeLeft,
 msMoveShapeRight,
 msShapeRemover,
 msRemoverIcon,
 msUpRightArrow,
 msUpLeftArrow,
 msDownRightArrow,
 msDownLeftArrow,
 msSpecialDiagonalArrowBoundsCorrector,
 msMoveShapeDownRight,
 msMoveShapeDownLeft,
 msMoveShapeUpLeft,
 msMoveShapeUpRight,
 msFloatingButtonCircle,
 msMoveShapeTool
 ;

// TmsMover

const
 cShift = 12;

function TmsMover.AddButton(aToolClass: RmsShapeTool; const aButton: ImsShape): ImsShape;
begin
 Assert(f_FloatingButtons <> nil);
 Result := f_FloatingButtons.AddShape(
            aToolClass.Create(
             f_Moving,
             TmsShapesGroup.Create([
              TmsFloatingButtonCircle.Create(aButton, cShift),
              aButton
             ])
            )
           );
end;

class function TmsMover.RectForButtons(const aShape: ImsShape): TRectF;
var
 l_Offset : Single;
begin
 Result := aShape.DrawBounds;
 l_Offset := TmsSpecialArrow.InitialLength + cShift;

 Result.Inflate(l_Offset, l_Offset);
end;

class function TmsMover.BP(aButton: TmsFloatingButton; const aR: TRectF): TPointF;
var
 l_Mid : TPointF;
begin
 l_Mid := (aR.TopLeft + aR.BottomRight) / 2;

 case aButton of
  ms_fbLeft:
   Result := TPointF.Create(aR.Left, l_Mid.Y);
  ms_fbRight:
   Result := TPointF.Create(aR.Right, l_Mid.Y);
  ms_fbUp:
   Result := TPointF.Create(l_Mid.X, aR.Top);
  ms_fbDown:
   Result := TPointF.Create(l_Mid.X, aR.Bottom);

  ms_fbUpLeft:
   Result := TPointF.Create(aR.Left, aR.Top);
  ms_fbUpRight:
   Result := TPointF.Create(aR.Right, aR.Top);
  ms_fbDownLeft:
   Result := TPointF.Create(aR.Left, aR.Bottom);
  ms_fbDownRight:
   Result := TPointF.Create(aR.Right, aR.Bottom);
  else
   Assert(false);
 end;//case aButton
end;

constructor TmsMover.CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape; const aController: ImsShapesController);

 function AddDButton(aButtonDesc: TmsFloatingButton; aToolClass: RmsShapeTool; const aButton: ImsShape): ImsShape;
 begin//AddDButton
  if (aButtonDesc in [ms_fbLeft..ms_fbDown]) then
   Result := AddButton(aToolClass, aButton)
  else
   Result := AddButton(aToolClass, TmsSpecialDiagonalArrowBoundsCorrector.Create(aButton));
 end;//AddDButton

const
 cShapeTool : array [TmsFloatingButton] of RmsMoveShapeTool = (
  TmsMoveShapeLeft,
  TmsMoveShapeRight,
  TmsMoveShapeUp,
  TmsMoveShapeDown,

  TmsMoveShapeUpLeft,
  TmsMoveShapeUpRight,
  TmsMoveShapeDownLeft,
  TmsMoveShapeDownRight
 );

 cShapeArrow : array [TmsFloatingButton] of RmsSpecialArrow = (
  TmsLeftArrow,
  TmsRightArrow,
  TmsUpArrow,
  TmsDownArrow,

  TmsUpLeftArrow,
  TmsUpRightArrow,
  TmsDownLeftArrow,
  TmsDownRightArrow
 );
var
 l_B : TRectF;
 l_FB : TmsFloatingButton;
begin
 inherited CreateInner(aStartPoint);
 f_Moving := aMoving;
 Assert(f_FloatingButtons = nil);
 f_FloatingButtons := TmsShapesList.Create;
 l_B := RectForButtons(f_Moving);
 for l_FB := Low(TmsFloatingButton) to High(TmsFloatingButton) do
  aController.AddShape(AddDButton(l_FB, cShapeTool[l_FB], cShapeArrow[l_FB].Create(BP(l_FB, l_B))));
end;

class function TmsMover.ButtonShape: ImsShape;
begin
 Result := TmsMoverIcon.Create;
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

procedure TmsMover.Cleanup;
begin
 inherited;
 FreeAndNil(f_FloatingButtons);
end;

function TmsMover.IsNeedsSecondClick : Boolean;
begin
 Result := true;
end;

function TmsMover.EndTo(const aCtx: TmsEndShapeContext): Boolean;
var
 l_ShapeOnPoint : ImsShape;
 l_FloatingButton : ImsShape;
begin
 Result := true;
 if (f_Moving <> nil) then
 begin
  l_ShapeOnPoint := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
  if (l_ShapeOnPoint <> nil) then
   if l_ShapeOnPoint.ClickInDiagramm then
   begin
    f_WasMoved := true;
    Result := false;
   end;//l_ShapeOnPoint.ClickInDiagramm
  if not f_WasMoved then
   if Result then
    f_Moving.MoveTo(aCtx.rStartPoint);
 end;//f_Moving <> nil
 if Result then
 begin
  f_Moving := nil;
  if (f_FloatingButtons <> nil) then
   for l_FloatingButton in f_FloatingButtons do
    aCtx.rShapesController.RemoveShape(l_FloatingButton);
    // - надо удалить "плавающие кнопки".
  aCtx.rShapesController.RemoveShape(Self);
  // - теперь надо —≈Ѕя удалить
 end;//Result
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

