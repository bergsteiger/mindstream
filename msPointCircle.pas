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
  class function Radius: Integer; override;
  function FillColor: TAlphaColor; override;
 end;

implementation

{ TmsPointCircle }

class function TmsPointCircle.Radius: Integer;
begin
 Result := 10;
end;

function TmsPointCircle.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Null;
end;

end.
