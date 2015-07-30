unit kwWStringEnds;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringEnds.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_Ends
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
 TkwWStringEnds = {final scriptword} class(TtfwDualWStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringEnds
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

// start class TkwWStringEnds

procedure TkwWStringEnds.DoStrings(const aCtx: TtfwContext;
  const aStr1: Tl3WString;
  const aStr2: Tl3WString);
//#UC START# *4F4FE58702AD_4F4FE40100AA_var*
//#UC END# *4F4FE58702AD_4F4FE40100AA_var*
begin
//#UC START# *4F4FE58702AD_4F4FE40100AA_impl*
 aCtx.rEngine.PushBool(l3Ends(aStr1, aStr2, false));
//#UC END# *4F4FE58702AD_4F4FE40100AA_impl*
end;//TkwWStringEnds.DoStrings

class function TkwWStringEnds.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:Ends';
end;//TkwWStringEnds.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_Ends
 TkwWStringEnds.RegisterInEngine;
{$IfEnd} //not NoScripts

end.