unit msPointCircle;

interface

uses
 FMX.Graphics,
 System.Types,
 msShape,
 msCircle
 ;

type
 TmsPointCircle = class(TmsCircle)
 protected
  class function Radius: Integer; override;
 end;

implementation

{ TmsPointCircle }

class function TmsPointCircle.Radius: Integer;
begin
 Result := 10;
end;

end.
