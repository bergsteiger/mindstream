unit msShapeRemover;

interface

uses
 System.Types,
 msInterfaces,
 msTool
 ;

type
 TmsShapeRemover = class(TmsTool)
  // - утилитный класс для уничтожения примитивов
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
  class function ButtonShape(const aStartPoint: TPointF): ImsShape; override;
 end;//TmsPicker

implementation

uses
 msRemoverIcon
 ;

// TmsShapeRemover

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

class function TmsShapeRemover.ButtonShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := TmsRemoverIcon.Create;
end;

end.
