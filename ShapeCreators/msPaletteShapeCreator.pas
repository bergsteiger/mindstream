unit msPaletteShapeCreator;

interface

uses
 msCompletedShapeCreator,
 msInterfaces
 ;

type
 TmsPaletteShapeCreator = class(TmsCompletedShapeCreator)
 // создатель TmsShape. ДЛЯ ПАЛИТРЫ!!
 protected
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape; override;
 public
  class function ButtonSize: Integer;
 end;//TmsPaletteShapeCreator

implementation

// TmsPaletteShapeCreator

function TmsPaletteShapeCreator.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
begin
 if ShapeClass.IsNullClick then
  Result := nil
 else
 if ShapeClass.IsTool then
  Result := nil
 else
  Result := inherited CreateShape(aContext);
end;

class function TmsPaletteShapeCreator.ButtonSize: Integer;
begin
 Result := 40;
end;

end.
