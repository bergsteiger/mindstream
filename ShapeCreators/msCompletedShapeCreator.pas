unit msCompletedShapeCreator;

interface

uses
 msShapeCreator,
 msInterfaces
 ;

type
 TmsCompletedShapeCreator = class(TmsShapeCreator)
 // ñîçäàòåëü TmsShape. Íî! ÇÀÊÎÍ×ÅÍÍÛÕ ÏĞÈÌÈÒÈÂÎÂ
 protected
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape; override;
 end;//TmsCompletedShapeCreator

implementation

// TmsCompletedShapeCreator

function TmsCompletedShapeCreator.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
begin
 if ShapeClass.IsTool then
 begin
  Assert(false);
  Result := nil;
 end//ShapeClass.IsTool
 else
  Result := inherited CreateShape(aContext);
end;

end.
