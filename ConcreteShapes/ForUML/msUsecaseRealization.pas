unit msUsecaseRealization;

interface

uses
 msInterfaces,
 msUsecase
 ;

type
 TmsUsecaseRealization = class(TmsUsecase)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsUsecaseRealization

implementation

uses
 System.UITypes
 ;

procedure TmsUsecaseRealization.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Lightgreen;
end;

end.
