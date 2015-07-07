unit kwSetForegroundWindow;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Костицын М.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSetForegroundWindow.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::SetForegroundWindow
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Windows,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
 TkwSetForegroundWindow = class(_kwHandleWord_)
 protected
 // realized methods
   procedure DoWithHandle(aHandle: THandle;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSetForegroundWindow
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSetForegroundWindow;

{$Include ..\ScriptEngine\kwHandleWord.imp.pas}

// start class TkwSetForegroundWindow

procedure TkwSetForegroundWindow.DoWithHandle(aHandle: THandle;
  const aCtx: TtfwContext);
//#UC START# *510AA0900333_4F14450003A3_var*
//#UC END# *510AA0900333_4F14450003A3_var*
begin
//#UC START# *510AA0900333_4F14450003A3_impl*
 SetForegroundWindow(aHandle);
//#UC END# *510AA0900333_4F14450003A3_impl*
end;//TkwSetForegroundWindow.DoWithHandle

class function TkwSetForegroundWindow.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:SetForeground';
end;//TkwSetForegroundWindow.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
{$IfEnd} //not NoScripts

end.