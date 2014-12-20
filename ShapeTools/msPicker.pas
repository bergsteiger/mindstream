unit msPicker;

interface

uses
 msInterfaces,
 msTool
 ;

type
 TmsPicker = class(TmsTool)
  // - утилитный класс для "проваливания" внутрь примитивов
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
 end;//TmsPicker

implementation

class function TmsPicker.Create(const aCtx: TmsMakeShapeContext): ImsShape;
var
 l_PickedShape : ImsShape;
begin
 l_PickedShape := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
 if (l_PickedShape = nil) then
  Exit;
 Result := inherited Create(aCtx);
end;

end.
