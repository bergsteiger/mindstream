{$IfNDef TmsWatchedObject_uses_intf}

// interface

{$Define TmsWatchedObject_uses_intf}

// uses
 {$Include msObjectWrap.mixin.pas}
(* ,
 msCoreObjects*)

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
  procedure InstanceAllocated; virtual;
  // - функция для инициализации объекта СРАЗУ после его создания. Ещё ДО конструктора.
  procedure InstanceWillBeDestroyed; virtual;
  // - функция вызываемая ПОСЛЕ деструктора, но ПЕРЕД реальным освобождением объекта
 public
(*  class function NewInstance: TObject; override; final;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override; final;*)
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
  constructor Create;
  destructor Destroy; override; final;
 end;//TmsWatchedObjectPrim

 TmsWatchedObject = class abstract(TmsWatchedObjectPrim)
 // - Класс, который умеет контроллировать создание/уничтожение своих экземпляров
(* public
  procedure NewInstance(var aDummy); reintroduce;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance(var aDummy); reintroduce;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
  procedure Destroy(var aDummy); reintroduce;
  procedure Free(var aDummy); reintroduce;*)
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

constructor TmsWatchedObjectPrim.Create;
begin
 inherited;
 InstanceAllocated;
end;

destructor TmsWatchedObjectPrim.Destroy;
begin
 Cleanup;
 InstanceWillBeDestroyed;
 inherited;
end;

procedure TmsWatchedObjectPrim.InstanceAllocated;
begin
 // - Ничего не делаем
end;

procedure TmsWatchedObjectPrim.InstanceWillBeDestroyed;
begin
 // - Ничего не делаем
end;

(*class function TmsWatchedObjectPrim.NewInstance: TObject;
begin
 Result := inherited;
 //TmsObjectsWatcher.CreateObject(Self, Result);
 TmsWatchedObjectPrim(Result).InstanceAllocated;
end;

procedure TmsWatchedObjectPrim.FreeInstance;
begin
 Self.InstanceWillBeDestroyed;
 inherited;
 //TmsObjectsWatcher.DestroyObject(Self);
end;*)

// TmsWatchedObject

(*procedure TmsWatchedObject.Destroy(var aDummy);
begin
 raise Exception.Create('Надо использовать FreeAndNil, а не Destroy');
end;

procedure TmsWatchedObject.Free(var aDummy);
begin
 raise Exception.Create('Надо использовать FreeAndNil, а не Free');
end;

procedure TmsWatchedObject.NewInstance(var aDummy);
begin
 raise Exception.Create('Нельзя ни перекрывать, ни вызывать NewInstance');
end;

procedure TmsWatchedObject.FreeInstance(var aDummy);
begin
 raise Exception.Create('Нельзя ни перекрывать, ни вызывать FreeInstance');
end;*)

{$EndIf TmsWatchedObject_uses_impl}

{$EndIf TmsWatchedObject}
{$EndIf TmsWatchedObject_uses_intf}
