unit msConnector;

interface

uses
 System.Types,
 msInterfaces,
 msLine,
 Data.DBXJSONReflect
 ;

type
 TmsConnector = class(TmsLine)
 strict private
  [JSONMarshalled(False)]
  f_LeftShape : ImsShape;
 protected
  constructor CreateInner(const aCtx: TmsMakeShapeContext); override;
  procedure SetStartPoint(const aStartPoint: TPointF); override;
  function pm_GetStartPoint: TPointF; override;
  function HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean; override;
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

function TmsConnector.HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean;
begin
 Result := inherited;
end;

end.
