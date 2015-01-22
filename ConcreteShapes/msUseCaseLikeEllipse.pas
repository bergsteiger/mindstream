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

  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsUseCaseLikeEllipse

implementation

function TmsUseCaseLikeEllipse.InitialRadiusY: Integer;
begin
 Result := 35;
end;

procedure TmsUseCaseLikeEllipse.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
end;

end.


