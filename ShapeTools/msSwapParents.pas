unit msSwapParents;

interface

uses
 msInterfaces,
 msTool
 ;

type
 TmsSwapParents = class(TmsTool)
  // - утилитный класс ОБМЕНА диаграмм МЕСТАМИ
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
 end;//TmsSwapParents

implementation

class function TmsSwapParents.Create(const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := nil;
 aCtx.rDiagrammsHolder.SwapParents;
end;

end.
