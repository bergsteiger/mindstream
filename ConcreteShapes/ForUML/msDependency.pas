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
  function CreateArrowHeadShape(const aStartPoint: TPointF): ImsShape; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsDependency

implementation

uses
 FMX.Graphics,
 msArrowHead
 ;

function TmsDependency.CreateArrowHeadShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := TmsArrowHead.Create(aStartPoint);
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

end.
