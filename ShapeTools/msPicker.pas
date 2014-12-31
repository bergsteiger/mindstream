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
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
  class function ButtonShape(const aStartPoint: TPointF): ImsShape; override;
 end;//TmsPicker

implementation

uses
 msLineWithArrow
 ;

class function TmsPicker.Create(const aCtx: TmsMakeShapeContext): ImsShape;
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

class function TmsPicker.ButtonShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := TmsLineWithArrow.CreateCompleted(TPointF.Create(0, 0), TPointF.Create(0, 50));
end;

end.
