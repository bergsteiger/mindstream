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
 end;//TmsUsecase

implementation

uses
 System.UITypes,
 FMX.Types
 ;

// TmsUsecase

procedure TmsUsecase.GetStereotypeRect(var aRect: TRectF);
begin
 aRect := DrawBounds;
 aRect := TRectF.Create(aRect.Left - 20, aRect.Bottom, aRect.Right + 20, aRect.Bottom + 20);
end;

end.
