unit msShapesGroup;
// - группа примитивов, работающая как один примитив

interface

uses
 System.Types,
 Generics.Collections,
 msInterfaces,
 msShape
 ;

type
 TmsShapesList = class(TList<ImsShape>)
 end;//TmsShapesList

 TmsShapesGroup = class(TmsShape)
 private
  f_Shapes : TmsShapesList;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
 public
  destructor Destroy; override;
 end;//TmsShapesGroup

implementation

uses
 System.SysUtils,
 System.Math
 ;

// TmsShapesGroup

destructor TmsShapesGroup.Destroy;
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

end.
