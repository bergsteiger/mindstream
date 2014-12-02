unit msCoreObjects;

interface

type
 TmsObjectsWatcher = class
  // - следилка за объектами
  // НЕ является ПОТОКОБЕЗОПАСНОЙ
 public
  class procedure ObjectCreated(anObject: TObject);
  class procedure ObjectDestroyed(anObject: TObject);
 end;//TmsObjectsWatcher

 TmsInterfacedNonRefcounted = class abstract(TObject)
  // - реализация объектов реализующих интерфейсы, но БЕЗ подсчёта ссылок
  //   т.е. присваиваемы объект - НЕ ЗАХВАТЫВАЕТСЯ и "владелец" - НЕ УПРАВЛЯЕТ временем жизни
  //   Зачем? Чтобы избежать кросс-ссылок.
  //   От TmsInterfacedNonRefcounted должны наследоваться объекты-контейнеры,
  //   которые хотят сообщать своим "детям" свои интерфейсы.
  //
  //   Тут есть одна ТОНКОСТЬ - объект-контейнер - в СВОЮ очередь может являться
  //   "ребёнком", но мы это потом - РАЗРУЛИМ, когда дойдём.
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
 protected
  function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  function _AddRef: Integer; stdcall;
  function _Release: Integer; stdcall;
 end;//TmsInterfacedNonRefcounted

 TmsInterfacedRefcounted = class abstract(TInterfacedObject)
  // Реализация объектов, реализующих интерфейсы. С ПОДСЧЁТОМ ссылок.
  //
  // НЕ САМАЯ хорошая реализация, лучше реализация тут - http://18delphi.blogspot.ru/2013/04/iunknown.html
  // но в учётом ARC - пользуемся пока "нативной реализаией"
  //
  // Таже ещё есть вот что "почитать":
  // - http://18delphi.blogspot.ru/2013/07/blog-post_3683.html
  // - http://18delphi.blogspot.ru/2013/07/1.html
  // - http://18delphi.blogspot.ru/2013/07/2.html
  // - http://18delphi.blogspot.ru/2013/07/2_18.html
  // - http://18delphi.blogspot.ru/2013/07/blog-post_8789.html
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
 end;//TmsInterfacedRefcounted

implementation

// TmsObjectsWatcher

class procedure TmsObjectsWatcher.ObjectCreated(anObject: TObject);
begin
end;

class procedure TmsObjectsWatcher.ObjectDestroyed(anObject: TObject);
begin
end;

// TmsInterfacedNonRefcounted

class function TmsInterfacedNonRefcounted.NewInstance: TObject;
begin
 Result := inherited NewInstance;
 TmsObjectsWatcher.ObjectCreated(Result);
end;

procedure TmsInterfacedNonRefcounted.FreeInstance;
begin
 TmsObjectsWatcher.ObjectDestroyed(Self);
 inherited;
end;

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

//TmsInterfacedRefcounted

class function TmsInterfacedRefcounted.NewInstance: TObject;
begin
 Result := inherited NewInstance;
 TmsObjectsWatcher.ObjectCreated(Result);
end;

procedure TmsInterfacedRefcounted.FreeInstance;
begin
 TmsObjectsWatcher.ObjectDestroyed(Self);
 inherited;
end;

end.
