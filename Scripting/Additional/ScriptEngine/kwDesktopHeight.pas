unit kwDesktopHeight;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDesktopHeight.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::desktop_Height
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
 TkwDesktopHeight = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDesktopHeight
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

type _Instance_R_ = TkwDesktopHeight;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwDesktopHeight

procedure TkwDesktopHeight.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AC851D0358_var*
//#UC END# *4DAEEDE10285_51AC851D0358_var*
begin
//#UC START# *4DAEEDE10285_51AC851D0358_impl*
 aCtx.rEngine.PushInt(Forms.Screen.DesktopHeight);
//#UC END# *4DAEEDE10285_51AC851D0358_impl*
end;//TkwDesktopHeight.DoDoIt

class function TkwDesktopHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'desktop:Height';
end;//TkwDesktopHeight.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.