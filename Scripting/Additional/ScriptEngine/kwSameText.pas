unit kwSameText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwSameText.pas"
// Начат: 16.05.2011 11:21
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwSameText
//
// Проверяет одинаковые ли строки без учета регистра.
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
 TkwSameText = class(TtfwDualStrWord)
  {* Проверяет одинаковые ли строки без учета регистра. }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSameText
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

// start class TkwSameText

procedure TkwSameText.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4DD0D06C0151_var*
//#UC END# *4DD0D021034C_4DD0D06C0151_var*
begin
//#UC START# *4DD0D021034C_4DD0D06C0151_impl*
 aCtx.rEngine.PushBool(l3Same(aStr1, aStr2, true));
//#UC END# *4DD0D021034C_4DD0D06C0151_impl*
end;//TkwSameText.DoStrings

class function TkwSameText.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DD0D06C0151_var*
//#UC END# *4DB0614603C8_4DD0D06C0151_var*
begin
//#UC START# *4DB0614603C8_4DD0D06C0151_impl*
 Result := 'SameText';
//#UC END# *4DB0614603C8_4DD0D06C0151_impl*
end;//TkwSameText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwSameText
 TkwSameText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.