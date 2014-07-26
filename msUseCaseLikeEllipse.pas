unit msUseCaseLikeEllipse;

interface

uses
 msCircle,
 System.UITypes
 ;

type
 TmsUseCaseLikeEllipse = class(TmsCircle)
 protected
  class function InitialRadiusY: Integer; override;
  function FillColor: TAlphaColor; override;
 end;//TmsUseCaseLikeEllipse

implementation

class function TmsUseCaseLikeEllipse.InitialRadiusY: Integer;
begin
 Result := 35;
end;

function TmsUseCaseLikeEllipse.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Yellow;
end;

initialization
 TmsUseCaseLikeEllipse.Register;

end.
