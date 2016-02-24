unit l3ListenersManager;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  Windows,
  l3ProtoObject,
  l3CBTListenersList,
  l3GetMessageListenersList,
  l3WndProcListenersList,
  l3WndProcRetListenersList,
  l3MouseListenersList,
  l3MouseWheelListenersList
  ;

type
 Tl3ListenersManager = class(Tl3ProtoObject)
 private
 // private fields
   f_WndProcListeners : Tl3WndProcListenersList;
    {* Поле для свойства WndProcListeners}
   f_CBTListeners : Tl3CBTListenersList;
    {* Поле для свойства CBTListeners}
   f_GetMessageListeners : Tl3GetMessageListenersList;
    {* Поле для свойства GetMessageListeners}
   f_WndProcHook : HHOOK;
    {* Поле для свойства WndProcHook}
   f_CBTHook : HHOOK;
    {* Поле для свойства CBTHook}
   f_GetMessageHook : HHOOK;
    {* Поле для свойства GetMessageHook}
   f_WndProcRetListeners : Tl3WndProcRetListenersList;
    {* Поле для свойства WndProcRetListeners}
   f_WndProcRetHook : HHOOK;
    {* Поле для свойства WndProcRetHook}
   f_MouseHook : HHOOK;
    {* Поле для свойства MouseHook}
   f_MouseListeners : Tl3MouseListenersList;
    {* Поле для свойства MouseListeners}
   f_MouseWheelListeners : Tl3MouseWheelListenersList;
    {* Поле для свойства MouseWheelListeners}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected methods
   procedure UpdateHooks;
 public
 // public methods
   class procedure AddCBTListener(const aListener: Il3CBTListener);
   class procedure AddWndProcListener(const aListener: Il3WndProcListener);
   class procedure AddGetMessageListener(const aListener: Il3GetMessageListener);
   class procedure RemoveCBTListener(const aListener: Il3CBTListener);
   class procedure RemoveWndProcListener(const aListener: Il3WndProcListener);
   class procedure RemoveGetMessageListener(const aListener: Il3GetMessageListener);
   class procedure AddWndProcRetListener(const aListener: Il3WndProcRetListener);
   class procedure RemoveWndProcRetListener(const aListener: Il3WndProcRetListener);
   class procedure AddMouseListener(const aListener: Il3MouseListener);
   class procedure RemoveMouseListener(const aListener: Il3MouseListener);
   class procedure AddMouseWheelListener(const aListener: Il3MouseWheelListener);
   class procedure RemoveMouseWheelListener(const aListener: Il3MouseWheelListener);
   class procedure Add(const aListener: Il3Listener);
   class procedure Remove(const aListener: Il3Listener);
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // public properties
   property WndProcListeners: Tl3WndProcListenersList
     read f_WndProcListeners;
   property CBTListeners: Tl3CBTListenersList
     read f_CBTListeners;
   property GetMessageListeners: Tl3GetMessageListenersList
     read f_GetMessageListeners;
   property WndProcHook: HHOOK
     read f_WndProcHook;
   property CBTHook: HHOOK
     read f_CBTHook;
   property GetMessageHook: HHOOK
     read f_GetMessageHook;
   property WndProcRetListeners: Tl3WndProcRetListenersList
     read f_WndProcRetListeners;
   property WndProcRetHook: HHOOK
     read f_WndProcRetHook;
   property MouseHook: HHOOK
     read f_MouseHook;
   property MouseListeners: Tl3MouseListenersList
     read f_MouseListeners;
   property MouseWheelListeners: Tl3MouseWheelListenersList
     read f_MouseWheelListeners;
 public
 // singleton factory method
   class function Instance: Tl3ListenersManager;
    {- возвращает экземпляр синглетона. }
 end;//Tl3ListenersManager

implementation

uses
  l3Base {a},
  SysUtils,
  l3ListenersHooks
  ;


// start class Tl3ListenersManager

var g_Tl3ListenersManager : Tl3ListenersManager = nil;

procedure Tl3ListenersManagerFree;
begin
 l3Free(g_Tl3ListenersManager);
end;

class function Tl3ListenersManager.Instance: Tl3ListenersManager;
begin
 if (g_Tl3ListenersManager = nil) then
 begin
  l3System.AddExitProc(Tl3ListenersManagerFree);
  g_Tl3ListenersManager := Create;
 end;
 Result := g_Tl3ListenersManager;
