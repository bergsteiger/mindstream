unit kwMainScreenHeight;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMainScreenHeight.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::MainScreen_Height
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
 TkwMainScreenHeight = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMainScreenHeight
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

type _Instance_R_ = TkwMainScreenHeight;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwMainScreenHeight

procedure TkwMainScreenHeight.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AC856A0031_var*
//#UC END# *4DAEEDE10285_51AC856A0031_var*
begin
//#UC START# *4DAEEDE10285_51AC856A0031_impl*
 aCtx.rEngine.PushInt(Forms.Screen.Monitors[0].Height);
//#UC END# *4DAEEDE10285_51AC856A0031_impl*
end;//TkwMainScreenHeight.DoDoIt

class function TkwMainScreenHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'MainScreen:Height';
end;//TkwMainScreenHeight.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.