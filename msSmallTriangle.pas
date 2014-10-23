unit msSmallTriangle;

interface

uses
 msShape,
 msTriangleDirectionRight,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ;

type
 TmsSmallTriangle = class(TmsTriangleDirectionRight)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 public
  class function InitialHeight: Single; override;
 end;//TmsSmallTriangle

implementation

uses
 System.Math
 ;

procedure TmsSmallTriangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Aquamarine;
end;

class function TmsSmallTriangle.InitialHeight: Single;
begin
 Result := 20;
end;

end.
