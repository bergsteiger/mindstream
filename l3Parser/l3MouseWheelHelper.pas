unit l3MouseWheelHelper;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3ProtoObject,
  Windows
  ;

type
 Tl3MouseWheelHelper = {final} class(Tl3ProtoObject, Il3MouseWheelListener)
 protected
 // realized methods
   procedure MouseWheelListenerNotify(Msg: PMsg;
     var theResult: Tl3HookProcResult);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: Tl3MouseWheelHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3MouseWheelHelper

implementation

uses
  l3Base {a},
  l3ListenersManager,
  Messages
  ;


// start class Tl3MouseWheelHelper

var g_Tl3MouseWheelHelper : Tl3MouseWheelHelper = nil;

procedure Tl3MouseWheelHelperFree;
begin
 l3Free(g_Tl3MouseWheelHelper);
end;

class function Tl3MouseWheelHelper.Instance: Tl3MouseWheelHelper;
begin
 if (g_Tl3MouseWheelHelper = nil) then
 begin
  l3System.AddExitProc(Tl3MouseWheelHelperFree);
  g_Tl3MouseWheelHelper := Create;
 end;
 Result := g_Tl3MouseWheelHelper;
end;


class function Tl3MouseWheelHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3MouseWheelHelper <> nil;
end;//Tl3MouseWheelHelper.Exists

procedure Tl3MouseWheelHelper.MouseWheelListenerNotify(Msg: PMsg;
  var theResult: Tl3HookProcResult);
//#UC START# *4F79D08A02C7_4F7ACCBE02AF_var*
var
 l_Pos: TPoint;
 l_Handle: HWND;
//#UC END# *4F79D08A02C7_4F7ACCBE02AF_var*
begin
//#UC START# *4F79D08A02C7_4F7ACCBE02AF_impl*
 GetCursorPos(l_Pos);
 l_Handle := WindowFromPoint(l_Pos);
 if l_Handle <> Msg.hwnd then
 begin
  PostMessage(l_Handle, Msg.Message, Msg.wParam, Msg.lParam);
  Msg.Message := 0;
  theResult.Result := 0;
  theResult.Handled := True; 
 end;
//#UC END# *4F79D08A02C7_4F7ACCBE02AF_impl*
end;//Tl3MouseWheelHelper.MouseWheelListenerNotify

procedure Tl3MouseWheelHelper.Cleanup;
//#UC START# *479731C50290_4F7ACCBE02AF_var*
//#UC END# *479731C50290_4F7ACCBE02AF_var*
begin
//#UC START# *479731C50290_4F7ACCBE02AF_impl*
 Tl3ListenersManager.RemoveMouseWheelListener(Self);
 inherited;
//#UC END# *479731C50290_4F7ACCBE02AF_impl*
end;//Tl3MouseWheelHelper.Cleanup

procedure Tl3MouseWheelHelper.InitFields;
//#UC START# *47A042E100E2_4F7ACCBE02AF_var*
//#UC END# *47A042E100E2_4F7ACCBE02AF_var*
begin
//#UC START# *47A042E100E2_4F7ACCBE02AF_impl*
 inherited;
 Tl3ListenersManager.AddMouseWheelListener(Self);
//#UC END# *47A042E100E2_4F7ACCBE02AF_impl*
end;//Tl3MouseWheelHelper.InitFields

initialization
//#UC START# *4F7ACD2301D6*
 Tl3MouseWheelHelper.Instance;
//#UC END# *4F7ACD2301D6*

end.