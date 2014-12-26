unit msShapeCreator;

interface

uses
 msInterfaces,
 msInterfacedRefcounted,
 msShape
 ;

type
 TmsShapeCreator = class(TmsInterfacedRefcounted, ImsShapeCreator)
 // создатель TmsShape
 private
  f_ShapeClass : RmsShape;
  // - класс примитивов для создания
  constructor CreatePrim(aShapeClass: RmsShape);
 protected
  property ShapeClass : RmsShape
  read f_ShapeClass;
  // - класс примитивов для создания
 protected
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape; virtual;
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

type
 TmsShapeFriend = class(TmsShape)
 end;//TmsShapeFriend

 RmsShapeFriend = class of TmsShapeFriend;

function TmsShapeCreator.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
begin
 Result := RmsShapeFriend(f_ShapeClass).Create(aContext);
end;

end.
