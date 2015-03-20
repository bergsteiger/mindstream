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

end.

