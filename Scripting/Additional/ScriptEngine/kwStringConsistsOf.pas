unit kwStringConsistsOf;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStringConsistsOf.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::string_ConsistsOf
//
// Проверяет, что строка состоит ТОЛЬКО из символов другой строки
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
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
 TkwStringConsistsOf = {final} class(_tfwDualStrWord_)
  {* Проверяет, что строка состоит ТОЛЬКО из символов другой строки }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringConsistsOf
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Chars,
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwStringConsistsOf;

{$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}

// start class TkwStringConsistsOf

procedure TkwStringConsistsOf.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4F52160B0032_var*
var
 l_S1 : Tl3WString;
 l_S2 : Tl3WString;
 l_C : TChars;
 l_Index : Integer;
//#UC END# *4DD0D021034C_4F52160B0032_var*
begin
//#UC START# *4DD0D021034C_4F52160B0032_impl*
 l_S1 := l3PCharLen(aStr1);
 l_S2 := l3PCharLen(aStr2);
 if l3IsNil(l_S1) then
  aCtx.rEngine.PushBool(l3IsNil(l_S2))
  // - любая непустая не может состоять ТОЛЬКО из символов пустого множества 
 else
 if (l_S1.SLen = 1) then
  aCtx.rEngine.PushBool(l3AllCharsInCharSet(l_S2, [l_S1.S[0]]))
 else
 begin
  l_C := [];
  for l_Index := 0 to Pred(l_S1.SLen) do
   l_C := l_C + [l_S1.S[l_Index]];
  aCtx.rEngine.PushBool(l3AllCharsInCharSet(l_S2, l_C))
 end;//l_S1.SLen = 1
//#UC END# *4DD0D021034C_4F52160B0032_impl*
end;//TkwStringConsistsOf.DoStrings

class function TkwStringConsistsOf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:ConsistsOf';
end;//TkwStringConsistsOf.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.