{$IfNDef TmsMarshal_uses_intf}

// interface

{$Define TmsMarshal_uses_intf}

// uses

 msCoreObjects

{$Else TmsMarshal_uses_intf}

{$IfNDef TmsMarshal}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsMarshal}

 TmsWatchedObject = class abstract(TObject)
 // - Класс, который умеет контроллировать создание/уничтожение своих экземпляров
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
 end;//TmsWatchedObject

{$Else TmsMarshal}

// implementation

{$IfNDef TmsMarshal_uses_impl}

// uses
 SysUtils

{$Define TmsMarshal_uses_impl}

{$Else TmsMarshal_uses_impl}

// TmsWatchedObject

class function TmsWatchedObject.NewInstance: TObject;
begin
 TmsObjectsWatcher.CreateObject(Self, Result);
end;

procedure TmsWatchedObject.FreeInstance;
begin
 TmsObjectsWatcher.DestroyObject(Self);
end;

{$EndIf TmsMarshal_uses_impl}

{$EndIf TmsMarshal}
{$EndIf TmsMarshal_uses_intf}
