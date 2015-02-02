unit msScrollShapeDown;

interface

uses
 msScrollShape,
 msInterfaces,
 msDownArrow,
 System.Types
 ;

type
 TmsScrollShapeDown = class(TmsScrollShape)
 protected
  class function ScrollDelta : TPointF; override;
 public
  class function ArrowShape: ImsShape; override;
 end;//TmsScrollShapeDown

implementation

// TmsScrollShapeDown

class function TmsScrollShapeDown.ArrowShape: ImsShape;
begin
 Result := TmsDownArrow.Create;
end;

class function TmsScrollShapeDown.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(0, -1);
end;

end.

