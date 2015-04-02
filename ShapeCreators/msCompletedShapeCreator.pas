unit msCompletedShapeCreator;

interface

uses
 System.Types,

 msShapeCreator,
 msInterfaces,
 msInterfacedRefcounted,
 msShape
 ;

type
 TmsCompletedShapeCreator = class(TmsInterfacedRefcounted, ImsShapeCreator)
 // создатель TmsShape. Но! ЗАКОНЧЕННЫХ ПРИМИТИВОВ
 private
  f_ShapeClass : MCmsShape;
  // - класс примитивов для создания
  constructor CreatePrim(const aShapeClass: MCmsShape);
 protected
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape; overload; virtual;
  function CreateShape(const aStartPoint: TPointF): ImsShape; overload;
  procedure Cleanup; override;
 protected
  property ShapeClass : MCmsShape
  read f_ShapeClass;
  // - класс примитивов для создания
 public
  class function Create(const aShapeClass: MCmsShape): ImsShapeCreator;
 end;//TmsCompletedShapeCreator

implementation

uses
  msTool
  ;

// TmsCompletedShapeCreator

constructor TmsCompletedShapeCreator.CreatePrim(const aShapeClass: MCmsShape);
begin
 inherited Create;
 f_ShapeClass := aShapeClass;
end;

class function TmsCompletedShapeCreator.Create(const aShapeClass: MCmsShape): ImsShapeCreator;
begin
 Result := CreatePrim(aShapeClass);
end;

procedure TmsCompletedShapeCreator.Cleanup;
begin
 f_ShapeClass := nil;
 inherited;
end;

function TmsCompletedShapeCreator.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
var
 l_EndPont : TPointF;
begin
 Assert(ShapeClass <> nil);
 if ShapeClass.IsTool then
 begin
  Assert(false);
  Result := nil;
 end//ShapeClass.IsTool
 else
 begin
  Result := ShapeClass.CreateShape(aContext);
  if Result.IsNeedsSecondClick then
  begin
   l_EndPont := aContext.rStartPoint;
   l_EndPont.Offset(100, 100);
   Result.EndTo(TmsEndShapeContext.Create(l_EndPont, aContext.rShapesController, aContext.rDiagrammsHolder));
  end;//Result.IsNeedsSecondClick
 end;//ShapeClass.IsTool
end;

function TmsCompletedShapeCreator.CreateShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := CreateShape(TmsMakeShapeContext.Create(aStartPoint, nil, nil));
end;

end.
