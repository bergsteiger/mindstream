unit kwDesktopWidth;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDesktopWidth.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::desktop_Width
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
 TkwDesktopWidth = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDesktopWidth
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

type _Instance_R_ = TkwDesktopWidth;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwDesktopWidth

procedure TkwDesktopWidth.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AC84F80317_var*
//#UC END# *4DAEEDE10285_51AC84F80317_var*
begin
//#UC START# *4DAEEDE10285_51AC84F80317_impl*
 aCtx.rEngine.PushInt(Forms.Screen.DesktopWidth);
//#UC END# *4DAEEDE10285_51AC84F80317_impl*
end;//TkwDesktopWidth.DoDoIt

class function TkwDesktopWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'desktop:Width';
end;//TkwDesktopWidth.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.