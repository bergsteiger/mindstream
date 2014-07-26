unit msRoundedRectange;

interface

uses
 msRectangle,
 System.Types,
 FMX.Graphics,
 FMX.Types
 ;

type
 TmsRoundedRectangle = class(TmsRectangle)
 protected
  class function CornerRadius: Single; override;
 end;//TmsRoundedRectangle

implementation

class function TmsRoundedRectangle.CornerRadius: Single;
begin
 Result := 10;
end;

initialization
 TmsRoundedRectangle.Register;

end.
