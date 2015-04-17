unit msAssociation;

interface

uses
 msInterfaces,
 msConnector
 ;

type
 TmsAssociation = class(TmsConnector)
 protected
  function GetFinishPointForDraw: TPointF; override;
 end;//TmsAssociation

implementation

uses
 FMX.Graphics,
 msArrowHead
 ;

function TmsAssociation.GetFinishPointForDraw: TPointF;
begin
 Result := FinishPoint;
end;

end.

