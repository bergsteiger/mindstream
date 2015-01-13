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
 public
  destructor Destroy; override;
 end;//TmsShapesGroup

implementation

uses
 System.SysUtils
 ;

destructor TmsShapesGroup.Destroy;
begin
 FreeAndNil(f_Shapes);
 inherited;
end;

end.
