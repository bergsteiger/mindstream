unit msScrollShapeRight;

interface

uses
 msScrollShape,
 msInterfaces,
 msRightArrow,
 System.Types
 ;

type
 TmsScrollShapeRight= class(TmsScrollShape)
 protected
  class function ScrollDelta : TPointF; override;
 public
  class function ButtonShape: ImsShape; override;
 end;//TmsScrollShapeUp

implementation

// TmsScrollShapeUp

{ TmsScrollShapeUp }

class function TmsScrollShapeRight.ButtonShape: ImsShape;
begin
 Result := TmsRightArrow.Create;
end;

class function TmsScrollShapeRight.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(-5, 0);
end;

end.

