unit msScrollShapePrim;

interface

uses
 msNullClickShape
 ;

type
 TmsScrollShapePrim = class(TmsNullClickShape)
 public
   class function IsForToolbar: Boolean; override;
 end; // TmsScrollShapePrim

implementation

{ TmsScrollShapePrim }

class function TmsScrollShapePrim.IsForToolbar: Boolean;
begin
 Result := False;
end;

end.
