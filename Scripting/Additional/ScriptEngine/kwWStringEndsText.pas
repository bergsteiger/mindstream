unit kwWStringEndsText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringEndsText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_EndsText
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDualWStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwWStringEndsText = {final scriptword} class(TtfwDualWStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringEndsText
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

// start class TkwWStringEndsText

procedure TkwWStringEndsText.DoStrings(const aCtx: TtfwContext;
  const aStr1: Tl3WString;
  const aStr2: Tl3WString);
//#UC START# *4F4FE58702AD_4F4FE4930393_var*
//#UC END# *4F4FE58702AD_4F4FE4930393_var*
begin
//#UC START# *4F4FE58702AD_4F4FE4930393_impl*
 aCtx.rEngine.PushBool(l3Ends(aStr1, aStr2, true));
//#UC END# *4F4FE58702AD_4F4FE4930393_impl*
end;//TkwWStringEndsText.DoStrings

class function TkwWStringEndsText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:EndsText';
end;//TkwWStringEndsText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_EndsText
 TkwWStringEndsText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.