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

  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsUseCaseLikeEllipse

implementation

class function TmsUseCaseLikeEllipse.InitialRadiusY: Integer;
begin
 Result := 35;
end;

procedure TmsUseCaseLikeEllipse.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Yellow;
end;

end.

