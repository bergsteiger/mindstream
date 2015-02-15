unit msMover;

interface

uses
 System.Types,
 msShape,
 FMX.Graphics,
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
  f_Point : TPointF;
 private
  f_Moving : ImsShape;
  f_FloatingButtons : TmsShapesList;
  // - кнопки "плавающие" вокруг примитива f_Moving.
  //   https://bitbucket.org/ingword/mindstream/issue/43/------------------------------------------
  f_WasMoved : Boolean;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  constructor CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape; const aController: ImsShapesController); reintroduce;
  function AddButton(aToolClass: RmsShapeTool; const aButton: ImsShape): ImsShape;
  procedure CreateFloatingButtons(const aController: ImsShapesController);
  procedure MouseMove(const aClickContext: TmsEndShapeContext); override;
  function MouseUp(const aClickContext: TmsEndShapeContext): Boolean; override;
  function GetDrawBounds: TRectF; override;
  procedure MoveTo(const aStartPoint: TPointF; const aFinishPoint: TPointF); override;
  procedure MoveMovingTo(const aPoint: TPointF);
  function pm_GetStartPoint: TPointF; override;
  procedure SetStartPoint(const aStartPoint: TPointF); override;
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
  procedure Cleanup; override;
  class function ButtonShape: ImsShape; override;
  function IsNeedsSecondClick : Boolean; override;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; override;
  class function RectForButtons(const aShape: ImsShape): TRectF;
  class function BP(aButton: TmsFloatingButton; const aR: TRectF): TPointF;
  class function ButtonPoint(aButton: TmsFloatingButton; const aShape: ImsShape): TPointF;
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
 msMoveShapeTool,
 msScalingShape,
 msMoveIcon,
 msMovingPointer
 ;

// TmsMover

const
 cShift = 12;

