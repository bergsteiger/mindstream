unit msInterfacedNonRefcounted;

interface

uses
 msCoreObjects
 ;

type
 TmsInterfacedNonRefcounted = class abstract(TmsWatchedObject)
  // - реализация объектов реализующих интерфейсы, но БЕЗ подсчёта ссылок
  //   т.е. присваиваемый объект - НЕ ЗАХВАТЫВАЕТСЯ и "владелец" - НЕ УПРАВЛЯЕТ временем жизни
  //   Зачем? Чтобы избежать кросс-ссылок.
  //   От TmsInterfacedNonRefcounted должны наследоваться объекты-контейнеры,
  //   которые хотят сообщать своим "детям" свои интерфейсы.
  //
  //   Тут есть одна ТОНКОСТЬ - объект-контейнер - в СВОЮ очередь может являться
  //   "ребёнком", но мы это потом - РАЗРУЛИМ, когда дойдём.
 protected
  function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  function _AddRef: Integer; stdcall;
  function _Release: Integer; stdcall;
 end;//TmsInterfacedNonRefcounted

implementation

// TmsInterfacedNonRefcounted

function TmsInterfacedNonRefcounted.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
 Result := E_NoInterface;
end;

function TmsInterfacedNonRefcounted._AddRef: Integer;
begin
 Result := -1;
end;

function TmsInterfacedNonRefcounted._Release: Integer;
begin
 Result := -1;
end;

end.
