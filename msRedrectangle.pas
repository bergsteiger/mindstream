unit msRedRectangle;

interface

uses
 msShape,
 msRectangle
 ;

type
 TmsRedRectangle = class(TmsRectangle)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsRedRectangle

implementation

uses
 System.UITypes
 ;

procedure TmsRedRectangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Red;
end;

end.
