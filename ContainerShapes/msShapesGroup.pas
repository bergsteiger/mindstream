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
 end;//TmsShapesGroup

implementation

end.
