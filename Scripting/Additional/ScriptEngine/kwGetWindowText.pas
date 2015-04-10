unit kwGetWindowText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGetWindowText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::GetWindowText
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
 TkwGetWindowText = {final} class(_kwHandleWord_)
 protected
 // realized methods
   procedure DoWithHandle(aHandle: THandle;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGetWindowText
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

type _Instance_R_ = TkwGetWindowText;

{$Include ..\ScriptEngine\kwHandleWord.imp.pas}

// start class TkwGetWindowText

procedure TkwGetWindowText.DoWithHandle(aHandle: THandle;
  const aCtx: TtfwContext);
//#UC START# *510AA0900333_510A92D30025_var*
var
 l_Buffer: array[Byte] of Char;
//#UC END# *510AA0900333_510A92D30025_var*
begin
//#UC START# *510AA0900333_510A92D30025_impl*
 GetWindowText(aHandle, l_Buffer, SizeOf(l_Buffer));
 aCtx.rEngine.PushString(l_Buffer);
//#UC END# *510AA0900333_510A92D30025_impl*
end;//TkwGetWindowText.DoWithHandle

class function TkwGetWindowText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wnd:GetWindowText';
end;//TkwGetWindowText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwHandleWord.imp.pas}
{$IfEnd} //not NoScripts

end.