end;


class procedure Tl3ListenersManager.AddCBTListener(const aListener: Il3CBTListener);
//#UC START# *4F636B3003E5_4F636139008F_var*
//#UC END# *4F636B3003E5_4F636139008F_var*
begin
//#UC START# *4F636B3003E5_4F636139008F_impl*
 with Instance do
 begin
  if not Assigned(f_CBTListeners) then
   f_CBTListeners := Tl3CBTListenersList.Create;

  if f_CBTListeners.IndexOf(aListener) < 0 then
  begin
   f_CBTListeners.Add(aListener);
   UpdateHooks;
  end;
 end;
//#UC END# *4F636B3003E5_4F636139008F_impl*
end;//Tl3ListenersManager.AddCBTListener

class procedure Tl3ListenersManager.AddWndProcListener(const aListener: Il3WndProcListener);
//#UC START# *4F6370E0022B_4F636139008F_var*
//#UC END# *4F6370E0022B_4F636139008F_var*
begin
//#UC START# *4F6370E0022B_4F636139008F_impl*
 with Instance do
 begin
  if not Assigned(f_WndProcListeners) then
   f_WndProcListeners := Tl3WndProcListenersList.Create;

  if f_WndProcListeners.IndexOf(aListener) < 0 then
  begin
   f_WndProcListeners.Add(aListener);
   UpdateHooks;
  end;
 end;
//#UC END# *4F6370E0022B_4F636139008F_impl*
end;//Tl3ListenersManager.AddWndProcListener

class procedure Tl3ListenersManager.AddGetMessageListener(const aListener: Il3GetMessageListener);
//#UC START# *4F63711700CB_4F636139008F_var*
//#UC END# *4F63711700CB_4F636139008F_var*
begin
//#UC START# *4F63711700CB_4F636139008F_impl*
 with Instance do
 begin
  if not Assigned(f_GetMessageListeners) then
   f_GetMessageListeners := Tl3GetMessageListenersList.Create;

  if f_GetMessageListeners.IndexOf(aListener) < 0 then
  begin
   f_GetMessageListeners.Add(aListener);
   UpdateHooks;
  end;
 end;
//#UC END# *4F63711700CB_4F636139008F_impl*
end;//Tl3ListenersManager.AddGetMessageListener

class procedure Tl3ListenersManager.RemoveCBTListener(const aListener: Il3CBTListener);
//#UC START# *4F6372FC0118_4F636139008F_var*
//#UC END# *4F6372FC0118_4F636139008F_var*
begin
//#UC START# *4F6372FC0118_4F636139008F_impl*
 if not Assigned(g_Tl3ListenersManager) then
  Exit;

 if Assigned(g_Tl3ListenersManager.f_CBTListeners) then
 begin
  g_Tl3ListenersManager.f_CBTListeners.Remove(aListener);
  g_Tl3ListenersManager.UpdateHooks;
 end;
//#UC END# *4F6372FC0118_4F636139008F_impl*
end;//Tl3ListenersManager.RemoveCBTListener

class procedure Tl3ListenersManager.RemoveWndProcListener(const aListener: Il3WndProcListener);
//#UC START# *4F63733101FE_4F636139008F_var*
//#UC END# *4F63733101FE_4F636139008F_var*
begin
//#UC START# *4F63733101FE_4F636139008F_impl*
 if not Assigned(g_Tl3ListenersManager) then
  Exit;

 if Assigned(g_Tl3ListenersManager.f_WndProcListeners) then
 begin
  g_Tl3ListenersManager.f_WndProcListeners.Remove(aListener);
  g_Tl3ListenersManager.UpdateHooks;
 end;
//#UC END# *4F63733101FE_4F636139008F_impl*
end;//Tl3ListenersManager.RemoveWndProcListener

class procedure Tl3ListenersManager.RemoveGetMessageListener(const aListener: Il3GetMessageListener);
//#UC START# *4F6373800326_4F636139008F_var*
//#UC END# *4F6373800326_4F636139008F_var*
begin
//#UC START# *4F6373800326_4F636139008F_impl*
 if not Assigned(g_Tl3ListenersManager) then
  Exit;

 if Assigned(g_Tl3ListenersManager.f_GetMessageListeners) then
 begin
  g_Tl3ListenersManager.f_GetMessageListeners.Remove(aListener);
  g_Tl3ListenersManager.UpdateHooks;
 end;
