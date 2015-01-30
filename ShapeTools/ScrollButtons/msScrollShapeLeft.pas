unit msScrollShapeLeft;

interface

uses
 msScrollShape,
 msInterfaces,
 msLeftArrow,
 System.Types
 ;

type
 TmsScrollShapeLeft = class(TmsScrollShape)
 protected
  class function ScrollDelta : TPointF; override;
 public
  class function ArrowShape: ImsShape; override;
 end;//TmsScrollShapeLeft

implementation

// TmsScrollShapeLeft

class function TmsScrollShapeLeft.ArrowShape: ImsShape;
begin
 Result := TmsLeftArrow.Create;
end;

class function TmsScrollShapeLeft.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(5, 0);
end;

end.

