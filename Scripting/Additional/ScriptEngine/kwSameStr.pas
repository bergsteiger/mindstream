unit kwSameStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSameStr.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwSameStr
//
// Проверяет одинаковые ли строки с учетом регистра.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDualStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwSameStr = class(TtfwDualStrWord)
  {* Проверяет одинаковые ли строки с учетом регистра. }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSameStr
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

// start class TkwSameStr

procedure TkwSameStr.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4DD0CF1E00C8_var*
//#UC END# *4DD0D021034C_4DD0CF1E00C8_var*
begin
//#UC START# *4DD0D021034C_4DD0CF1E00C8_impl*
 aCtx.rEngine.PushBool(l3Same(aStr1, aStr2, false));
//#UC END# *4DD0D021034C_4DD0CF1E00C8_impl*
end;//TkwSameStr.DoStrings

class function TkwSameStr.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DD0CF1E00C8_var*
//#UC END# *4DB0614603C8_4DD0CF1E00C8_var*
begin
//#UC START# *4DB0614603C8_4DD0CF1E00C8_impl*
 Result := 'SameStr';
//#UC END# *4DB0614603C8_4DD0CF1E00C8_impl*
end;//TkwSameStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwSameStr
 TkwSameStr.RegisterInEngine;
{$IfEnd} //not NoScripts

end.