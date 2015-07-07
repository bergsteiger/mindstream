unit kwWStringConsistsOf;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWStringConsistsOf.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::WString_ConsistsOf
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
 {$Include ..\ScriptEngine\tfwDualWStrWord.imp.pas}
 TkwWStringConsistsOf = {final} class(_tfwDualWStrWord_)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringConsistsOf
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

type _Instance_R_ = TkwWStringConsistsOf;

{$Include ..\ScriptEngine\tfwDualWStrWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwDualWStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.