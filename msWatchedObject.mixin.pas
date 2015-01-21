{$IfNDef TmsWatchedObject_uses_intf}

// interface

{$Define TmsWatchedObject_uses_intf}

// uses
 {$Include msObjectWrap.mixin.pas}
 ,
 msCoreObjects

{$Else TmsWatchedObject_uses_intf}

{$IfNDef TmsWatchedObject}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsWatchedObject}

 TmsObjectWrapParent = TmsWatchedObjectParent;
 {$Include msObjectWrap.mixin.pas}
 TmsWatchedObjectPrim = class abstract(TmsObjectWrap)
 protected
  procedure Cleanup; virtual;
  // - функция для очистки состояния объекта. Её надо перекрывать ВМЕСТО Destroy.
 public
  destructor Destroy; override;
 end;//TmsWatchedObjectPrim

 TmsWatchedObject = class abstract(TmsWatchedObjectPrim)
 // - Класс, который умеет контроллировать создание/уничтожение своих экземпляров
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
 end;//TmsWatchedObject

{$Else TmsWatchedObject}

// implementation

{$IfNDef TmsWatchedObject_uses_impl}

// uses
 {$Include msObjectWrap.mixin.pas}
 SysUtils

{$Define TmsWatchedObject_uses_impl}

{$Else TmsWatchedObject_uses_impl}

{$Include msObjectWrap.mixin.pas}

procedure TmsWatchedObjectPrim.Cleanup;
begin
 // - Ничего не делаем
end;

destructor TmsWatchedObjectPrim.Destroy;
begin
 Cleanup;
 inherited;
end;

// TmsWatchedObject

class function TmsWatchedObject.NewInstance: TObject;
begin
 TmsObjectsWatcher.CreateObject(Self, Result);
end;

procedure TmsWatchedObject.FreeInstance;
begin
 TmsObjectsWatcher.DestroyObject(Self);
end;

{$EndIf TmsWatchedObject_uses_impl}

{$EndIf TmsWatchedObject}
{$EndIf TmsWatchedObject_uses_intf}
