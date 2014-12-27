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
  class function DoNullClick(const aCtx: TmsMakeShapeContext): Boolean; override;
 end;//TmsSwapParents

implementation

class function TmsSwapParents.DoNullClick(const aCtx: TmsMakeShapeContext): Boolean;
begin
 Result := true;
 aCtx.rDiagrammsHolder.SwapParents;
end;

end.
