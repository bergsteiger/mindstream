unit msScrollShape;

interface

uses
 msNullClickShape,
 msInterfaces,
 System.Types
 ;

type
 TmsScrollShape = class abstract(TmsNullClickShape)
 public
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override; final;
 protected
  class function ScrollDelta : TPointF; virtual;
 end;//TmsScrollShape

implementation

// TmsScrollShape

class function TmsScrollShape.DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.Scroll(ScrollDelta);
end;

class function TmsScrollShape.ScrollDelta: TPointF;
begin
 Result := TPointF.Create(0, 0);
 Assert(False, 'Реализовать в потомках');
end;

end.
