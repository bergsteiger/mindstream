unit kwStringCodePage;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStringCodePage.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::string_CodePage
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStringCodePage = {final scriptword} class(TtfwStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringCodePage
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStringCodePage

procedure TkwStringCodePage.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4F4FDA9E0345_var*
//#UC END# *4DD0CF6F0197_4F4FDA9E0345_var*
begin
//#UC START# *4DD0CF6F0197_4F4FDA9E0345_impl*
 aCtx.rEngine.PushInt(aStr.AsWStr.SCodePage);
//#UC END# *4DD0CF6F0197_4F4FDA9E0345_impl*
end;//TkwStringCodePage.DoString

class function TkwStringCodePage.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:CodePage';
end;//TkwStringCodePage.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация string_CodePage
 TkwStringCodePage.RegisterInEngine;
{$IfEnd} //not NoScripts

end.