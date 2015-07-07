unit kwClipboardClear;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwClipboardClear.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::clipboard_clear
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
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
 TkwClipboardClear = {final} class(_tfwSysUtilsWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwClipboardClear
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwClipboardClear;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

// start class TkwClipboardClear

procedure TkwClipboardClear.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FEB00F60245_var*
//#UC END# *4DAEEDE10285_4FEB00F60245_var*
begin
//#UC START# *4DAEEDE10285_4FEB00F60245_impl*
 l3System.ClearClipboard;
//#UC END# *4DAEEDE10285_4FEB00F60245_impl*
end;//TkwClipboardClear.DoDoIt

class function TkwClipboardClear.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'clipboard:clear';
end;//TkwClipboardClear.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.