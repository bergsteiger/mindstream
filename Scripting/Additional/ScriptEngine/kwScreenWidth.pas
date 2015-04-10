unit kwScreenWidth;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwScreenWidth.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::screen_Width
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
 TkwScreenWidth = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwScreenWidth
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Forms,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwScreenWidth;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwScreenWidth

procedure TkwScreenWidth.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AC852D00B7_var*
//#UC END# *4DAEEDE10285_51AC852D00B7_var*
begin
//#UC START# *4DAEEDE10285_51AC852D00B7_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не передан номер монитора.', aCtx);
 aCtx.rEngine.PushInt(Forms.Screen.Monitors[aCtx.rEngine.PopInt].Width);
//#UC END# *4DAEEDE10285_51AC852D00B7_impl*
end;//TkwScreenWidth.DoDoIt

class function TkwScreenWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'screen:Width';
end;//TkwScreenWidth.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.