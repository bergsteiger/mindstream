unit kwMainScreenWidth;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMainScreenWidth.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::MainScreen_Width
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
 TkwMainScreenWidth = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMainScreenWidth
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

type _Instance_R_ = TkwMainScreenWidth;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwMainScreenWidth

procedure TkwMainScreenWidth.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AC85520002_var*
//#UC END# *4DAEEDE10285_51AC85520002_var*
begin
//#UC START# *4DAEEDE10285_51AC85520002_impl*
 aCtx.rEngine.PushInt(Forms.Screen.Monitors[0].Width);
//#UC END# *4DAEEDE10285_51AC85520002_impl*
end;//TkwMainScreenWidth.DoDoIt

class function TkwMainScreenWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'MainScreen:Width';
end;//TkwMainScreenWidth.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.