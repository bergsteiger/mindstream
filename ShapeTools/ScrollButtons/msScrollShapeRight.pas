unit msScrollShapeRight;

interface

uses
 msScrollShape,
 msInterfaces,
 msRightArrow,
 System.Types
 ;

type
 TmsScrollShapeRight = class(TmsScrollShape)
 protected
  class function ScrollDelta : TPointF; override;
 public
  class function ArrowShape: ImsShape; override;
 end;//TmsScrollShapeRight

implementation

// TmsScrollShapeRight

class function TmsScrollShapeRight.ArrowShape: ImsShape;
begin
 Result := TmsRightArrow.Create;
end;

class function TmsScrollShapeRight.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(-1, 0);
end;

end.

