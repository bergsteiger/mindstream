unit msShapesList;

interface

uses
 {$Include msWatchedObject.mixin.pas}
 ,
 Generics.Collections,
 msInterfaces
 ;

type
 TmsWatchedObjectParent = class(TList<ImsShape>);
 {$Include msWatchedObject.mixin.pas}
 TmsShapesList = class(TmsWatchedObject)
 end;//TmsShapesList

implementation

uses
 {$Include msWatchedObject.mixin.pas}
 ;

{$Include msWatchedObject.mixin.pas}

end.
