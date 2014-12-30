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

uses
  System.Types
  ;

// TmsCompletedShapeCreator

function TmsCompletedShapeCreator.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
var
 l_EndPont : TPointF;
begin
 if ShapeClass.IsTool then
 begin
  Assert(false);
  Result := nil;
 end//ShapeClass.IsTool
 else
 begin
  Result := inherited CreateShape(aContext);
  if Result.IsNeedsSecondClick then
  begin
   l_EndPont := aContext.rStartPoint;
   l_EndPont.Offset(100, 100);
   Result.EndTo(TmsEndShapeContext.Create(l_EndPont, aContext.rShapesController, aContext.rDiagrammsHolder));
  end;//Result.IsNeedsSecondClick
 end;//ShapeClass.IsTool
end;

end.
