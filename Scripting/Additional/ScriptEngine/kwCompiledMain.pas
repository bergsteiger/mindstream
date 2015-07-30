unit kwCompiledMain;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwCompiledMain.pas"
// Начат: 12.02.2012 18:25
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledMain
//
// Скомпилированный основной код скрипта
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledMain = class(TkwCompiledWord)
  {* Скомпилированный основной код скрипта }
 end;//TkwCompiledMain
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DA54270302*
 TkwCompiledMain.RegisterClass;
//#UC END# *53DA54270302*
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwCompiledMain
 TkwCompiledMain.RegisterClass;
{$IfEnd} //not NoScripts

end.