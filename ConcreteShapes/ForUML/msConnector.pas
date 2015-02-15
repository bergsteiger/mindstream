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
begin
 if (f_LeftShape <> nil) then
  Result := f_LeftShape.StartPoint
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
begin
 inherited;
end;

function TmsConnector.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 if (aCtx.rShapesController <> nil) then
  f_RightShape := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
 Result := inherited;
end;

end.
