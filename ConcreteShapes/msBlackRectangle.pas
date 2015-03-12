unit msBlackRectangle;

interface

uses
 System.UITypes,
 msInterfaces,
 msRectangle
 ;

type
 TmsBlackRectangle = class(TmsRectangle)
 protected
  class function GetInitialWidth: Single; override;
 end;//TmsBlackRectangle

implementation

// TmsBlackRectangle

class function TmsBlackRectangle.GetInitialWidth: Single;
begin
 Result := 15;
end;

end.
