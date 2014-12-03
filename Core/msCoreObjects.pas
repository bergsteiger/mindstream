unit msCoreObjects;

interface

uses
 System.Classes,
 System.Generics.Collections
 ;

type
 TmsClassInstanceCountList = TDictionary<String, Integer>;
 // ms-help://embarcadero.rs_xe7/libraries/System.Generics.Collections.TDictionary.html

 TmsObjectsWatcher = class
  // - следилка за объектами
  // НЕ является ПОТОКОБЕЗОПАСНОЙ
 private
  class var f_ObjectsCreatedCount : Integer;
  class var f_ObjectsCreated: TmsClassInstanceCountList;
 public
  class procedure ObjectCreated(anObject: TObject);
  class function ObjectDestroyed(anObject: TObject): Boolean;
  class destructor Destroy;
 end;//TmsObjectsWatcher

 TmsWatchedObject = class abstract(TObject)
 // - Класс, который умеет контроллировать создание/уничтожение своих экземпляров
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
 end;//TmsWatchedObject

 TmsStringList = class abstract(TStringList)
 // - Класс, который умеет контроллировать создание/уничтожение своих экземпляров
 public
  class function NewInstance: TObject; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.NewInstance.html
  procedure FreeInstance; override;
  // ms-help://embarcadero.rs_xe7/libraries/System.TObject.FreeInstance.html
 end;//TmsStringList

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
begin
 Inc(f_ObjectsCreatedCount);
 if (f_ObjectsCreated = nil) then
  f_ObjectsCreated := TmsClassInstanceCountList.Create;
 l_ClassName := anObject.ClassName;
 if (not f_ObjectsCreated.ContainsKey(l_ClassName)) then
  f_ObjectsCreated.Add(l_ClassName, 1)
 else
  f_ObjectsCreated.Items[l_ClassName] := f_ObjectsCreated.Items[l_ClassName] + 1;
end;

class function TmsObjectsWatcher.ObjectDestroyed(anObject: TObject): Boolean;
var
 l_ClassName : String;
begin
 Assert(f_ObjectsCreatedCount > 0, 'Какие-то объекты уже были освобождены несколько раз');
 if (f_ObjectsCreated <> nil) then
 begin
  l_ClassName := anObject.ClassName;
  if f_ObjectsCreated.ContainsKey(l_ClassName) then
   f_ObjectsCreated.Items[l_ClassName] := f_ObjectsCreated.Items[l_ClassName] - 1;
 end;//f_ObjectsCreated <> nil
 Dec(f_ObjectsCreatedCount);
end;

class destructor TmsObjectsWatcher.Destroy;
var
 l_FS : TFileStream;

 procedure OutLn(const aStr: ANSIString);
 const
  cEOL : ANSIString = #13#10;
 begin//OutLn
  l_FS.Write(aStr[1], Length(aStr));
  l_FS.Write(cEOL[1], Length(cEOL));
 end;//OutLn

var
 l_Key : String;
begin
 if (f_ObjectsCreated <> nil) then
  if (f_ObjectsCreated.Count > 0) then
  begin
   // Далее выводим статистику неосвобождённых объектов в лог:
   l_FS := TFileStream.Create(ParamStr(0) + '.objects.log', fmCreate);
   try
    OutLn('Неосвобождено объектов: ' + IntToStr(f_ObjectsCreatedCount));
    for l_Key in f_ObjectsCreated.Keys do
    begin
     OutLn(l_Key + ' : ' + IntToStr(f_ObjectsCreated[l_Key]));
    end;//for l_Index
   finally
    FreeAndNil(l_FS);
   end;//try..finally
  end;//f_ObjectsCreated.Count > 0
 FreeAndNil(f_ObjectsCreated);
 if (f_ObjectsCreatedCount > 0) then
  raise Exception.Create('Какие-то объекты не освобождены: ' + IntToStr(f_ObjectsCreatedCount));
end;

// TmsWatchedObject

class function TmsWatchedObject.NewInstance: TObject;
begin
 Result := inherited NewInstance;
 TmsObjectsWatcher.ObjectCreated(Result);
end;

procedure TmsWatchedObject.FreeInstance;
begin
 if TmsObjectsWatcher.ObjectDestroyed(Self) then
  inherited;
end;

// TmsStringList

class function TmsStringList.NewInstance: TObject;
begin
 Result := inherited NewInstance;
 TmsObjectsWatcher.ObjectCreated(Result);
end;

procedure TmsStringList.FreeInstance;
begin
 if TmsObjectsWatcher.ObjectDestroyed(Self) then
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
 if TmsObjectsWatcher.ObjectDestroyed(Self) then
  inherited;
end;

end.
