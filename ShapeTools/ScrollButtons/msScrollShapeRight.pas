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
 public
  class function ButtonShape: ImsShape; override;
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
 end;//TmsScrollShapeUp

implementation

// TmsScrollShapeUp

{ TmsScrollShapeUp }

class function TmsScrollShapeRight.ButtonShape: ImsShape;
begin
 Result := TmsRightArrow.Create(TPointF.Create(0, 0));
end;


class function TmsScrollShapeRight.DoNullClick(
  const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.Scroll(TPointF.Create(-ScrollDelta, 0));
end;

end.

