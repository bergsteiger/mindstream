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
 public
  class function ButtonShape: ImsShape; override;
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
 end;//TmsScrollShapeUp

implementation

// TmsScrollShapeUp

{ TmsScrollShapeUp }

class function TmsScrollShapeDown.ButtonShape: ImsShape;
begin
 Result := TmsDownArrow.Create(TPointF.Create(0, 0));
end;


class function TmsScrollShapeDown.DoNullClick(
  const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.Scroll(TPointF.Create(0, -ScrollDelta));
end;

end.

