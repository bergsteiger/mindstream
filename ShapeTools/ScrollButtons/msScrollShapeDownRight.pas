unit msScrollShapeDownRight;

interface

uses
 msScrollShape,
 msInterfaces,
 msDownRightArrow,
 System.Types
 ;

type
 TmsScrollShapeDownRight = class(TmsScrollShape)
 protected
  class function ScrollDelta : TPointF; override;
 public
  class function ArrowShape: ImsShape; override;
 end;//TmsScrollShapeDownLeft

implementation

// TmsScrollShapeDownLeft

class function TmsScrollShapeDownRight.ArrowShape: ImsShape;
begin
 Result := TmsDownRightArrow.Create;
end;

class function TmsScrollShapeDownRight.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(0, -5);
end;

end.

