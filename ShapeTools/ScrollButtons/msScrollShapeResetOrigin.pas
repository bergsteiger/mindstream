unit msScrollShapeResetOrigin;

interface

uses
 msScrollShapePrim,
 msInterfaces,
 msTextShape,
 System.Types
 ;

type
 TmsScrollShapeResetOrigin = class(TmsScrollShapePrim)
 public
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override; final;
 public
 end;//TmsScrollShapeResetOrigin

implementation

// TmsScrollShapeResetOrigin

class function TmsScrollShapeResetOrigin.DoNullClick(
  const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := True;
 aHolder.ResetOrigin;
end;
end.

