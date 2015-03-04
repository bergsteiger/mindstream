unit msDependency;

interface

uses
 msInterfaces,
 msConnector,
 System.Types
 ;

type
 TmsDependency = class(TmsConnector)
 protected
  function GetFinishPointForDraw: TPointF; override;
  function ArrowHeadShapeMC: ImsShapeClass; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
  procedure GetStereotypeRect(var aRect: TRectF); override;
 end;//TmsDependency

implementation

uses
 FMX.Graphics,
 msArrowHead
 ;

function TmsDependency.ArrowHeadShapeMC: ImsShapeClass;
begin
 Result := TmsArrowHead.MC;
end;

function TmsDependency.GetFinishPointForDraw: TPointF;
begin
 Result := FinishPoint;
end;

procedure TmsDependency.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rStrokeDash := TStrokeDash.Dash;
 theCtx.rStrokeThickness := 1.5;
end;

procedure TmsDependency.GetStereotypeRect(var aRect: TRectF);
begin
 aRect := DrawBounds;
end;

end.
