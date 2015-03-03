unit msShapeCreator;

interface

uses
 System.Types,

 msInterfaces,
 msInterfacedRefcounted,
 msShape
 ;

type
 TmsShapeCreator = class(TmsInterfacedRefcounted, ImsShapeCreator, ImsShapeCreatorFriend)
 // создатель TmsShape
 private
  f_ShapeClass : RmsShape;
  // - класс примитивов для создания
  f_ShapeMC : ImsShapeClass;
  constructor CreatePrim(const aShapeMC : ImsShapeClass; aShapeClass: RmsShape);
 protected
  property ShapeClass : RmsShape
  read f_ShapeClass;
  // - класс примитивов для создания
 protected
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape; overload; virtual;
  function CreateShape(const aStartPoint: TPointF): ImsShape; overload;
  function ShapeClassForCreate: TClass;
 public
  class function Create(const aShapeMC : ImsShapeClass; aShapeClass: RmsShape): ImsShapeCreator; overload;
  class function Create(aShapeClass: RmsShape): ImsShapeCreator; overload;
 end;//TmsShapeCreator

 TmsShapeFriend = class(TmsShape)
 end;//TmsShapeFriend

 RmsShapeFriend = class of TmsShapeFriend;


implementation

uses
 msShapeClass
 ;

// TmsShapeCreator

constructor TmsShapeCreator.CreatePrim(const aShapeMC : ImsShapeClass; aShapeClass: RmsShape);
begin
 inherited Create;
 f_ShapeClass := aShapeClass;
 f_ShapeMC := aShapeMC;
end;

class function TmsShapeCreator.Create(const aShapeMC : ImsShapeClass; aShapeClass: RmsShape): ImsShapeCreator;
begin
 Result := CreatePrim(aShapeMC, aShapeClass);
end;

class function TmsShapeCreator.Create(aShapeClass: RmsShape): ImsShapeCreator;
begin
 Result := Create(aShapeClass.MC, aShapeClass);
end;

function TmsShapeCreator.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
begin
 Result := RmsShapeFriend(f_ShapeClass).Create(f_ShapeMC, aContext);
end;

function TmsShapeCreator.CreateShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := CreateShape(TmsMakeShapeContext.Create(aStartPoint, nil, nil));
end;

function TmsShapeCreator.ShapeClassForCreate: TClass;
begin
 Result := f_ShapeClass;
end;

end.
