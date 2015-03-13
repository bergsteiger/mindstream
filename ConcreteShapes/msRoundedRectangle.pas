unit msRoundedRectangle;

interface

uses
 msShape,
 msRectangle,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces
 ;

type
 TmsRoundedRectangle = class(TmsRectangle)
 protected
  class function CornerRadius: Single; override;
 end;//TmsRoundedRectangle

implementation

// TmsRoundedRectangle

class function TmsRoundedRectangle.CornerRadius: Single;
begin
 Result := 10;
end;

end.
