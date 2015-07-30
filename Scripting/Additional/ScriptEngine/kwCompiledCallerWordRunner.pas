unit kwCompiledCallerWordRunner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledCallerWordRunner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledCallerWordRunner
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledCallerAndWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledCallerWordRunner = class(TkwCompiledCallerAndWordWorkerWordRunner)
 end;//TkwCompiledCallerWordRunner
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}


{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledCallerWordRunner
 TkwCompiledCallerWordRunner.RegisterClass;
{$IfEnd} //not NoScripts

end.