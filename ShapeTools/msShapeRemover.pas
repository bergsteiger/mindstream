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

uses
 msRemoverIcon
 ;

class function TmsShapeRemover.Create(const aCtx: TmsMakeShapeContext): ImsShape;
var
 l_ShapeToRemove: ImsShape;
begin
 Result := nil;
 l_ShapeToRemove := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
 if (l_ShapeToRemove = nil) then
  Exit;
 aCtx.rShapesController.RemoveShape(l_ShapeToRemove);
end;

end.
