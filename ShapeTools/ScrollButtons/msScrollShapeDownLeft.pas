unit msScrollShapeDownLeft;

interface

uses
 msScrollShape,
 msInterfaces,
 msDownLeftArrow,
 System.Types
 ;

type
 TmsScrollShapeDownLeft = class(TmsScrollShape)
 protected
  class function ScrollDelta : TPointF; override;
 public
  class function ArrowShape: ImsShape; override;
 end;//TmsScrollShapeDownLeft

implementation

// TmsScrollShapeDownLeft

class function TmsScrollShapeDownLeft.ArrowShape: ImsShape;
begin
 Result := TmsDownLeftArrow.Create;
end;

class function TmsScrollShapeDownLeft.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(0, -5);
end;

end.

