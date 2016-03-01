unit kwWStringIsNil;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringIsNil.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_IsNil
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
 TkwWStringIsNil = {final scriptword} class(TtfwWStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringIsNil
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

// start class TkwWStringIsNil

procedure TkwWStringIsNil.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FEC2F02C9_var*
//#UC END# *4F4FE51201BD_4F4FEC2F02C9_var*
begin
//#UC START# *4F4FE51201BD_4F4FEC2F02C9_impl*
 aCtx.rEngine.PushBool(l3IsNil(aStr));
//#UC END# *4F4FE51201BD_4F4FEC2F02C9_impl*
end;//TkwWStringIsNil.DoString

class function TkwWStringIsNil.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:IsNil';
end;//TkwWStringIsNil.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_IsNil
 TkwWStringIsNil.RegisterInEngine;
{$IfEnd} //not NoScripts

end.