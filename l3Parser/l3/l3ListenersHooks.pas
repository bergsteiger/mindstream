unit l3ListenersHooks;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  Windows
  ;

function CBTHookFunc(Code: Integer;
  WParam: WPARAM;
  LParam: LPARAM): LongInt; stdcall;
function CallWndProcHookFunc(Code: Integer;
  WParam: WPARAM;
  Msg: PCWPStruct): LongInt; stdcall;
function GetMessageHookFunc(Code: Integer;
  WParam: WPARAM;
  Msg: PMsg): LongInt; stdcall;
function CallWndProcRetHookFunc(Code: Integer;
  WParam: WPARAM;
  Msg: PCWPRetStruct): LongInt; stdcall;
function MouseHookFunc(Code: Integer;
  WParam: WPARAM;
  HookStruct: PMouseHookStruct): LongInt; stdcall;

implementation

uses
  l3ListenersManager,
  l3Base,
  l3Interfaces,
  Messages
  ;

// unit methods

function CBTHookFunc(Code: Integer;
  WParam: WPARAM;
  LParam: LPARAM): LongInt;
//#UC START# *4F6714B90103_4F67149B024A_var*
var
 l_Index: Integer;
 l_Result: Tl3HookProcResult;
//#UC END# *4F6714B90103_4F67149B024A_var*
begin
//#UC START# *4F6714B90103_4F67149B024A_impl*
 if Code < 0 then
 begin
  Result := CallNextHookEx(Tl3ListenersManager.Instance.CBTHook, Code, WParam, LParam);
  Exit;
 end;

 l_Result.Handled := False;
 l_Result.Result := 0;
 l_Index := 0;
 while l_Index < Tl3ListenersManager.Instance.CBTListeners.Count do // http://mdp.garant.ru/pages/viewpage.action?pageId=565488174
 begin
  Tl3ListenersManager.Instance.CBTListeners[l_Index].CBTListenerNotify(Code, WParam, LParam, l_Result);
  if l_Result.Handled then
  begin
   Result := l_Result.Result;
   Exit;
  end;
  Inc(l_Index);
 end; // while l_Index < Tl3ListenersManager.Instance.CBTListeners.Count - 1 do
 Result := CallNextHookEx(Tl3ListenersManager.Instance.CBTHook, Code, WParam, LParam);
//#UC END# *4F6714B90103_4F67149B024A_impl*
end;//CBTHookFunc

function CallWndProcHookFunc(Code: Integer;
  WParam: WPARAM;
  Msg: PCWPStruct): LongInt;
//#UC START# *4F67157402EF_4F67149B024A_var*
var
 l_Index : Integer;
 l_Result: Tl3HookProcResult;
//#UC END# *4F67157402EF_4F67149B024A_var*
begin
//#UC START# *4F67157402EF_4F67149B024A_impl*
 if Code < 0 then
 begin
  Result := CallNextHookEx(Tl3ListenersManager.Instance.WndProcHook, Code, WParam, Longint(Msg));
  Exit;
 end;

 if Code = HC_ACTION then
 begin
  l_Result.Handled := False;
  l_Result.Result := 0;
  l_Index := 0;
  while l_Index < Tl3ListenersManager.Instance.WndProcListeners.Count do
  begin
   Tl3ListenersManager.Instance.WndProcListeners[l_Index].WndProcListenerNotify(Msg, l_Result);
   if l_Result.Handled then
   begin
    Result := l_Result.Result;
    Exit; 
   end;
   Inc(l_Index);
  end; // while l_Index < Tl3ListenersManager.Instance.WndProcListeners.Count do
 end;//if Code = HC_ACTION then
 Result := CallNextHookEx(Tl3ListenersManager.Instance.WndProcHook, Code, WParam, Longint(Msg));
//#UC END# *4F67157402EF_4F67149B024A_impl*
end;//CallWndProcHookFunc

function GetMessageHookFunc(Code: Integer;
  WParam: WPARAM;
  Msg: PMsg): LongInt;
//#UC START# *4F6715D20141_4F67149B024A_var*
var
 l_Index: Integer;
 l_Result: Tl3HookProcResult;
