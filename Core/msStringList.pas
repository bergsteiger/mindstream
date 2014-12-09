unit msStringList;

interface

uses
 {$Include msWatchedObject.mixin.pas}
 ,
 System.Classes
 ;

type
 TmsWatchedObjectParent = TStringList;
 {$Include msWatchedObject.mixin.pas}
 TmsStringList = class abstract(TmsWatchedObject)
 // -  ласс, который умеет контроллировать создание/уничтожение своих экземпл€ров
 end;//TmsStringList

implementation

uses
 {$Include msWatchedObject.mixin.pas}
;

{$Include msWatchedObject.mixin.pas}

end.
