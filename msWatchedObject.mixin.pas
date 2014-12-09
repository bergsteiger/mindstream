{$IfNDef TmsWatchedObject_uses_intf}

// interface

{$Define TmsWatchedObject_uses_intf}

// uses

 msCoreObjects

{$Else TmsWatchedObject_uses_intf}

{$IfNDef TmsWatchedObject}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsWatchedObject}

 TmsWatchedObject = class abstract(TmsWatchedObjectParent)
 // - Класс, который умеет контроллировать создание/уничтожение своих экземпляров
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
  function toObject: TObject;
 end;//TmsWatchedObject

{$Else TmsWatchedObject}

// implementation

{$IfNDef TmsWatchedObject_uses_impl}

// uses
 SysUtils

{$Define TmsWatchedObject_uses_impl}

{$Else TmsWatchedObject_uses_impl}

// TmsWatchedObject

class function TmsWatchedObject.NewInstance: TObject;
begin
 TmsObjectsWatcher.CreateObject(Self, Result);
end;

procedure TmsWatchedObject.FreeInstance;
begin
 TmsObjectsWatcher.DestroyObject(Self);
end;

function TmsWatchedObject.toObject: TObject;
begin
 Result := Self;
end;

{$EndIf TmsWatchedObject_uses_impl}

{$EndIf TmsWatchedObject}
{$EndIf TmsWatchedObject_uses_intf}