//#UC END# *4F6715D20141_4F67149B024A_var*
begin
//#UC START# *4F6715D20141_4F67149B024A_impl*
 if Code < 0 then
 begin
  Result := CallNextHookEx(Tl3ListenersManager.Instance.GetMessageHook, Code, WParam, Longint(Msg));
  Exit;
 end;

 l_Result.Handled := False;
 l_Result.Result := 0;
 if (Msg.Message = WM_MOUSEWHEEL) and
    Assigned(Tl3ListenersManager.Instance.MouseWheelListeners) then
 begin
  l_Index := 0;
  while l_Index < Tl3ListenersManager.Instance.MouseWheelListeners.Count do
  begin
   Tl3ListenersManager.Instance.MouseWheelListeners[l_Index].MouseWheelListenerNotify(Msg, l_Result);
   if l_Result.Handled then
   begin
    Result := l_Result.Result;
    Exit;
   end;
   Inc(l_Index);
  end // while l_Index < Tl3ListenersManager.Instance.MouseWheelListeners.Count do
 end
 else
 begin
  l_Index := 0;
  while l_Index < Tl3ListenersManager.Instance.GetMessageListeners.Count do
  begin
   Tl3ListenersManager.Instance.GetMessageListeners[l_Index].GetMessageListenerNotify(Code, WParam, Msg, l_Result);
   if l_Result.Handled then
   begin
    Result := l_Result.Result;
    Exit;
   end;
   Inc(l_Index);
  end; // while l_Index < Tl3ListenersManager.Instance.GetMessageListeners.Count do
 end;
 Result := CallNextHookEx(Tl3ListenersManager.Instance.GetMessageHook, Code, WParam, Longint(Msg));
//#UC END# *4F6715D20141_4F67149B024A_impl*
end;//GetMessageHookFunc

function CallWndProcRetHookFunc(Code: Integer;
  WParam: WPARAM;
  Msg: PCWPRetStruct): LongInt;
//#UC START# *4F73208D0297_4F67149B024A_var*
var
 l_Index : Integer;
 l_Result: Tl3HookProcResult;
//#UC END# *4F73208D0297_4F67149B024A_var*
begin
//#UC START# *4F73208D0297_4F67149B024A_impl*
 if Code < 0 then
 begin
  Result := CallNextHookEx(Tl3ListenersManager.Instance.WndProcRetHook, Code, WParam, Longint(Msg));
  Exit;
 end;

 if Code = HC_ACTION then
 begin
  l_Result.Handled := False;
  l_Result.Result := 0;
  l_Index := 0;
  while l_Index < Tl3ListenersManager.Instance.WndProcRetListeners.Count do
  begin
   Tl3ListenersManager.Instance.WndProcRetListeners[l_Index].WndProcRetListenerNotify(Msg, l_Result);
   if l_Result.Handled then
   begin
    Result := l_Result.Result;
    Exit;
   end;
   Inc(l_Index);
  end; // while l_Index < Tl3ListenersManager.Instance.WndProcRetListeners.Count do
 end;//if Code = HC_ACTION then
 Result := CallNextHookEx(Tl3ListenersManager.Instance.WndProcRetHook, Code, WParam, Longint(Msg));
//#UC END# *4F73208D0297_4F67149B024A_impl*
end;//CallWndProcRetHookFunc

function MouseHookFunc(Code: Integer;
  WParam: WPARAM;
  HookStruct: PMouseHookStruct): LongInt;
//#UC START# *4F74214D035A_4F67149B024A_var*
var
 l_Index: Integer;
 l_Result: Tl3HookProcResult;
//#UC END# *4F74214D035A_4F67149B024A_var*
begin
//#UC START# *4F74214D035A_4F67149B024A_impl*
 if Code < 0 then
 begin
  Result := CallNextHookEx(Tl3ListenersManager.Instance.MouseHook, Code, WParam, Longint(HookStruct));
  Exit;
 end;

 l_Result.Handled := False;
 l_Result.Result := 0;
 l_Index := 0;
 while l_Index < Tl3ListenersManager.Instance.MouseListeners.Count do
 begin
  Tl3ListenersManager.Instance.MouseListeners[l_Index].MouseListenerNotify(WParam, HookStruct, l_Result);
  if l_Result.Handled then
  begin
   Result := l_Result.Result;
   Exit;
  end;
  Inc(l_Index);
 end; // while l_Index < Tl3ListenersManager.Instance.MouseListeners.Count do
 Result := CallNextHookEx(Tl3ListenersManager.Instance.MouseHook, Code, WParam, Longint(HookStruct));
//#UC END# *4F74214D035A_4F67149B024A_impl*
end;//MouseHookFunc

end.