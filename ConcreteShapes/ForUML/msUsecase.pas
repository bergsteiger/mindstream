unit msUsecase;

interface

uses
 System.Types,
 msInterfaces,
 msUseCaseLikeEllipse
 ;

type
 TmsUsecase = class(TmsUseCaseLikeEllipse)
 protected
  procedure GetStereotypeRect(var aRect: TRectF); override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsUsecase

implementation

uses
 System.UITypes,
 FMX.Types
 ;

// TmsUsecase

procedure TmsUsecase.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Lightyellow;
end;

procedure TmsUsecase.GetStereotypeRect(var aRect: TRectF);
begin
 aRect := DrawBounds;
 aRect := TRectF.Create(aRect.Left - 20, aRect.Bottom, aRect.Right + 20, aRect.Bottom + 20);
end;

procedure TmsUsecase.DoDrawTo(const aCtx: TmsDrawContext);
begin
 inherited;
end;

end.
