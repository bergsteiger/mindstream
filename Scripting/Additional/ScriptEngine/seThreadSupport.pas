unit seThreadSupport;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "seThreadSupport.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: UtilityPack::Class Shared Delphi Low Level::ScriptEngine::CodeFlowSupport::seThreadSupport
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Classes,
  l3ProtoDataContainer,
  tfwScriptingInterfaces,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except
  ;

type
 TWordThread = class(TThread)
 private
 // private fields
   f_Context : TtfwContext;
   f_Word : TtfwWord;
 protected
 // realized methods
   procedure Execute; override;
 public
 // overridden public methods
   destructor Destroy; override;
 end;//TWordThread

 _ItemType_ = TWordThread;
 _l3ObjectPtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3ObjectPtrList.imp.pas}
 TseWorkThreadList = class(_l3ObjectPtrList_)
 public
 // public methods
   class function WasInit: Boolean;
   procedure WaitForAllThreads;
   procedure AddAndResumeThread(const aContext: TtfwContext;
     const aWord: TtfwWord);
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TseWorkThreadList;
    {- возвращает экземпляр синглетона. }
 end;//TseWorkThreadList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Base {a},
  l3MinMax,
  RTLConsts
  ;

// start class TWordThread

procedure TWordThread.Execute;
//#UC START# *4FFFDF740099_4FFFDE6C016C_var*
//#UC END# *4FFFDF740099_4FFFDE6C016C_var*
begin
//#UC START# *4FFFDF740099_4FFFDE6C016C_impl*
 f_Word.DoIt(f_Context);
//#UC END# *4FFFDF740099_4FFFDE6C016C_impl*
end;//TWordThread.Execute

destructor TWordThread.Destroy;
//#UC START# *48077504027E_4FFFDE6C016C_var*
//#UC END# *48077504027E_4FFFDE6C016C_var*
begin
//#UC START# *48077504027E_4FFFDE6C016C_impl*
 FreeAndNil(f_Word);
 Finalize(f_Context);
 inherited;
//#UC END# *48077504027E_4FFFDE6C016C_impl*
end;//TWordThread.Destroy

// start class TseWorkThreadList

var g_TseWorkThreadList : TseWorkThreadList = nil;

procedure TseWorkThreadListFree;
begin
 l3Free(g_TseWorkThreadList);
end;

class function TseWorkThreadList.Instance: TseWorkThreadList;
begin
 if (g_TseWorkThreadList = nil) then
 begin
  l3System.AddExitProc(TseWorkThreadListFree);
  g_TseWorkThreadList := Create;
 end;
 Result := g_TseWorkThreadList;
end;


type _Instance_R_ = TseWorkThreadList;

{$Include w:\common\components\rtl\Garant\L3\l3ObjectPtrList.imp.pas}

// start class TseWorkThreadList

class function TseWorkThreadList.WasInit: Boolean;
//#UC START# *50BF1BE6000C_50BF049002DB_var*
//#UC END# *50BF1BE6000C_50BF049002DB_var*
begin
//#UC START# *50BF1BE6000C_50BF049002DB_impl*
 Result := g_TseWorkThreadList <> nil;
//#UC END# *50BF1BE6000C_50BF049002DB_impl*
end;//TseWorkThreadList.WasInit

procedure TseWorkThreadList.WaitForAllThreads;
//#UC START# *50BF1C6D0267_50BF049002DB_var*
var
 l_Thread : TWordThread;
//#UC END# *50BF1C6D0267_50BF049002DB_var*
begin
//#UC START# *50BF1C6D0267_50BF049002DB_impl*
 while (Count > 0) do
 begin
  try
   l_Thread := Items[0];
   try
    l_Thread.WaitFor;
   except
   end;//try..except 
   l_Thread.Free;
   Delete(0);
  except
  end;//try..except
 end; // for i := 0 to Count - 1 do
//#UC END# *50BF1C6D0267_50BF049002DB_impl*
end;//TseWorkThreadList.WaitForAllThreads

procedure TseWorkThreadList.AddAndResumeThread(const aContext: TtfwContext;
  const aWord: TtfwWord);
//#UC START# *50BF1E9C001F_50BF049002DB_var*
var
 l_Thread: TWordThread;
//#UC END# *50BF1E9C001F_50BF049002DB_var*
begin
//#UC START# *50BF1E9C001F_50BF049002DB_impl*
 l_Thread := TWordThread.Create(True);
 aWord.SetRefTo(l_Thread.f_Word);
 l_Thread.f_Context := aContext;
 l_Thread.f_Context.rEngine := l_Thread.f_Context.rEngine.Clone;
 l_Thread.Resume;
 Add(l_Thread);
//#UC END# *50BF1E9C001F_50BF049002DB_impl*
end;//TseWorkThreadList.AddAndResumeThread

class function TseWorkThreadList.Exists: Boolean;
 {-}
begin
 Result := g_TseWorkThreadList <> nil;
end;//TseWorkThreadList.Exists
{$IfEnd} //not NoScripts

end.