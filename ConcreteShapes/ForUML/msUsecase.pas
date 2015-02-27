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
 System.Types,
 System.UITypes,
 FMX.Types
 ;

procedure TmsUsecase.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Lightyellow;
end;

procedure TmsUsecase.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_R : TRectF;
 l_R1 : TRectF;
begin
 inherited;
 l_R := DrawBounds;

 l_R1 := TRectF.Create(l_R.Left - 20, l_R.Bottom, l_R.Right + 20, l_R.Bottom + 20);

 aCtx.rCanvas.Fill.Color :=  aCtx.rCanvas.Stroke.Color;
 aCtx.rCanvas.FillText(l_R1,
                       Stereotype,
                       false,
                       1,
                       [],
                       TTextAlign.Center,
                       TTextAlign.Center);
end;

end.
