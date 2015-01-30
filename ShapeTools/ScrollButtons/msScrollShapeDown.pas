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
  class function ButtonShape: ImsShape; override;
 end;//TmsScrollShapeDown

implementation

// TmsScrollShapeDown

class function TmsScrollShapeDown.ButtonShape: ImsShape;
begin
 Result := TmsDownArrow.Create;
end;

class function TmsScrollShapeDown.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(0, -5);
end;

end.

