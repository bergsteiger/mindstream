unit msObject;

interface

uses
 {$Include msWatchedObject.mixin.pas}
 ,
 Generics.Collections,
 msInterfaces
 ;

type
 TmsWatchedObjectParent = TObject;
 {$Include msWatchedObject.mixin.pas}
 TmsObject = class(TmsWatchedObject)
 end;//TmsObject

implementation

uses
 {$Include msWatchedObject.mixin.pas}
 ;

{$Include msWatchedObject.mixin.pas}

end.
