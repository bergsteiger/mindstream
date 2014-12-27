unit msSwapParents;

interface

uses
 msInterfaces,
 msTool,
 msNullClickShape
 ;

type
 TmsSwapParents = class(TmsNullClickShape)
  // - утилитный класс ОБМЕНА диаграмм МЕСТАМИ
 protected
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
 end;//TmsSwapParents

implementation

class function TmsSwapParents.DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.SwapParents;
end;

end.