function TmsMover.AddButton(aToolClass: RmsShapeTool; const aButton: ImsShape): ImsShape;
begin
 Assert(f_FloatingButtons <> nil);
 Result := f_FloatingButtons.AddShape(
            aToolClass.Create(
             {Self}f_Moving,
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

class function TmsMover.ButtonPoint(aButton: TmsFloatingButton; const aShape: ImsShape): TPointF;
begin
 Assert(aShape <> nil);
 Result := BP(aButton, RectForButtons(aShape));
end;

procedure TmsMover.CreateFloatingButtons(const aController: ImsShapesController);

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
 l_FB : TmsFloatingButton;
begin
 Assert(f_FloatingButtons = nil);
 f_FloatingButtons := TmsShapesList.Create;
 for l_FB := Low(TmsFloatingButton) to High(TmsFloatingButton) do
  aController.AddShape(AddDButton(l_FB,
                                  cShapeTool[l_FB],
                                  cShapeArrow[l_FB].Create(ButtonPoint(l_FB, f_Moving))));
                                  // - тут на самом деле надо не f_Moving а Self
                                  // А Move - переопределить
                                  // Тогда починятся:
                                  // https://bitbucket.org/ingword/mindstream/issue/143/tmsline
                                  // https://bitbucket.org/ingword/mindstream/issue/145/------------------------------
end;

function TmsMover.GetDrawBounds: TRectF;
begin
 Assert(f_Moving <> nil);
 Result := f_Moving.DrawBounds;
end;

procedure TmsMover.MoveTo(const aStartPoint: TPointF; const aFinishPoint: TPointF);
begin
 Assert(f_Moving <> nil);
 f_Moving.MoveTo(f_Point, aFinishPoint);
 //f_Moving.MoveTo(f_Point, f_Moving.StartPoint + (aPoint - f_Point));
 //- так конечно правильнее, но для линии это НЕ РАБОТАЕТ
 //  Надо делать MoveBy
 // Хотя и БЕЗ MoveBy можно обойтись - вычисляя дельту внутри
 // Только тогда надо будет ещь про EndTo - не забыть, что там как раз НЕ дельта.
 f_Point := aFinishPoint;
 inherited;
end;

procedure TmsMover.MoveMovingTo(const aPoint: TPointF);
begin
 Assert(f_Moving <> nil);
 f_Moving.MoveTo(f_Point, aPoint);
 //f_Moving.MoveTo(f_Point, f_Moving.StartPoint + (aPoint - f_Point));
 //- так конечно правильнее, но для линии это НЕ РАБОТАЕТ
 //  Надо делать MoveBy
 // Хотя и БЕЗ MoveBy можно обойтись - вычисляя дельту внутри
 // Только тогда надо будет ещь про EndTo - не забыть, что там как раз НЕ дельта.
 f_Point := aPoint;
end;

function TmsMover.pm_GetStartPoint: TPointF;
begin
 Result := f_Point;
end;

procedure TmsMover.SetStartPoint(const aStartPoint: TPointF);
begin
 f_Point := aStartPoint;
end;

procedure TmsMover.MouseMove(const aClickContext: TmsEndShapeContext);
begin
 if (f_FloatingButtons = nil) then
 begin
  f_WasMoved := true;
  MoveMovingTo(aClickContext.rStartPoint);
  aClickContext.rShapesController.Invalidate;
 end;//f_FloatingButtons = nil
end;

function TmsMover.MouseUp(const aClickContext: TmsEndShapeContext): Boolean;
begin
 Result := false;
 if f_WasMoved then
 begin
  if (f_FloatingButtons = nil) then
  begin
   aClickContext.rShapesController.RemoveShape(Self);
   Result := true;
  end;//f_FloatingButtons = nil
 end//f_WasMoved
 else
 if (f_FloatingButtons = nil) then
 begin
  CreateFloatingButtons(aClickContext.rShapesController);
  aClickContext.rShapesController.Invalidate;
 end;//f_FloatingButtons = nil
end;

constructor TmsMover.CreateInner(const aStartPoint: TPointF; const aMoving: ImsShape; const aController: ImsShapesController);
begin
 Assert(aMoving <> nil);
 f_Moving := aMoving;
 inherited CreateInner(TmsMakeShapeContext.Create(aStartPoint, aController, nil));
 Assert(aController <> nil);
 //CreateFloatingButtons(aController);
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
  Assert(aCtx.rShapesController <> nil);
  l_ShapeOnPoint := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
  if (l_ShapeOnPoint <> nil) then
   if l_ShapeOnPoint.ClickInDiagramm then
   begin
    f_WasMoved := true;
    Result := false;
   end;//l_ShapeOnPoint.ClickInDiagramm
  if not f_WasMoved then
   if Result then
    MoveMovingTo(aCtx.rStartPoint);
 end;//f_Moving <> nil
 if Result then
 begin
  f_Moving := nil;
  if (f_FloatingButtons <> nil) then
   for l_FloatingButton in f_FloatingButtons do
    aCtx.rShapesController.RemoveShape(l_FloatingButton);
    // - надо удалить "плавающие кнопки".
  FreeAndNil(f_FloatingButtons);
  aCtx.rShapesController.RemoveShape(Self);
  // - теперь надо СЕБЯ удалить
 end;//Result
end;

procedure TmsMover.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Ctx : TmsDrawContext;
 l_Moving : Boolean;
var
 l_Proxy : ImsShape;
begin
 if (f_Moving <> nil) then
 begin
  l_Ctx := aCtx;
  l_Moving := l_Ctx.rMoving;
  l_Ctx.rMoving := true;
  try
   f_Moving.DrawTo(l_Ctx);
  finally
   l_Ctx.rMoving := l_Moving;
  end;//try..finally
  if (f_FloatingButtons = nil) OR (f_Moving.IsNeedsSecondClick) then
  begin
   l_Proxy := TmsMovingPointer.Create(Self.StartPoint);
   // - люблю я Self.XXX. Мне лично так понятнее. Да и with - меньше лажает.
   try
    l_Proxy.DrawTo(aCtx);
   finally
    l_Proxy := nil;
   end;///try..fianlly
  end;//f_FloatingButtons = nil
 end;//f_Moving <> nil
end;

end.

