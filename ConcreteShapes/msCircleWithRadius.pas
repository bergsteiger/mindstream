unit msCircleWithRadius;

interface

uses
 msCircle
 ;

type
 TmsCircleWithRadius = class(TmsCircle)
 protected
  function InitialRadiusX: Integer; override;
 end;//TmsCircleWithRadius

implementation

// TmsCircleWithRadius

function TmsCircleWithRadius.InitialRadiusX: Integer;
begin
 Result := inherited;
end;

end.
