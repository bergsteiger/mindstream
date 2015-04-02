unit msPicker;

interface

uses
 msInterfaces,
 msTool,
 System.Types
 ;

type
 TmsPicker = class(TmsTool)
  // - утилитный класс для "проваливания" внутрь примитивов
 public
  class function Create(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext): ImsShape; override;
  class function ButtonShape: ImsShape; override;
 end;//TmsPicker

implementation

uses
 msPickerIcon
 ;

class function TmsPicker.Create(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext): ImsShape;
var
 l_PickedShape : ImsShape;
begin
 Result := nil;
 l_PickedShape := aCtx.rShapesController.ShapeByPt(aCtx.rStartPoint);
 if (l_PickedShape = nil) then
  Exit;
 if (l_PickedShape.Count = 0) then
  l_PickedShape.AddNewDiagramm;
 aCtx.rDiagrammsHolder.CurrentDiagramms := l_PickedShape;
// Result := inherited Create(aCtx);
end;

class function TmsPicker.ButtonShape: ImsShape;
begin
 Result := TmsPickerIcon.Create;
end;

end.
