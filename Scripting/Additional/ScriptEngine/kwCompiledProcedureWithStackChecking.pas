unit kwCompiledProcedureWithStackChecking;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledProcedureWithStackChecking.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledProcedureWithStackChecking
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledProcedure,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _tfwStackChecking_Parent_ = TkwCompiledProcedure;
 {$Include ..\ScriptEngine\tfwStackChecking.imp.pas}
 TkwCompiledProcedureWithStackChecking = class(_tfwStackChecking_)
 end;//TkwCompiledProcedureWithStackChecking
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\tfwStackChecking.imp.pas}


{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledProcedureWithStackChecking
 TkwCompiledProcedureWithStackChecking.RegisterClass;
{$IfEnd} //not NoScripts

end.