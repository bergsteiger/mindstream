unit msTrivial;

interface

uses
 System.Types,
 msInterfaces,
 msRectangle
 ;

type
 TmsTrivial = class(TmsRectangle)
 protected
  class function GetInitialHeight: Pixel; override;
  procedure GetStereotypeRect(var aRect: TRectF); override;
 end;//TmsTrivial

implementation


uses
 FMX.Graphics,
 FMX.Types
 ;

// TmsTrivial

class function TmsTrivial.GetInitialHeight: Pixel;
begin
 Result := inherited /3 * 2;
end;

procedure TmsTrivial.GetStereotypeRect(var aRect: TRectF);
begin
 aRect := DrawBounds;
end;

end.
