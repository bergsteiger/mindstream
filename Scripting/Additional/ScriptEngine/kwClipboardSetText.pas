unit kwClipboardSetText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwClipboardSetText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::clipboard_SetText
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
 TkwClipboardSetText = {final} class(_tfwSysUtilsWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwClipboardSetText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Clipbrd,
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwClipboardSetText;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

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
  RunnerAssert(False, 'clipboard:SetText умеет работать только с числами и строками :(', aCtx);
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
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.