unit msScalingShape;

interface

uses
 msInterfaces,
 msBoundsCorrector
 ;

type
 TmsScalingShape = class(TmsBoundsCorrector)
 private
  f_Scale : Extended;
 protected
  function ExtentCoeff: Extended; override;
  constructor CreateInner(const aShape: ImsShape; aScale : Extended);
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 public
  class function Create(const aShape: ImsShape; aScale : Extended): ImsShape;
 end;//TmsScalingShape

implementation

// TmsScalingShape

constructor TmsScalingShape.CreateInner(const aShape: ImsShape; aScale : Extended);
begin
 inherited CreateInner(aShape);
// f_Scale := 1 / aScale;
 f_Scale := aScale;
end;

class function TmsScalingShape.Create(const aShape: ImsShape; aScale : Extended): ImsShape;
begin
 Result := CreateInner(aShape, aScale);
end;

function TmsScalingShape.ExtentCoeff: Extended;
begin
 Result := f_Scale;
end;

procedure TmsScalingShape.DoDrawTo(const aCtx: TmsDrawContext);
begin
 inherited;
end;

end.
