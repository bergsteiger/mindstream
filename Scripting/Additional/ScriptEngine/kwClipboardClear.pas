unit kwClipboardClear;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwClipboardClear.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::clipboard_clear
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwSysUtilsWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwClipboardClear = {final scriptword} class(TtfwSysUtilsWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwClipboardClear
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// Регистрация clipboard_clear
 TkwClipboardClear.RegisterInEngine;
{$IfEnd} //not NoScripts

end.