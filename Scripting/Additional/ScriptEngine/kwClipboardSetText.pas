unit kwClipboardSetText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwClipboardSetText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::clipboard_SetText
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
 TkwClipboardSetText = {final scriptword} class(TtfwSysUtilsWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwClipboardSetText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Clipbrd,
  SysUtils,
  l3String,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwClipboardSetText

procedure TkwClipboardSetText.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_50405D0F003D_var*
var
 l_Int: Integer;
 l_Str: AnsiString;
//#UC END# *4DAEEDE10285_50405D0F003D_var*
begin
//#UC START# *4DAEEDE10285_50405D0F003D_impl*
 if aCtx.rEngine.IsTopInt then
 begin
  l_Int := aCtx.rEngine.PopInt;
  l_Str := IntToStr(l_Int);
 end else
 if aCtx.rEngine.IsTopString then
  l_Str := aCtx.rEngine.PopDelphiString
 else
  RunnerError('clipboard:SetText умеет работать только с числами и строками :(', aCtx);
 Clipboard.AsText := l_Str;
//#UC END# *4DAEEDE10285_50405D0F003D_impl*
end;//TkwClipboardSetText.DoDoIt

class function TkwClipboardSetText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'clipboard:SetText';
end;//TkwClipboardSetText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация clipboard_SetText
 TkwClipboardSetText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.