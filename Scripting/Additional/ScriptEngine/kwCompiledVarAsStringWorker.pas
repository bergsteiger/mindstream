unit kwCompiledVarAsStringWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledVarAsStringWorker.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwCompiledVarAsStringWorker
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledVarWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _kwCompiledVarAsStringWorkerUses_Parent_ = TkwCompiledVarWorker;
 {$Include ..\ScriptEngine\kwCompiledVarAsStringWorkerUses.imp.pas}
 TkwCompiledVarAsStringWorker = {abstract} class(_kwCompiledVarAsStringWorkerUses_)
 end;//TkwCompiledVarAsStringWorker
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Types,
  l3Interfaces,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwCompiledVarAsStringWorkerUses.imp.pas}


{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledVarAsStringWorker
 TkwCompiledVarAsStringWorker.RegisterClass;
{$IfEnd} //not NoScripts

end.