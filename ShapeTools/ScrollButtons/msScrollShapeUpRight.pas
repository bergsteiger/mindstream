unit msScrollShapeUpRight;

interface

uses
 msScrollShape,
 msInterfaces,
 msUpRightArrow,
 System.Types
 ;

type
 TmsScrollShapeUpRight = class(TmsScrollShape)
 protected
  class function ScrollDelta : TPointF; override;
 public
  class function ArrowShape: ImsShape; override;
 end;//TmsScrollShapeUpLeft

implementation

// TmsScrollShapeUpLeft

class function TmsScrollShapeUpRight.ArrowShape: ImsShape;
begin
 Result := TmsUpRightArrow.Create;
end;

class function TmsScrollShapeUpRight.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(-1, 1);
end;

end.

