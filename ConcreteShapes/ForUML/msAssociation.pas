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

function TmsAssociation.GetFinishPointForDraw: TPointF;
begin
 Result := FinishPoint;
end;

procedure TmsAssociation.GetStereotypeRect(var aRect: TRectF);
begin
 aRect := DrawBounds;
end;

end.

