unit msRoundedRectangle;

interface

uses
 msShape,
 msRectangle,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ;

type
 TmsRoundedRectangle = class(TmsRectangle)
 protected
  class function CornerRadius: Single; override;
  class function InitialWidth: Single; override;
  class function InitialHeight: Single; override;

  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsRoundedRectangle

implementation

class function TmsRoundedRectangle.CornerRadius: Single;
begin
 Result := 10;
end;

class function TmsRoundedRectangle.InitialWidth: Single;
begin
 Result := 90;
end;

class function TmsRoundedRectangle.InitialHeight: Single;
begin
 Result := InitialWidth;
end;

procedure TmsRoundedRectangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Blue;
end;

end.
