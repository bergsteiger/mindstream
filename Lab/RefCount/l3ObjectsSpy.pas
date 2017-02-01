unit l3ObjectsSpy;

interface

procedure Test;

implementation

uses
 System.SysUtils
 , System.Classes
 , System.Generics.Collections
 , WinApi.Windows
 ;

type
 Tl3SpiedObjects = class(TList<Pointer>)
 end;//Tl3SpiedObjects

 Tl3ObjectsSpy = class(Tl3SpiedObjects)
  strict private
   class var g_Instance: Tl3ObjectsSpy;
  public
   class procedure LogNew(anObject: TObject);
   class procedure LogFree(anObject: TObject);
   class procedure HookClasses;
   class procedure CheckUnfreed;
 end;//Tl3ObjectsSpy

class procedure Tl3ObjectsSpy.LogNew(anObject: TObject);
begin
 if (g_Instance = nil) then
  g_Instance := Tl3ObjectsSpy.Create;
 g_Instance.Add(anObject);
end;

class procedure Tl3ObjectsSpy.LogFree(anObject: TObject);
begin
 if (g_Instance <> nil) then
  g_Instance.Remove(anObject);
end;

procedure DoHookClasses; forward;

class procedure Tl3ObjectsSpy.HookClasses;
begin
 DoHookClasses;
end;

class procedure Tl3ObjectsSpy.CheckUnfreed;
begin
 if (g_Instance <> nil) then
  if (g_Instance.Count > 0) then
   WriteLn(g_Instance.Count);
end;

type
 PMem = PAnsiChar;

function NewInstancePtr(aClass: TClass): PPointer;
begin
 Result := PPointer(PMem(aClass) + vmtNewInstance);
end;

function FreeInstancePtr(aClass: TClass): PPointer;
begin
 Result := PPointer(PMem(aClass) + vmtFreeInstance);
end;

procedure LogNew(anObject: TObject);
begin
 Tl3ObjectsSpy.LogNew(anObject);
end;

procedure LogFree(anObject: TObject);
begin
 Tl3ObjectsSpy.LogFree(anObject);
end;

type
 THackObject = class(TObject)
  public
   class function NewInstance: TObject; override;
   procedure FreeInstance; override;
 end;//THackObject

class function THackObject.NewInstance: TObject;
begin
 Result := inherited NewInstance;
 LogNew(Result);
end;

procedure THackObject.FreeInstance;
begin
 LogFree(Self);
 inherited FreeInstance;
end;

type
 THackInterfacedObject = class(TInterfacedObject)
  public
   class function NewInstance: TObject; override;
   procedure FreeInstance; override;
 end;//THackInterfacedObject

class function THackInterfacedObject.NewInstance: TObject;
begin
 Result := inherited NewInstance;
 LogNew(Result);
end;

procedure THackInterfacedObject.FreeInstance;
begin
 LogFree(Self);
 inherited FreeInstance;
end;

procedure HookPtr(aPointer: PPointer; aValue: Pointer);
var
 l_Old : DWORD;
 l_New : DWORD;
begin
 VirtualProtect(aPointer, SizeOf(Pointer), PAGE_EXECUTE_READWRITE, l_Old);
 try
  aPointer^ := aValue;
 finally
  VirtualProtect(aPointer, SizeOf(Pointer), l_Old, l_New);
 end;
end;

function HookPtrDone(aPointer: PPointer; aFrom: Pointer; aTo: Pointer): Boolean;
begin
 Result := (aPointer^ = aFrom);
 if Result then
  HookPtr(aPointer, aTo);
end;

function HookNew(aClass: TClass): Boolean;
var
 l_Ptr : PPointer;
begin
 Result := true;
 l_Ptr := NewInstancePtr(aClass);
 if HookPtrDone(l_Ptr, @TObject.NewInstance, @THackObject.NewInstance) then
  Exit;
 if HookPtrDone(l_Ptr, @TInterfacedObject.NewInstance, @THackInterfacedObject.NewInstance) then
  Exit;
 Result := false;
end;

function HookFree(aClass: TClass): Boolean;
var
 l_Ptr : PPointer;
begin
 Result := true;
 l_Ptr := FreeInstancePtr(aClass);
 if HookPtrDone(l_Ptr, @TObject.FreeInstance, @THackObject.FreeInstance) then
  Exit;
 if HookPtrDone(l_Ptr, @TInterfacedObject.FreeInstance, @THackInterfacedObject.FreeInstance) then
  Exit;
 Result := false;
end;

function HookClassPrim(aClass: TClass): Boolean;
begin
 Result := false;
 if HookNew(aClass) then
  Result := true;
 if HookFree(aClass) then
  Result := true;
end;

procedure HookClass(aClass: TClass);
var
 l_Class : TClass;
begin
 l_Class := aClass;
 while (l_Class <> nil) do
 begin
  if not HookClassPrim(l_Class) then
   Exit;
  l_Class := l_Class.ClassParent;
 end;//l_Class <> nil
end;

procedure DoHookClasses;
begin
 HookClass(TObject);
 HookClass(TStream);
 HookClass(TInterfacedObject);
 HookClass(TThread);
 HookClass(TComponent);
 //HookClass(TExternalThread);
end;

procedure Test;
var
 l_O : TObject;
 l_S : TStream;
 l_IO : TInterfacedObject;
 l_T : TThread;
begin
 //HookClasses;
 l_O := TObject.Create;
 FreeAndNil(l_O);

 l_S := TStream.Create;
 FreeAndNil(l_S);

 l_IO := TInterfacedObject.Create;
 FreeAndNil(l_IO);

 l_T := TThread.Create;
 FreeAndNil(l_T);
end;

initialization
 Tl3ObjectsSpy.HookClasses;
finalization
 Tl3ObjectsSpy.CheckUnfreed;
end.


