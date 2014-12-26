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
  class procedure DoNullClick(const aCtx: TmsMakeShapeContext); override;
 end;//TmsSwapParents

implementation

class procedure TmsSwapParents.DoNullClick(const aCtx: TmsMakeShapeContext);
begin
 aCtx.rDiagrammsHolder.SwapParents;
end;

end.
