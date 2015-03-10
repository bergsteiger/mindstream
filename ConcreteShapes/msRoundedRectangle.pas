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
  class function InitialWidth: Single; override;
  class function GetInitialHeight: Pixel; override;
 end;//TmsRoundedRectangle

implementation

class function TmsRoundedRectangle.CornerRadius: Single;
begin
 Result := 10;
end;

class function TmsRoundedRectangle.InitialWidth: Single;
begin
 Result := 90;
end;

class function TmsRoundedRectangle.GetInitialHeight: Pixel;
begin
 Result := InitialWidth;
end;

end.
