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
  constructor CreatePrim(aShapeClass: RmsShape);
 protected
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
 end;//TmsShapeCreator

implementation

// TmsShapeCreator

constructor TmsShapeCreator.CreatePrim(aShapeClass: RmsShape);
begin
 inherited Create;
 f_ShapeClass := aShapeClass;
end;

function TmsShapeCreator.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
begin
 Result := f_ShapeClass.Create(aContext);
end;

end.
