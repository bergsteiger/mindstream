unit msConnector;

interface

uses
 System.Types,
 msInterfaces,
 msLine,
 msLineWithArrow,
 Data.DBXJSONReflect
 ;

type
 TmsConnector = class(TmsLineWithArrow{TmsLine})
 strict private
  [JSONMarshalled(False)]
  f_LeftShape : ImsShape;
  [JSONMarshalled(False)]
  f_RightShape : ImsShape;
  f_UIDLeft : TmsShapeUID;
  f_UIDRight : TmsShapeUID;
 private
  function pm_GetLeftShape: ImsShape;
  property LeftShape : ImsShape
   read pm_GetLeftShape;
  function pm_GetRightShape: ImsShape;
  property RightShape : ImsShape
   read pm_GetRightShape;
 protected
  constructor CreateInner(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext); override;
  procedure SetStartPoint(const aStartPoint: TPointF); override;
  function pm_GetStartPoint: TPointF; override;
  function pm_GetFinishPoint: TPointF; override;
  function HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean; override;
  procedure MoveBy(const aCtx: TmsMoveContext); override;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; override;
  class function BoundByContext(const aCtx: TmsMakeShapeContext): ImsShape;
 public
  class function IsConnectorLike: Boolean; override;
 end;//TmsConnector

implementation

uses
  msLineF,
  msTotalShapesList
  ;

// TmsConnector

class function TmsConnector.BoundByContext(const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
 if (Result <> nil) then
  if Result.ShapeClass.IsLineLike then
  // - линии не будем привязывать к линиям
   Result := nil;
end;

constructor TmsConnector.CreateInner(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext);
begin
 inherited;
 if (aCtx.rShapesController <> nil) then
 begin
  f_LeftShape := BoundByContext(aCtx);
  if (f_LeftShape <> nil) then
   f_UIDLeft := f_LeftShape.UID;
 end;//aCtx.rShapesController <> nil
end;

function TmsConnector.pm_GetLeftShape: ImsShape;
begin
 if (f_LeftShape = nil) then
  if not f_UIDLeft.IsNull then
   f_LeftShape := TmsTotalShapesList.ShapeByUID(f_UIDLeft);
 Result := f_LeftShape;
end;

function TmsConnector.pm_GetRightShape: ImsShape;
begin
 if (f_RightShape = nil) then
  if not f_UIDRight.IsNull then
   f_RightShape := TmsTotalShapesList.ShapeByUID(f_UIDRight);
 Result := f_RightShape;
end;

procedure TmsConnector.SetStartPoint(const aStartPoint: TPointF);
begin
 inherited;
end;

function TmsConnector.pm_GetStartPoint: TPointF;
var
 l_A : TPointF;
 l_B : TPointF;
 l_R : TmsPointF;
begin
 if (LeftShape <> nil) then
 begin
  l_A := LeftShape.StartPoint;
  if (RightShape <> nil) then
   l_B := RightShape.StartPoint
  else
   l_B := inherited pm_GetFinishPoint;
  if TmsRectF.Create(LeftShape.DrawBounds).Cross(TmsLineF.Create(l_A, l_B), l_R) then
   Result := l_R.P
  else
   Result := l_A;
 end//LeftShape <> nil
 else
  Result := inherited;
end;

function TmsConnector.pm_GetFinishPoint: TPointF;
var
 l_A : TPointF;
 l_B : TPointF;
 l_R : TmsPointF;
begin
(* if (inherited pm_GetStartPoint = inherited pm_GetFinishPoint) then
 begin
  Result := inherited pm_GetStartPoint;
  Exit;
 end;//inherited pm_GetStartPoint = inherited pm_GetFinishPoint*)
 if (RightShape <> nil) then
 begin
  l_B := RightShape.StartPoint;
  if (LeftShape <> nil) then
   l_A := LeftShape.StartPoint
  else
   l_A := inherited pm_GetStartPoint;
  if TmsRectF.Create(RightShape.DrawBounds).Cross(TmsLineF.Create(l_A, l_B), l_R) then
   Result := l_R.P
  else
   Result := l_B;
 end//RightShape <> nil
 else
 if (LeftShape = nil) then
  // - если нет ОБОИХ границ, то мы - "линия"
  Result := inherited
 else
  Result := pm_GetStartPoint;
  // - если есть только левая граница, то мы - "точка"
end;

function TmsConnector.HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean;
begin
 Result := true;
 if (LeftShape <> nil) AND LeftShape.HitTest(aPoint, theShape) then
  Exit;
 if (RightShape <> nil) AND RightShape.HitTest(aPoint, theShape) then
  Exit;
 Result := inherited;
end;

procedure TmsConnector.MoveBy(const aCtx: TmsMoveContext);
(*var
 l_Shape : ImsShape;*)
begin
(* if (aCtx.rShapesController <> nil) then
 begin
  if (RightShape = nil) then
  begin
   if SamePoint(Self.FinishPoint, aCtx.rStartPoint) then
   begin
    RightShape := aCtx.rShapesController.ShapeByPt(Self.FinishPoint + aCtx.rDelta);
    if Self.EQ(RightShape) then
     RightShape := nil;
   end;//SamePoint(Self.FinishPoint, aCtx.rStartPoint)
  end;//RightShape = nil
 end;//aCtx.rShapesController <> nil

 if (LeftShape <> nil) AND SamePoint(aCtx.rStartPoint, Self.StartPoint) then
 begin
  LeftShape.MoveBy(aCtx);
  Exit;
 end;//LeftShape <> nil

 if (RightShape <> nil) AND RightShape.HitTest(aCtx.rStartPoint + aCtx.rDelta, l_Shape) then
 begin
  RightShape.MoveBy(aCtx);
  Exit;
 end;//RightShape <> nil*)
 inherited;
end;

function TmsConnector.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 if (aCtx.rShapesController <> nil) then
 begin
  f_RightShape := BoundByContext(aCtx);
  if (f_RightShape <> nil) then
   f_UIDRight := f_RightShape.UID;
 end;//aCtx.rShapesController <> nil
 Result := inherited;
end;

class function TmsConnector.IsConnectorLike: Boolean;
begin
 Result := true;
end;

end.
