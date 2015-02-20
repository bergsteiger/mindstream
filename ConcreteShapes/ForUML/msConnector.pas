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
 protected
  constructor CreateInner(const aCtx: TmsMakeShapeContext); override;
  procedure SetStartPoint(const aStartPoint: TPointF); override;
  function pm_GetStartPoint: TPointF; override;
  function pm_GetFinishPoint: TPointF; override;
  function HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean; override;
  procedure MoveBy(const aCtx: TmsMoveContext); override;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; override;
 end;//TmsConnector

implementation

uses
  msLineF
  ;

// TmsConnector

constructor TmsConnector.CreateInner(const aCtx: TmsMakeShapeContext);
begin
 inherited;
 if (aCtx.rShapesController <> nil) then
  f_LeftShape := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
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
 if (f_LeftShape <> nil) then
 begin
  l_A := inherited pm_GetStartPoint;
  l_B := inherited pm_GetFinishPoint;
  if TmsRectF.Create(f_LeftShape.DrawBounds).Cross(TmsLineF.Create(l_A, l_B), l_R) then
   Result := l_R.P
  else
   Result := f_LeftShape.StartPoint;
 end//f_LeftShape <> nil
 else
  Result := inherited;
end;

function TmsConnector.pm_GetFinishPoint: TPointF;
begin
 if (f_RightShape <> nil) then
  Result := f_RightShape.StartPoint
 else
  Result := inherited;
end;

function TmsConnector.HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean;
begin
 Result := true;
 if (f_LeftShape <> nil) AND f_LeftShape.HitTest(aPoint, theShape) then
  Exit;
 if (f_RightShape <> nil) AND f_RightShape.HitTest(aPoint, theShape) then
  Exit;
 Result := inherited;
end;

procedure TmsConnector.MoveBy(const aCtx: TmsMoveContext);
(*var
 l_Shape : ImsShape;*)
begin
(* if (aCtx.rShapesController <> nil) then
 begin
  if (f_RightShape = nil) then
  begin
   if SamePoint(Self.FinishPoint, aCtx.rStartPoint) then
   begin
    f_RightShape := aCtx.rShapesController.ShapeByPt(Self.FinishPoint + aCtx.rDelta);
    if Self.EQ(f_RightShape) then
     f_RightShape := nil;
   end;//SamePoint(Self.FinishPoint, aCtx.rStartPoint)
  end;//f_RightShape = nil
 end;//aCtx.rShapesController <> nil

 if (f_LeftShape <> nil) AND SamePoint(aCtx.rStartPoint, Self.StartPoint) then
 begin
  f_LeftShape.MoveBy(aCtx);
  Exit;
 end;//f_LeftShape <> nil

 if (f_RightShape <> nil) AND f_RightShape.HitTest(aCtx.rStartPoint + aCtx.rDelta, l_Shape) then
 begin
  f_RightShape.MoveBy(aCtx);
  Exit;
 end;//f_RightShape <> nil*)
 inherited;
end;

function TmsConnector.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 if (aCtx.rShapesController <> nil) then
  f_RightShape := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
 Result := inherited;
end;

end.
