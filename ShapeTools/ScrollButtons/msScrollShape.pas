unit msScrollShape;

interface

uses
 msNullClickShape
 ;

type
 TmsScrollShape = class abstract(TmsNullClickShape)
 protected
 class function ScrollDelta : Single; virtual;
 end;//TmsScrollShape

implementation

// TmsScrollShape

{ TmsScrollShape }

class function TmsScrollShape.ScrollDelta: Single;
begin
 Result := 5;
end;

end.
