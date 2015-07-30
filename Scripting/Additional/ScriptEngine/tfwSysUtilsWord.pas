unit tfwSysUtilsWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwSysUtilsWord.pas"
// Начат: 16.05.2011 11:11
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::WordsTemplates::TtfwSysUtilsWord
//
// Поддержка слов из SysUtils
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _tfwSysUtilsWordUses_Parent_ = TtfwRegisterableWord;
 {$Include ..\ScriptEngine\tfwSysUtilsWordUses.imp.pas}
 TtfwSysUtilsWord = {abstract} class(_tfwSysUtilsWordUses_)
  {* Поддержка слов из SysUtils }
 end;//TtfwSysUtilsWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\tfwSysUtilsWordUses.imp.pas}


{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwSysUtilsWord
 TtfwSysUtilsWord.RegisterClass;
{$IfEnd} //not NoScripts

end.