unit msLibrary;

interface

uses
 System.Types,
 msInterfaces,
 msFolder
 ;

type
 TmsLibrary = class(TmsFolder)
 protected
  procedure GetStereotypeRect(var aRect: TRectF); override;
 end;//TmsClass

implementation

uses
 FMX.Graphics,
 FMX.Types
 ;

// TmsLibrary

procedure TmsLibrary.GetStereotypeRect(var aRect: TRectF);
begin
 aRect := DrawBounds;
end;

end.
