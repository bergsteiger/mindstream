unit msSmallTriangle;

interface

uses
 msShape,
 msTriangleDirectionRight,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces,
 System.Math.Vectors
 ;

type
 TmsSmallTriangle = class(TmsTriangleDirectionRight)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 public
  class function InitialHeight: Single; override;
  class function IsForToolbar: Boolean; override;
 end;//TmsSmallTriangle

implementation

procedure TmsSmallTriangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Aquamarine;
end;

class function TmsSmallTriangle.InitialHeight: Single;
begin
 Result := 21;
end;

class function TmsSmallTriangle.IsForToolbar: Boolean;
begin
 Result := false;
end;

end.
