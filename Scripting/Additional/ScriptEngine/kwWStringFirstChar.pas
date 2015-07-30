unit kwWStringFirstChar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringFirstChar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_FirstChar
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
 TkwWStringFirstChar = {final scriptword} class(TtfwWStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringFirstChar
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

// start class TkwWStringFirstChar

procedure TkwWStringFirstChar.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F502FE20390_var*
//#UC END# *4F4FE51201BD_4F502FE20390_var*
begin
//#UC START# *4F4FE51201BD_4F502FE20390_impl*
 if l3IsNil(aStr) then
  aCtx.rEngine.PushChar(#0)
 else
  aCtx.rEngine.PushChar(aStr.S[0]);
//#UC END# *4F4FE51201BD_4F502FE20390_impl*
end;//TkwWStringFirstChar.DoString

class function TkwWStringFirstChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:[]';
end;//TkwWStringFirstChar.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_FirstChar
 TkwWStringFirstChar.RegisterInEngine;
{$IfEnd} //not NoScripts

end.