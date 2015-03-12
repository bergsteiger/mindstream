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
  procedure GetStereotypeRect(var aRect: TRectF); override;
 end;//TmsTrivial

implementation


uses
 FMX.Graphics,
 FMX.Types
 ;

// TmsTrivial

procedure TmsTrivial.GetStereotypeRect(var aRect: TRectF);
begin
 aRect := DrawBounds;
end;

end.
