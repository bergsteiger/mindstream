unit msTool;

interface

uses
 msShape
 ;

type
 TmsTool = class(TmsShape)
 public
  class function IsTool: Boolean; override;
 end;//TmsTool

implementation

// TmsTool

class function TmsTool.IsTool: Boolean;
begin
 Result := true;
end;

end.
