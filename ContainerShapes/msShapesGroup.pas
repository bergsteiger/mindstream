unit msShapesGroup;
// - группа примитивов, работающая как один примитив

interface

uses
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
 public
  destructor Destroy; override;
 end;//TmsShapesGroup

implementation

uses
 System.SysUtils
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

end.
