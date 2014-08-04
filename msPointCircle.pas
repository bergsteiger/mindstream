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
  function DrawOptionsContext: TmsDrawOptionsContext; override;
 end;

implementation

{ TmsPointCircle }

class function TmsPointCircle.InitialRadiusX: Integer;
begin
 Result := 10;
end;

function TmsPointCircle.DrawOptionsContext: TmsDrawOptionsContext;
begin
 Result.FillColor := TAlphaColorRec.Red;
end;

end.

