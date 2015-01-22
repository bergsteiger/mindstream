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
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
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

procedure TmsLibrary.DoDrawTo(const aCtx: TmsDrawContext);
begin
 inherited;
end;

end.