//#UC END# *4F6373800326_4F636139008F_impl*
end;//Tl3ListenersManager.RemoveGetMessageListener

procedure Tl3ListenersManager.UpdateHooks;
//#UC START# *4F670A190240_4F636139008F_var*
 procedure DoCBT;
 begin
  if Assigned(f_CBTListeners) then
   if (f_CBTListeners.Count > 0) and (f_CBThook = 0) then
    f_CBTHook := SetWindowsHookEx(WH_CBT, @CBTHookFunc, 0, GetCurrentThreadId)
   else
   if (f_CBTListeners.Count = 0) and (f_CBThook <> 0) then
   begin
    UnhookWindowsHookEx(f_CBTHook);
    f_CBTHook := 0;
   end;
 end; //DoCBT;

 procedure DoGetMessage;
 begin
  if Assigned(f_GetMessageListeners) then
   if (f_GetMessageListeners.Count > 0) and (f_GetMessageHook = 0) then
    f_GetMessageHook := SetWindowsHookEx(WH_GETMESSAGE, @GetMessageHookFunc, 0, GetCurrentThreadId)
   else
   if (f_GetMessageListeners.Count = 0) and (f_GetMessageHook <> 0) then
   begin
    UnhookWindowsHookEx(f_GetMessageHook);
    f_GetMessageHook := 0;
   end;
 end; //DoGetMessage;

 procedure DoWndProc;
 begin
  if Assigned(f_WndProcListeners) or Assigned(f_MouseWheelListeners) then
   if ((Assigned(f_WndProcListeners) and (f_WndProcListeners.Count > 0)) or
       (Assigned(f_MouseWheelListeners) and (f_MouseWheelListeners.Count > 0))) and
      (f_WndProcHook = 0) then
    f_WndProcHook := SetWindowsHookEx(WH_CALLWNDPROC, @CallWndProcHookFunc, 0, GetCurrentThreadID)
   else
   if (not Assigned(f_WndProcListeners) or (f_WndProcListeners.Count = 0)) and
      (not Assigned(f_MouseWheelListeners) or (f_MouseWheelListeners.Count = 0)) and
      (f_WndProcHook <> 0) then
   begin
    UnhookWindowsHookEx(f_WndProcHook);
    f_WndProcHook := 0;
   end;
 end; //DoWndProc;

 procedure DoWndProcRet;
 begin
  if Assigned(f_WndProcRetListeners) then
   if (f_WndProcRetListeners.Count > 0) and (f_WndProcRetHook = 0) then
    f_WndProcRetHook := SetWindowsHookEx(WH_CALLWNDPROCRET, @CallWndProcRetHookFunc, 0, GetCurrentThreadID)
   else
   if (f_WndProcRetListeners.Count = 0) and (f_WndProcRetHook <> 0) then
   begin
    UnhookWindowsHookEx(f_WndProcRetHook);
    f_WndProcRetHook := 0;
   end;
 end; //DoWndProcRet;

 procedure DoMouse;
 begin
  if Assigned(f_MouseListeners) then
   if (f_MouseListeners.Count > 0) and (f_MouseHook = 0) then
    f_MouseHook := SetWindowsHookEx(WH_MOUSE, @MouseHookFunc, 0, GetCurrentThreadID)
   else
   if (f_MouseListeners.Count = 0) and (f_MouseHook <> 0) then
   begin
    UnhookWindowsHookEx(f_MouseHook);
    f_MouseHook := 0;
   end;
 end; //DoMouse;

//#UC END# *4F670A190240_4F636139008F_var*
begin
//#UC START# *4F670A190240_4F636139008F_impl*
 DoCBT;
 DoGetMessage;
 DoWndProc;
 DoWndProcRet;
 DoMouse;
//#UC END# *4F670A190240_4F636139008F_impl*
end;//Tl3ListenersManager.UpdateHooks

class procedure Tl3ListenersManager.AddWndProcRetListener(const aListener: Il3WndProcRetListener);
//#UC START# *4F7322B90325_4F636139008F_var*
//#UC END# *4F7322B90325_4F636139008F_var*
begin
//#UC START# *4F7322B90325_4F636139008F_impl*
 with Instance do
 begin
  if not Assigned(f_WndProcRetListeners) then
   f_WndProcRetListeners := Tl3WndProcRetListenersList.Create;

  if f_WndProcRetListeners.IndexOf(aListener) < 0 then
  begin
   f_WndProcRetListeners.Add(aListener);
   UpdateHooks;
  end;
 end;
