unit l3ExecuteInMainThread;
 
{$Include l3Define.inc}

interface

uses
  Messages,
  Classes,
  SyncObjs,
  Windows,
  l3ProtoObject,
  l3AsyncTask,
  l3AsynkTaskList
  ;

type
 _l3CriticalSectionHolder_Parent_ = Tl3ProtoObject;
 {$Include l3CriticalSectionHolder.imp.pas}
 Tl3ExecuteInMainThread = class(_l3CriticalSectionHolder_)
  {* Перед использованием нужно вызывать init в главном потоке. }
 private
 // private fields
   f_Data : Tl3AsynkTaskList;
   f_Wnd : HWND;
   f_MsgID : THandle;
 private
 // private methods
   procedure WndProc(var Message: TMessage);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 public
 // public methods
   procedure Init;
     {* Сигнатура метода Init }
   procedure AsyncExec(aTask: Tl3AsyncTask);
   procedure SyncExec(aTask: Tl3AsyncTask);
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: Tl3ExecuteInMainThread;
    {- возвращает экземпляр синглетона. }
 end;//Tl3ExecuteInMainThread

implementation

uses
  l3Base {a},
  SysUtils,
  l3Utils
  ;


// start class Tl3ExecuteInMainThread

var g_Tl3ExecuteInMainThread : Tl3ExecuteInMainThread = nil;

procedure Tl3ExecuteInMainThreadFree;
begin
 l3Free(g_Tl3ExecuteInMainThread);
end;

class function Tl3ExecuteInMainThread.Instance: Tl3ExecuteInMainThread;
begin
 if (g_Tl3ExecuteInMainThread = nil) then
 begin
  l3System.AddExitProc(Tl3ExecuteInMainThreadFree);
  g_Tl3ExecuteInMainThread := Create;
 end;
 Result := g_Tl3ExecuteInMainThread;
end;


{$Include l3CriticalSectionHolder.imp.pas}

type
  Tl3SynTask = {final} class(Tl3AsyncTask)
  private
  // private fields
   f_Task : Tl3AsyncTask;
   f_Event : TEvent;
  protected
  // realized methods
   procedure Exec; override;
     {* Сигнатура метода Exec }
  protected
  // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
  public
  // public methods
   constructor Create(aTask: Tl3AsyncTask); reintroduce;
   procedure WaitForExec;
  end;//Tl3SynTask

// start class Tl3SynTask

constructor Tl3SynTask.Create(aTask: Tl3AsyncTask);
//#UC START# *549BDAC601E8_549BDA9C0160_var*
//#UC END# *549BDAC601E8_549BDA9C0160_var*
begin
//#UC START# *549BDAC601E8_549BDA9C0160_impl*
 inherited Create;
 aTask.SetRefTo(f_Task);
 f_Event := TEvent.Create(nil, True, False, l3CreateStringGUID);
//#UC END# *549BDAC601E8_549BDA9C0160_impl*
end;//Tl3SynTask.Create

procedure Tl3SynTask.WaitForExec;
//#UC START# *549BDB15036E_549BDA9C0160_var*
//#UC END# *549BDB15036E_549BDA9C0160_var*
begin
//#UC START# *549BDB15036E_549BDA9C0160_impl*
 f_Event.WaitFor(INFINITE);
//#UC END# *549BDB15036E_549BDA9C0160_impl*
end;//Tl3SynTask.WaitForExec

procedure Tl3SynTask.Exec;
//#UC START# *549BC64F01DE_549BDA9C0160_var*
//#UC END# *549BC64F01DE_549BDA9C0160_var*
begin
//#UC START# *549BC64F01DE_549BDA9C0160_impl*
 f_Task.Exec;
 f_Event.SetEvent;
//#UC END# *549BC64F01DE_549BDA9C0160_impl*
end;//Tl3SynTask.Exec

procedure Tl3SynTask.Cleanup;
//#UC START# *479731C50290_549BDA9C0160_var*
//#UC END# *479731C50290_549BDA9C0160_var*
begin
//#UC START# *479731C50290_549BDA9C0160_impl*
 FreeAndNil(f_Task);
 FreeAndNil(f_Event);
 inherited;
//#UC END# *479731C50290_549BDA9C0160_impl*
end;//Tl3SynTask.Cleanup

procedure Tl3ExecuteInMainThread.WndProc(var Message: TMessage);
//#UC START# *549BD08302D8_549BC58B0346_var*
var
 l_Task: Tl3AsyncTask;
 l_NeedResend: Boolean;
