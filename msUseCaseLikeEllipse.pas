unit msUseCaseLikeEllipse;

interface

uses
 msShape,
 msCircle,
 System.UITypes
 ;

type
 TmsUseCaseLikeEllipse = class(TmsCircle)
 protected
  class function InitialRadiusY: Integer; override;

  function DrawOptionsContext: TmsDrawOptionsContext; override;
 end;//TmsUseCaseLikeEllipse

implementation

class function TmsUseCaseLikeEllipse.InitialRadiusY: Integer;
begin
 Result := 35;
end;

function TmsUseCaseLikeEllipse.DrawOptionsContext: TmsDrawOptionsContext;
begin
 Result.FillColor := TAlphaColorRec.Yellow;
end;

initialization
 TmsUseCaseLikeEllipse.Register;

end.

