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
  class function InitialHeight: Single; override;
  procedure GetStereotypeRect(var aRect: TRectF); override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsTrivial

implementation


uses
 FMX.Graphics,
 FMX.Types
 ;

// TmsTrivial

class function TmsTrivial.InitialHeight: Single;
begin
 Result := inherited /3 * 2;
end;

procedure TmsTrivial.GetStereotypeRect(var aRect: TRectF);
begin
 aRect := DrawBounds;
end;

procedure TmsTrivial.DoDrawTo(const aCtx: TmsDrawContext);
begin
 inherited;
end;

end.
