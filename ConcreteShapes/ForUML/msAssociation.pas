unit msAssociation;

interface

uses
 msInterfaces,
 msConnector
 ;

type
 TmsAssociation = class(TmsConnector)
 protected
  function ArrowHeadShapeMC: ImsShapeClass; override;
  function GetFinishPointForDraw: TPointF; override;
  procedure GetStereotypeRect(var aRect: TRectF); override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsAssociation

implementation

uses
 FMX.Graphics,
 msArrowHead
 ;

function TmsAssociation.ArrowHeadShapeMC: ImsShapeClass;
begin
 Result := TmsArrowHead.MC;
end;

procedure TmsAssociation.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rStrokeDash := TStrokeDash.Solid;
end;

function TmsAssociation.GetFinishPointForDraw: TPointF;
begin
 Result := FinishPoint;
end;

procedure TmsAssociation.GetStereotypeRect(var aRect: TRectF);
begin
 aRect := DrawBounds;
end;

end.

