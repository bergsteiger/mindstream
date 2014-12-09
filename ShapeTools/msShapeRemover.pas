unit msShapeRemover;

interface

uses
 msInterfaces,
 msTool
 ;

type
 TmsShapeRemover = class(TmsTool)
  // - утилитный класс для уничтожения примитивов
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
 end;//TmsPicker

implementation

class function TmsShapeRemover.Create(const aCtx: TmsMakeShapeContext): ImsShape;
var
 l_ShapeRemover: ImsShape;
begin
 Result := nil;
 l_ShapeRemover := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
 if (l_ShapeRemover = nil) then
  Exit;
 aCtx.rShapesController.RemoveShape(l_ShapeRemover);
// Result := inherited Create(aCtx);
end;

end.
