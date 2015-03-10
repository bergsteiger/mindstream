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
  class function InitialWidth: Single; override;
  class function GetInitialHeight: Pixel; override;
 end;//TmsBlackRectangle

implementation

{ TmsBlackRectangle }

class function TmsBlackRectangle.GetInitialHeight: Pixel;
begin
 Result := 100;
end;

class function TmsBlackRectangle.InitialWidth: Single;
begin
 Result := 15;
end;

end.
