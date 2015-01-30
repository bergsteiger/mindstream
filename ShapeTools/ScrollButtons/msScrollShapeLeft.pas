unit msScrollShapeLeft;

interface

uses
 msScrollShape,
 msInterfaces,
 msLeftArrow,
 System.Types
 ;

type
 TmsScrollShapeLeft= class(TmsScrollShape)
 public
  class function ButtonShape: ImsShape; override;
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
 end;//TmsScrollShapeUp

implementation

// TmsScrollShapeUp

{ TmsScrollShapeUp }

class function TmsScrollShapeLeft.ButtonShape: ImsShape;
begin
 Result := TmsLeftArrow.Create(TPointF.Create(0, 0));
end;


class function TmsScrollShapeLeft.DoNullClick(
  const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.Scroll(TPointF.Create(ScrollDelta, 0));
end;

end.

