unit kwWStringStarts;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringStarts.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_Starts
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
 TkwWStringStarts = {final scriptword} class(TtfwDualWStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringStarts
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

// start class TkwWStringStarts

procedure TkwWStringStarts.DoStrings(const aCtx: TtfwContext;
  const aStr1: Tl3WString;
  const aStr2: Tl3WString);
//#UC START# *4F4FE58702AD_4F4FE3E701E5_var*
//#UC END# *4F4FE58702AD_4F4FE3E701E5_var*
begin
//#UC START# *4F4FE58702AD_4F4FE3E701E5_impl*
 aCtx.rEngine.PushBool(l3Starts(aStr1, aStr2, false));
//#UC END# *4F4FE58702AD_4F4FE3E701E5_impl*
end;//TkwWStringStarts.DoStrings

class function TkwWStringStarts.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:Starts';
end;//TkwWStringStarts.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_Starts
 TkwWStringStarts.RegisterInEngine;
{$IfEnd} //not NoScripts

end.