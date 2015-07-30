unit kwWStringConsistsOf;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringConsistsOf.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_ConsistsOf
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
 TkwWStringConsistsOf = {final scriptword} class(TtfwDualWStrWord)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringConsistsOf
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Chars,
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWStringConsistsOf

procedure TkwWStringConsistsOf.DoStrings(const aCtx: TtfwContext;
  const aStr1: Tl3WString;
  const aStr2: Tl3WString);
//#UC START# *4F4FE58702AD_4F55D9870209_var*
var
 l_C : TChars;
 l_Index : Integer;
//#UC END# *4F4FE58702AD_4F55D9870209_var*
begin
//#UC START# *4F4FE58702AD_4F55D9870209_impl*
 if l3IsNil(aStr1) then
  aCtx.rEngine.PushBool(l3IsNil(aStr2))
  // - любая непустая не может состоять ТОЛЬКО из символов пустого множества 
 else
 if (aStr1.SLen = 1) then
  aCtx.rEngine.PushBool(l3AllCharsInCharSet(aStr2, [aStr1.S[0]]))
 else
 begin
  l_C := [];
  for l_Index := 0 to Pred(aStr1.SLen) do
   l_C := l_C + [aStr1.S[l_Index]];
  aCtx.rEngine.PushBool(l3AllCharsInCharSet(aStr2, l_C))
 end;//aStr1.SLen = 1
//#UC END# *4F4FE58702AD_4F55D9870209_impl*
end;//TkwWStringConsistsOf.DoStrings

class function TkwWStringConsistsOf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:ConsistsOf';
end;//TkwWStringConsistsOf.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_ConsistsOf
 TkwWStringConsistsOf.RegisterInEngine;
{$IfEnd} //not NoScripts

end.