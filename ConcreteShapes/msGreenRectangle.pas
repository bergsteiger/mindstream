unit msGreenRectangle;

interface

uses
 msShape,
 msRectangle
 ;

type
 TmsGreenRectangle = class(TmsRectangle)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsGreenRectangle

implementation

uses
 System.UITypes
 ;

procedure TmsGreenRectangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Green;
end;

end.