//#UC END# *549BD08302D8_549BC58B0346_var*
begin
//#UC START# *549BD08302D8_549BC58B0346_impl*
 with Message do
  if msg = f_MsgID then
  begin
   l_NeedResend := False;
   l_Task := nil;
   try
    Lock;
    try
     if f_Data.Count > 0 then
     begin
      f_Data[0].SetRefTo(l_Task);
      f_Data.Delete(0);
      l_NeedResend := f_Data.Count > 0;
     end
     else
      l_Task := nil;
    finally
     Unlock;
    end;
    if Assigned(l_Task) then
    begin
     l_Task.Exec;
     if l_NeedResend then
      PostMessage(f_Wnd, f_MsgID, 0, 0);
    end;
   finally
    FreeAndNil(l_Task);
   end;
  end
  else
   DefWindowProc(f_Wnd, msg, wParam, lParam);
//#UC END# *549BD08302D8_549BC58B0346_impl*
end;//Tl3ExecuteInMainThread.WndProc

procedure Tl3ExecuteInMainThread.Init;
//#UC START# *549BE5C2006F_549BC58B0346_var*
//#UC END# *549BE5C2006F_549BC58B0346_var*
begin
//#UC START# *549BE5C2006F_549BC58B0346_impl*
// Do nothing - simple to allocate HWND
//#UC END# *549BE5C2006F_549BC58B0346_impl*
end;//Tl3ExecuteInMainThread.Init

procedure Tl3ExecuteInMainThread.AsyncExec(aTask: Tl3AsyncTask);
//#UC START# *549BC5F800ED_549BC58B0346_var*
//#UC END# *549BC5F800ED_549BC58B0346_var*
begin
//#UC START# *549BC5F800ED_549BC58B0346_impl*
 if MainThreadID = GetCurrentThreadID then
  aTask.Exec
 else
 begin
  Lock;
  try
   f_Data.Add(aTask);
  finally
   Unlock;
  end;
  PostMessage(f_Wnd, f_MsgID, 0, 0);
 end;
//#UC END# *549BC5F800ED_549BC58B0346_impl*
end;//Tl3ExecuteInMainThread.AsyncExec

procedure Tl3ExecuteInMainThread.SyncExec(aTask: Tl3AsyncTask);
//#UC START# *549BC61B009B_549BC58B0346_var*
var
 l_Task: Tl3SynTask;
//#UC END# *549BC61B009B_549BC58B0346_var*
begin
//#UC START# *549BC61B009B_549BC58B0346_impl*
 if MainThreadID = GetCurrentThreadID then
  aTask.Exec
 else
 begin
  l_Task := Tl3SynTask.Create(aTask);
  try
   Lock;
   try
    f_Data.Add(l_Task);
   finally
    Unlock;
   end;
   PostMessage(f_Wnd, f_MsgID, 0, 0);
   l_Task.WaitForExec;
  finally
   FreeAndNil(l_Task);
  end;
 end;
//#UC END# *549BC61B009B_549BC58B0346_impl*
end;//Tl3ExecuteInMainThread.SyncExec

class function Tl3ExecuteInMainThread.Exists: Boolean;
 {-}
begin
 Result := g_Tl3ExecuteInMainThread <> nil;
end;//Tl3ExecuteInMainThread.Exists

procedure Tl3ExecuteInMainThread.Cleanup;
//#UC START# *479731C50290_549BC58B0346_var*
//#UC END# *479731C50290_549BC58B0346_var*
begin
//#UC START# *479731C50290_549BC58B0346_impl*
 DeallocateHWnd(f_Wnd);
 FreeAndNil(f_Data);
 inherited;
//#UC END# *479731C50290_549BC58B0346_impl*
end;//Tl3ExecuteInMainThread.Cleanup

procedure Tl3ExecuteInMainThread.InitFields;
//#UC START# *47A042E100E2_549BC58B0346_var*
//#UC END# *47A042E100E2_549BC58B0346_var*
begin
//#UC START# *47A042E100E2_549BC58B0346_impl*
 inherited;
 Assert(MainThreadID = GetCurrentThreadID, 'Перед использованием нужно вызывать init в главном потоке!');
 f_Data := Tl3AsynkTaskList.Make;
 f_Wnd := AllocateHWnd(WndProc);
 f_MsgID := RegisterWindowMessage(PChar(l3CreateStringGUID));
//#UC END# *47A042E100E2_549BC58B0346_impl*
end;//Tl3ExecuteInMainThread.InitFields

end.