//#UC END# *4F7322B90325_4F636139008F_impl*
end;//Tl3ListenersManager.AddWndProcRetListener

class procedure Tl3ListenersManager.RemoveWndProcRetListener(const aListener: Il3WndProcRetListener);
//#UC START# *4F7322EA002B_4F636139008F_var*
//#UC END# *4F7322EA002B_4F636139008F_var*
begin
//#UC START# *4F7322EA002B_4F636139008F_impl*
 if not Assigned(g_Tl3ListenersManager) then
  Exit;

 if Assigned(g_Tl3ListenersManager.f_WndProcRetListeners) then
 begin
  g_Tl3ListenersManager.f_WndProcRetListeners.Remove(aListener);
  g_Tl3ListenersManager.UpdateHooks;
 end;
//#UC END# *4F7322EA002B_4F636139008F_impl*
end;//Tl3ListenersManager.RemoveWndProcRetListener

class procedure Tl3ListenersManager.AddMouseListener(const aListener: Il3MouseListener);
//#UC START# *4F74226B03A5_4F636139008F_var*
//#UC END# *4F74226B03A5_4F636139008F_var*
begin
//#UC START# *4F74226B03A5_4F636139008F_impl*
 with Instance do
 begin
  if not Assigned(f_MouseListeners) then
   f_MouseListeners := Tl3MouseListenersList.Create;

  if f_MouseListeners.IndexOf(aListener) < 0 then
  begin
   f_MouseListeners.Add(aListener);
   UpdateHooks;
  end;
 end;
//#UC END# *4F74226B03A5_4F636139008F_impl*
end;//Tl3ListenersManager.AddMouseListener

class procedure Tl3ListenersManager.RemoveMouseListener(const aListener: Il3MouseListener);
//#UC START# *4F74229F007B_4F636139008F_var*
//#UC END# *4F74229F007B_4F636139008F_var*
begin
//#UC START# *4F74229F007B_4F636139008F_impl*
 if not Assigned(g_Tl3ListenersManager) then
  Exit;

 if Assigned(g_Tl3ListenersManager.f_MouseListeners) then
 begin
  g_Tl3ListenersManager.f_MouseListeners.Remove(aListener);
  g_Tl3ListenersManager.UpdateHooks;
 end;
//#UC END# *4F74229F007B_4F636139008F_impl*
end;//Tl3ListenersManager.RemoveMouseListener

class procedure Tl3ListenersManager.AddMouseWheelListener(const aListener: Il3MouseWheelListener);
//#UC START# *4F79BC3000BD_4F636139008F_var*
//#UC END# *4F79BC3000BD_4F636139008F_var*
begin
//#UC START# *4F79BC3000BD_4F636139008F_impl*
 with Instance do
 begin
  if not Assigned(f_MouseWheelListeners) then
   f_MouseWheelListeners := Tl3MouseWheelListenersList.Create;

  if f_MouseWheelListeners.IndexOf(aListener) < 0 then
  begin
   f_MouseWheelListeners.Add(aListener);
   UpdateHooks;
  end;
 end;
//#UC END# *4F79BC3000BD_4F636139008F_impl*
end;//Tl3ListenersManager.AddMouseWheelListener

class procedure Tl3ListenersManager.RemoveMouseWheelListener(const aListener: Il3MouseWheelListener);
//#UC START# *4F79BC860012_4F636139008F_var*
//#UC END# *4F79BC860012_4F636139008F_var*
begin
//#UC START# *4F79BC860012_4F636139008F_impl*
 if not Assigned(g_Tl3ListenersManager) then
  Exit;

 if Assigned(g_Tl3ListenersManager.f_MouseWheelListeners) then
 begin
  g_Tl3ListenersManager.f_MouseWheelListeners.Remove(aListener);
  g_Tl3ListenersManager.UpdateHooks;
 end;
//#UC END# *4F79BC860012_4F636139008F_impl*
end;//Tl3ListenersManager.RemoveMouseWheelListener

class procedure Tl3ListenersManager.Add(const aListener: Il3Listener);
//#UC START# *4F79BCB203AE_4F636139008F_var*
var
 l_CBTListener: Il3CBTListener;
 l_WndProcListener: Il3WndProcListener;
 l_GetMessageListener: Il3GetMessageListener;
 l_WndProcRetListener: Il3WndProcRetListener;
 l_MouseListener: Il3MouseListener;
 l_MouseWheelListener: Il3MouseWheelListener;
