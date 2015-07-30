unit kwWStringChar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringChar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_Char
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
 TkwWStringChar = {final scriptword} class(TtfwWStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringChar
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

// start class TkwWStringChar

procedure TkwWStringChar.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FE36A020D_var*
//#UC END# *4F4FE51201BD_4F4FE36A020D_var*
begin
//#UC START# *4F4FE51201BD_4F4FE36A020D_impl*
 aCtx.rEngine.PushChar(aStr.S[aCtx.rEngine.PopInt]);
//#UC END# *4F4FE51201BD_4F4FE36A020D_impl*
end;//TkwWStringChar.DoString

class function TkwWStringChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:[i]';
end;//TkwWStringChar.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_Char
 TkwWStringChar.RegisterInEngine;
{$IfEnd} //not NoScripts

end.