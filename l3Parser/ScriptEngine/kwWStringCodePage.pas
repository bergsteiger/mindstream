unit kwWStringCodePage;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringCodePage.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_CodePage
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwWStringCodePage = {final scriptword} class(TtfwWStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringCodePage
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

// start class TkwWStringCodePage

procedure TkwWStringCodePage.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FE3970052_var*
//#UC END# *4F4FE51201BD_4F4FE3970052_var*
begin
//#UC START# *4F4FE51201BD_4F4FE3970052_impl*
 aCtx.rEngine.PushInt(aStr.SCodePage);
//#UC END# *4F4FE51201BD_4F4FE3970052_impl*
end;//TkwWStringCodePage.DoString

class function TkwWStringCodePage.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:CodePage';
end;//TkwWStringCodePage.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_CodePage
 TkwWStringCodePage.RegisterInEngine;
{$IfEnd} //not NoScripts

end.