unit msUseCaseLikeEllipse;

interface

uses
 msShape,
 msCircle,
 System.UITypes,
 msInterfaces
 ;

type
 TmsUseCaseLikeEllipse = class(TmsCircle)
 protected
  function InitialRadiusY: Integer; override;
 end;//TmsUseCaseLikeEllipse

implementation

function TmsUseCaseLikeEllipse.InitialRadiusY: Integer;
begin
 Result := 35;
end;

end.


