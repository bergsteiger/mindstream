unit msPointCircle;

interface

uses
 FMX.Graphics,
 System.Types,
 msShape,
 msCircle,
 System.UITypes,
 msInterfaces
 ;

type
 TmsPointCircle = class(TmsCircle)
 protected
  function InitialRadiusX: Integer; override;
 end;//TmsPointCircle

implementation

{ TmsPointCircle }

function TmsPointCircle.InitialRadiusX: Integer;
begin
 Result := 10;
end;

end.



