unit kwWStringStartsText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringStartsText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_StartsText
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
 TkwWStringStartsText = {final scriptword} class(TtfwDualWStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringStartsText
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

// start class TkwWStringStartsText

procedure TkwWStringStartsText.DoStrings(const aCtx: TtfwContext;
  const aStr1: Tl3WString;
  const aStr2: Tl3WString);
//#UC START# *4F4FE58702AD_4F4FE41702EC_var*
//#UC END# *4F4FE58702AD_4F4FE41702EC_var*
begin
//#UC START# *4F4FE58702AD_4F4FE41702EC_impl*
 aCtx.rEngine.PushBool(l3Starts(aStr1, aStr2, true));
//#UC END# *4F4FE58702AD_4F4FE41702EC_impl*
end;//TkwWStringStartsText.DoStrings

class function TkwWStringStartsText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:StartsText';
end;//TkwWStringStartsText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_StartsText
 TkwWStringStartsText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.