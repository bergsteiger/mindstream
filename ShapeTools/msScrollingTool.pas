unit msScrollingTool;

interface

uses
 msShape,
 msInterfaces,
 System.Types,
 msTool,
 msShapesGroup
 ;

type
 TmsScrollingTool = class(TmsTool)
 private
  FStartPoint: TPointF;
 protected
  procedure SetStartPoint(const aStartPoint: TPointF); override;
  function pm_GetStartPoint: TPointF; override;
 public
  class function ButtonShape: ImsShape; override;
  class function IsTool: Boolean; override;
 protected
  function IsNeedsSecondClick: Boolean; override;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; override;
  function MouseUp(const aClickContext: TmsEndShapeContext): Boolean; override;
  procedure MouseMove(const aClickContext: TmsEndShapeContext); override;
 end;//TmsScrollingTool

implementation

uses
 msTriangle,
 msMoveIcon,
 msScalingShape,
 msRectangle,
 msMovingPointer
 ;

// TmsScrollingTool

class function TmsScrollingTool.ButtonShape: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsRectangle.Create, TmsMoveIcon.Create]);
end;

function TmsScrollingTool.MouseUp(const aClickContext: TmsEndShapeContext): Boolean;
begin
 aClickContext.rShapesController.RemoveShape(Self);
 Result := true;
end;

function TmsScrollingTool.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 aCtx.rShapesController.RemoveShape(Self);
 Result := True;
end;

function TmsScrollingTool.IsNeedsSecondClick: Boolean;
begin
 Result := True;
end;

class function TmsScrollingTool.IsTool: Boolean;
begin
 Result := true;
end;

procedure TmsScrollingTool.MouseMove(const aClickContext: TmsEndShapeContext);
var
 l_Delta : TPointF;
begin
 l_Delta := (aClickContext.rStartPoint - Self.StartPoint);
 aClickContext.rDiagrammsHolder.Scroll(l_Delta);
end;

function TmsScrollingTool.pm_GetStartPoint: TPointF;
begin
 Result := FStartPoint;
end;

procedure TmsScrollingTool.SetStartPoint(const aStartPoint: TPointF);
begin
 inherited;
 // - не уверен, что Inherited тут концептуально правилен, но пусть пока будет
 FStartPoint := aStartPoint;
end;

end.

