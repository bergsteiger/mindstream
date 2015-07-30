unit kwCompareText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwCompareText.pas"
// Начат: 16.05.2011 11:23
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwCompareText
//
// Сравнение строк без учета регистра.
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
 TkwCompareText = class(TtfwDualStrWord)
  {* Сравнение строк без учета регистра. }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCompareText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Types,
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompareText

procedure TkwCompareText.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4DD0D0DE0099_var*
//#UC END# *4DD0D021034C_4DD0D0DE0099_var*
begin
//#UC START# *4DD0D021034C_4DD0D0DE0099_impl*
 aCtx.rEngine.PushInt(l3Compare(l3PCharLen(aStr1), l3PCharLen(aStr2), l3_siCaseUnsensitive));
//#UC END# *4DD0D021034C_4DD0D0DE0099_impl*
end;//TkwCompareText.DoStrings

class function TkwCompareText.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DD0D0DE0099_var*
//#UC END# *4DB0614603C8_4DD0D0DE0099_var*
begin
//#UC START# *4DB0614603C8_4DD0D0DE0099_impl*
 Result := 'CompareText';
//#UC END# *4DB0614603C8_4DD0D0DE0099_impl*
end;//TkwCompareText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompareText
 TkwCompareText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.