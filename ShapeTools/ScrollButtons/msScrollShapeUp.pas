unit msScrollShapeUp;

interface

uses
 msScrollShape,
 msInterfaces,
 msUpArrow,
 System.Types
 ;

type
 TmsScrollShapeUp = class(TmsScrollShape)
 protected
  class function ScrollDelta : TPointF; override;
 public
  class function ArrowShape: ImsShape; override;
 end;//TmsScrollShapeUp

implementation

// TmsScrollShapeUp

class function TmsScrollShapeUp.ArrowShape: ImsShape;
begin
 Result := TmsUpArrow.Create;
end;

class function TmsScrollShapeUp.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(0, 5);
end;

end.
