unit msCoreObjects;

interface

uses
 System.Classes,
 System.Generics.Collections
 ;

type
 TmsLog = class;

 TmsLogLambda = reference to procedure (aLog: TmsLog);

 TmsLog = class
  strict private
   f_FS : TFileStream;
  public
   class procedure Log(const aFileName: String; aLambda: TmsLogLambda);
   constructor Create(const aFileName: String);
   destructor Destroy; override;
   procedure ToLog(const aString: AnsiString);
 end;//TmsLog

 TmsClassInstanceCount = record
  public
   rCount : Integer;
   rMaxCount : Integer;
   constructor Create(aCount: Integer);
   constructor IncCreate(const anOther: TmsClassInstanceCount);
   constructor DecCreate(const anOther: TmsClassInstanceCount);
 end;//TmsClassInstanceCount

 TmsClassInstanceCountList = TDictionary<String, TmsClassInstanceCount>;
 // ms-help://embarcadero.rs_xe7/libraries/System.Generics.Collections.TDictionary.html

 TmsDefferedObjects = class(TList<TObject>)
 // - список отложенных объектов
 //   http://programmingmindstream.blogspot.ru/2014/11/blog-post_8.html
 public
  destructor Destroy; override;
 end;//TmsDefferedObjects

 TmsObjectsWatcher = class
  // - следилка за объектами
  // НЕ является ПОТОКОБЕЗОПАСНОЙ
 private
  class var f_ObjectsCreatedCount : Integer;
  class var f_ObjectsCreated: TmsClassInstanceCountList;
  class var f_DefferedObjects : TmsDefferedObjects;
 public
  class procedure CreateObject(aClass: TClass; var theInstance: TObject);
  class procedure DestroyObject(anObject: TObject);
  class procedure ObjectCreated(anObject: TObject);
  class procedure ObjectDestroyed(anObject: TObject);
  class destructor Fini;
 end;//TmsObjectsWatcher

implementation

uses
 System.SysUtils,
 Math
 ;

// TmsClassInstanceCount

constructor TmsClassInstanceCount.Create(aCount: Integer);
begin
 rCount := aCount;
 rMaxCount := rCount;
end;

constructor TmsClassInstanceCount.IncCreate(const anOther: TmsClassInstanceCount);
begin
 Self := anOther;
 Inc(rCount);
 rMaxCount := Max(anOther.rMaxCount, rCount);
end;

constructor TmsClassInstanceCount.DecCreate(const anOther: TmsClassInstanceCount);
begin
 Self := anOther;
 Dec(rCount);
end;

destructor TmsDefferedObjects.Destroy;
var
 l_Object : TObject;
begin
 for l_Object in Self do
  FreeMem(Pointer(l_Object), l_Object.InstanceSize);
 inherited;
end;

// TmsObjectsWatcher

class procedure TmsObjectsWatcher.CreateObject(aClass: TClass; var theInstance: TObject);
begin
 GetMem(Pointer(theInstance), aClass.InstanceSize);
 // - распределяем память подобъекты сами. Зачем?
 //   Чтобы следить за повторным удалением.
 //   http://programmingmindstream.blogspot.ru/2014/11/blog-post_8.html
 aClass.InitInstance(theInstance);
 ObjectCreated(theInstance);
end;

class procedure TmsObjectsWatcher.DestroyObject(anObject: TObject);
const
 cMaxDefferedObjectsCount = 1000;
var
 l_P : Pointer;
begin
 if (f_DefferedObjects <> nil) then
  if (f_DefferedObjects.IndexOf(anObject) >= 0)then
   raise Exception.Create('Объект класса ' + anObject.ClassName + ' уже был освобождён');
 ObjectDestroyed(anObject);
 anObject.CleanupInstance;
 if (f_DefferedObjects = nil) then
  f_DefferedObjects := TmsDefferedObjects.Create;
 f_DefferedObjects.Add(anObject);
 if (f_DefferedObjects.Count > cMaxDefferedObjectsCount) then
 begin
  l_P := f_DefferedObjects.First;
  FreeMem(l_P);
  f_DefferedObjects.Delete(0);
 end;//f_DefferedObjects.Count > cMaxDefferedObjectsCount
 //FreeMem(Pointer(anObject));
end;

class procedure TmsObjectsWatcher.ObjectCreated(anObject: TObject);
var
 l_ClassName : String;
begin
 Inc(f_ObjectsCreatedCount);
 if (f_ObjectsCreated = nil) then
  f_ObjectsCreated := TmsClassInstanceCountList.Create;
 l_ClassName := anObject.ClassName;
 if (not f_ObjectsCreated.ContainsKey(l_ClassName)) then
  f_ObjectsCreated.Add(l_ClassName, TmsClassInstanceCount.Create(1))
 else
  f_ObjectsCreated.Items[l_ClassName] := TmsClassInstanceCount.IncCreate(f_ObjectsCreated.Items[l_ClassName]);
end;

class procedure TmsObjectsWatcher.ObjectDestroyed(anObject: TObject);
var
 l_ClassName : String;
begin
 Assert(f_ObjectsCreatedCount > 0, 'Какие-то объекты уже были освобождены несколько раз');
 if (f_ObjectsCreated <> nil) then
 begin
  l_ClassName := anObject.ClassName;
  if f_ObjectsCreated.ContainsKey(l_ClassName) then
   f_ObjectsCreated.Items[l_ClassName] := TmsClassInstanceCount.DecCreate(f_ObjectsCreated.Items[l_ClassName]);
 end;//f_ObjectsCreated <> nil
 Dec(f_ObjectsCreatedCount);
end;

class procedure TmsLog.Log(const aFileName: String; aLambda: TmsLogLambda);
var
 l_Log : TmsLog;
begin
 l_Log := Create(aFileName);
 try
  aLambda(l_Log);
 finally
  FreeAndNil(l_Log);
 end;//try..finally
end;

constructor TmsLog.Create(const aFileName: String);
begin
 inherited Create;
 f_FS := TFileStream.Create(aFileName, fmCreate);
end;

destructor TmsLog.Destroy;
begin
 FreeAndNil(f_FS);
 inherited;
end;

procedure TmsLog.ToLog(const aString: AnsiString);
const
 cEOL : ANSIString = #13#10;
begin//OutLn
 f_FS.Write(aString[1], Length(aString));
 f_FS.Write(cEOL[1], Length(cEOL));
end;//OutLn

class destructor TmsObjectsWatcher.Fini;
begin
 if (f_ObjectsCreated <> nil) then
  if (f_ObjectsCreated.Count > 0) then
  begin
   // Далее выводим статистику неосвобождённых объектов в лог:
   TmsLog.Log(ParamStr(0) + '.objects.log',
    procedure (aLog: TmsLog)
    var
     l_Item : TPair<String, TmsClassInstanceCount>;
    begin
     aLog.ToLog('Неосвобождено объектов: ' + IntToStr(f_ObjectsCreatedCount));
     for l_Item in f_ObjectsCreated do
     begin
      aLog.ToLog(l_Item.Key + ' Неосвобождено: ' + IntToStr(l_Item.Value.rCount) + ' Максимально распределено: ' + IntToStr(l_Item.Value.rMaxCount));
     end;//for l_Key
    end
   );
  end;//f_ObjectsCreated.Count > 0
 FreeAndNil(f_ObjectsCreated);
 FreeAndNil(f_DefferedObjects);
 if (f_ObjectsCreatedCount > 0) then
  raise Exception.Create('Какие-то объекты не освобождены: ' + IntToStr(f_ObjectsCreatedCount));
end;

end.
