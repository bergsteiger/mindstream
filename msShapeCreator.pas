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
 public
  class function Create(aShapeClass: RmsShape): ImsShapeCreator;
 end;//TmsShapeCreator

implementation

// TmsShapeCreator

constructor TmsShapeCreator.CreatePrim(aShapeClass: RmsShape);
begin
 inherited Create;
 f_ShapeClass := aShapeClass;
end;

class function TmsShapeCreator.Create(aShapeClass: RmsShape): ImsShapeCreator;
begin
 Result := CreatePrim(aShapeClass);
end;

function TmsShapeCreator.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
begin
 Result := f_ShapeClass.Create(aContext);
end;

end.
