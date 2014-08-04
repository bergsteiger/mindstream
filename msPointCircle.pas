unit msPointCircle;

interface

uses
 FMX.Graphics,
 System.Types,
 msShape,
 msCircle,
 System.UITypes
 ;

type
 TmsPointCircle = class(TmsCircle)
 protected
  class function InitialRadiusX: Integer; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;

implementation

{ TmsPointCircle }

class function TmsPointCircle.InitialRadiusX: Integer;
begin
 Result := 10;
end;

procedure TmsPointCircle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Null;
end;

end.

