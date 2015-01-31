unit msScrollShapeUpLeft;

interface

uses
 msScrollShape,
 msInterfaces,
 msUpLeftArrow,
 System.Types
 ;

type
 TmsScrollShapeUpLeft = class(TmsScrollShape)
 protected
  class function ScrollDelta : TPointF; override;
 public
  class function ArrowShape: ImsShape; override;
 end;//TmsScrollShapeUpLeft

implementation

// TmsScrollShapeUpLeft

class function TmsScrollShapeUpLeft.ArrowShape: ImsShape;
begin
 Result := TmsUpLeftArrow.Create;
end;

class function TmsScrollShapeUpLeft.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(5, 5);
end;

end.

