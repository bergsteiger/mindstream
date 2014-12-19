unit msShapeCreator;

interface

uses
 msInterfaces,
 msInterfacedRefcounted,
 msShape
 ;

type
 TmsShapeCreator = class(TmsInterfacedRefcounted, ImsShapeCreator)
 private
  f_ShapeClass : RmsShape;
 protected
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
 end;//TmsShapeCreator

implementation

// TmsShapeCreator

function TmsShapeCreator.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
begin
 Result := f_ShapeClass.Create(aContext);
end;

end.
