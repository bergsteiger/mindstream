unit msShapesGroup;
// - группа примитивов, работающая как один примитив

interface

uses
 System.Types,
 Generics.Collections,
 msInterfaces,
 msShape,
 msPointlessShape,
 msShapesList
 ;

type
 TmsShapesGroup = class(TmsPointlessShape)
 // [Декоратор (шаблон проектирования)|https://ru.wikipedia.org/wiki/%D0%94%D0%B5%D0%BA%D0%BE%D1%80%D0%B0%D1%82%D0%BE%D1%80_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)]
 // [Компоновщик (шаблон проектирования)|https://ru.wikipedia.org/wiki/%D0%9A%D0%BE%D0%BC%D0%BF%D0%BE%D0%BD%D0%BE%D0%B2%D1%89%D0%B8%D0%BA_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)]
 private
  f_Shapes : TmsShapesList;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
  function HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean; override;
  constructor CreateInner(const aShapes: array of ImsShape); reintroduce;
 public
  class function Create(const aShapes: array of ImsShape): ImsShape;
  procedure Cleanup; override;
 end;//TmsShapesGroup

implementation

uses
 System.SysUtils,
 System.Math,

 msShapeClass
 ;

// TmsShapesGroup

class function TmsShapesGroup.Create(const aShapes: array of ImsShape): ImsShape;
begin
 Result := CreateInner(aShapes);
end;

constructor TmsShapesGroup.CreateInner(const aShapes: array of ImsShape);
var
 l_Shape : ImsShape;
begin
 Assert(Length(aShapes) > 0, 'Пустую группу примитивов глупо создавать');
 inherited CreateInner(TmsShapeClass.Create(RmsShape(ClassType)), TmsMakeShapeContext.Create(TPointF.Create(0, 0), nil, nil));
 f_Shapes := TmsShapesList.Create;
 for l_Shape in aShapes do
  f_Shapes.Add(l_Shape);
end;

procedure TmsShapesGroup.Cleanup;
begin
 FreeAndNil(f_Shapes);
 inherited;
end;

procedure TmsShapesGroup.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Shape : ImsShape;
begin
 Assert(f_Shapes <> nil);
 for l_Shape in f_Shapes do
  l_Shape.DrawTo(aCtx);
end;

function TmsShapesGroup.GetDrawBounds: TRectF;
var
 l_Shape : ImsShape;
 l_R : TRectF;
begin
 Result.Left := High(Integer);
 Result.Top := High(Integer);
 Result.Right := Low(Integer);
 Result.Bottom := Low(Integer);
 Assert(f_Shapes <> nil);
 for l_Shape in f_Shapes do
 begin
  l_R := l_Shape.DrawBounds;
  Result.Left := Min(Result.Left, l_R.Left);
  Result.Top := Min(Result.Top, l_R.Top);
  Result.Right := Max(Result.Right, l_R.Right);
  Result.Bottom := Max(Result.Bottom, l_R.Bottom);
 end;//for l_Shape
end;

function TmsShapesGroup.HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean;
var
 l_Shape : ImsShape;
begin
 Assert(f_Shapes <> nil);
 Result := false;
 for l_Shape in f_Shapes do
  if l_Shape.HitTest(aPoint, theShape) then
  begin
   Result := true;
   theShape := Self;
   Exit;
  end;//l_Shape.HitTest(aPoint, theShape)
end;

end.
