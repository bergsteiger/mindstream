unit msCoreObjects;

interface

uses
 System.Classes
 ;

type
 TmsObjectsWatcher = class
  // - следилка за объектами
  // НЕ является ПОТОКОБЕЗОПАСНОЙ
 private
  class var f_ObjectsCreatedCount : Integer;
  class var f_ObjectsCreated: TStringList;
  // ms-help://embarcadero.rs_xe7/libraries/System.Classes.TStringList.html
 public
  class procedure ObjectCreated(anObject: TObject);
  class procedure ObjectDestroyed(anObject: TObject);
  class destructor Destroy;
 end;//TmsObjectsWatcher

 TmsWatchedObject = class abstract(TObject)
 // - Класс, который умеетконтроллировать создание/уничтожение своих экземпляров
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
 end;//TmsWatchedObject

 TmsInterfacedNonRefcounted = class abstract(TmsWatchedObject)
  // - реализация объектов реализующих интерфейсы, но БЕЗ подсчёта ссылок
  //   т.е. присваиваемы объект - НЕ ЗАХВАТЫВАЕТСЯ и "владелец" - НЕ УПРАВЛЯЕТ временем жизни
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

uses
 System.SysUtils
 ;

// TmsObjectsWatcher

class procedure TmsObjectsWatcher.ObjectCreated(anObject: TObject);
var
 l_ClassName : String;
 l_Index : Integer;
begin
 Inc(f_ObjectsCreatedCount);
 if (f_ObjectsCreated = nil) then
  f_ObjectsCreated := TStringList.Create;
 l_ClassName := anObject.ClassName;
 l_Index := f_ObjectsCreated.IndexOf(l_ClassName);
 if (l_Index < 0) then
  f_ObjectsCreated.AddObject(l_ClassName, TObject(0))
 else
  f_ObjectsCreated.Objects[l_Index] := TObject(Integer(f_ObjectsCreated.Objects[l_Index]) + 1)
end;

class procedure TmsObjectsWatcher.ObjectDestroyed(anObject: TObject);
begin
 Assert(f_ObjectsCreatedCount > 0, 'Какие-то объекты уже были освобождены несколько раз');
 Dec(f_ObjectsCreatedCount);
end;

class destructor TmsObjectsWatcher.Destroy;
var
 l_FS : TFileStream;
begin
 if (f_ObjectsCreatedCount > 0) then
 begin
  Assert(f_ObjectsCreated <> nil);
  Assert(f_ObjectsCreated.Count > 0);
  // Далее выводим статистику неосвобождённых объектов в лог:
  l_FS := TFileStream.Create(ParamStr(0) + '.objects.log', fmCreate);
  try

  finally
   FreeAndNil(l_FS);
  end;//try..finally
  f_ObjectsCreatedCount := 0;
  // - чтобы дальше не падать
 end;//f_ObjectsCreatedCount > 0
 Assert(f_ObjectsCreatedCount = 0, 'Какие-то объекты не освобождены');
 FreeAndNil(f_ObjectsCreated);
end;

// TmsWatchedObject

class function TmsWatchedObject.NewInstance: TObject;
begin
 Result := inherited NewInstance;
 TmsObjectsWatcher.ObjectCreated(Result);
end;

procedure TmsWatchedObject.FreeInstance;
begin
 TmsObjectsWatcher.ObjectDestroyed(Self);
 inherited;
end;

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