//#UC END# *4F79BCB203AE_4F636139008F_var*
begin
//#UC START# *4F79BCB203AE_4F636139008F_impl*
 if Supports(aListener, Il3CBTListener, l_CBTListener) then
  AddCBTListener(l_CBTListener);
 if Supports(aListener, Il3WndProcListener, l_WndProcListener) then
  AddWndProcListener(l_WndProcListener);
 if Supports(aListener, Il3GetMessageListener, l_GetMessageListener) then
  AddGetMessageListener(l_GetMessageListener);
 if Supports(aListener, Il3WndProcRetListener, l_WndProcRetListener) then
  AddWndProcRetListener(l_WndProcRetListener);
 if Supports(aListener, Il3MouseListener, l_MouseListener) then
  AddMouseListener(l_MouseListener);
 if Supports(aListener, Il3MouseWheelListener, l_MouseWheelListener) then
  AddMouseWheelListener(l_MouseWheelListener);
//#UC END# *4F79BCB203AE_4F636139008F_impl*
end;//Tl3ListenersManager.Add

class procedure Tl3ListenersManager.Remove(const aListener: Il3Listener);
//#UC START# *4F79BD74036A_4F636139008F_var*
var
 l_CBTListener: Il3CBTListener;
 l_WndProcListener: Il3WndProcListener;
 l_GetMessageListener: Il3GetMessageListener;
 l_WndProcRetListener: Il3WndProcRetListener;
 l_MouseListener: Il3MouseListener;
 l_MouseWheelListener: Il3MouseWheelListener;
//#UC END# *4F79BD74036A_4F636139008F_var*
begin
//#UC START# *4F79BD74036A_4F636139008F_impl*
 if Supports(aListener, Il3CBTListener, l_CBTListener) then
  RemoveCBTListener(l_CBTListener);
 if Supports(aListener, Il3WndProcListener, l_WndProcListener) then
  RemoveWndProcListener(l_WndProcListener);
 if Supports(aListener, Il3GetMessageListener, l_GetMessageListener) then
  RemoveGetMessageListener(l_GetMessageListener);
 if Supports(aListener, Il3WndProcRetListener, l_WndProcRetListener) then
  RemoveWndProcRetListener(l_WndProcRetListener);
 if Supports(aListener, Il3MouseListener, l_MouseListener) then
  RemoveMouseListener(l_MouseListener);
 if Supports(aListener, Il3MouseWheelListener, l_MouseWheelListener) then
  RemoveMouseWheelListener(l_MouseWheelListener);
//#UC END# *4F79BD74036A_4F636139008F_impl*
end;//Tl3ListenersManager.Remove

class function Tl3ListenersManager.Exists: Boolean;
 {-}
begin
 Result := g_Tl3ListenersManager <> nil;
end;//Tl3ListenersManager.Exists

procedure Tl3ListenersManager.Cleanup;
//#UC START# *479731C50290_4F636139008F_var*
//#UC END# *479731C50290_4F636139008F_var*
begin
//#UC START# *479731C50290_4F636139008F_impl*
 if Assigned(f_WndProcListeners) then
  f_WndProcListeners.Clear;
 if Assigned(f_WndProcRetListeners) then
  f_WndProcRetListeners.Clear;
 if Assigned(f_CBTListeners) then
  f_CBTListeners.Clear;
 if Assigned(f_GetMessageListeners) then
  f_GetMessageListeners.Clear;
 if Assigned(f_MouseListeners) then
  f_MouseListeners.Clear;
 if Assigned(f_MouseWheelListeners) then
  f_MouseWheelListeners.Clear;
 UpdateHooks;
 FreeAndNil(f_WndProcListeners);
 FreeAndNil(f_WndProcRetListeners);
 FreeAndNil(f_CBTListeners);
 FreeAndNil(f_GetMessageListeners);
 FreeAndNil(f_MouseListeners);
 FreeAndNil(f_MouseWheelListeners);
 f_WndProcHook := 0;
 f_WndProcRetHook := 0;
 f_CBTHook := 0;
 f_GetMessageHook := 0;
 f_MouseHook := 0;
 inherited;
//#UC END# *479731C50290_4F636139008F_impl*
end;//Tl3ListenersManager.Cleanup

end.