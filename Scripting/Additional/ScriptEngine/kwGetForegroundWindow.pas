unit kwGetForegroundWindow;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGetForegroundWindow.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::GetForegroundWindow
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwGetForegroundWindow = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGetForegroundWindow
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwGetForegroundWindow;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwGetForegroundWindow

procedure TkwGetForegroundWindow.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F9AC9C4017A_var*
//#UC END# *4DAEEDE10285_4F9AC9C4017A_var*
begin
//#UC START# *4DAEEDE10285_4F9AC9C4017A_impl*
 aCtx.rEngine.PushInt(Windows.GetForegroundWindow);
//#UC END# *4DAEEDE10285_4F9AC9C4017A_impl*
end;//TkwGetForegroundWindow.DoDoIt

class function TkwGetForegroundWindow.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GetForegroundWindow';
end;//TkwGetForegroundWindow.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.