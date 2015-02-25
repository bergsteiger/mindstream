unit msUsecase;

interface

uses
 msInterfaces,
 msUseCaseLikeEllipse
 ;

type
 TmsUsecase = class(TmsUseCaseLikeEllipse)
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsUsecase

implementation

uses
 System.UITypes
 ;

procedure TmsUsecase.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Lightyellow;
end;

procedure TmsUsecase.DoDrawTo(const aCtx: TmsDrawContext);
begin
 inherited;
end;

end.
