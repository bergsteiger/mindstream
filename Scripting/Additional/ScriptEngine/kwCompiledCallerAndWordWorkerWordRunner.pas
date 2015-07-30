unit kwCompiledCallerAndWordWorkerWordRunner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledCallerAndWordWorkerWordRunner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledCallerAndWordWorkerWordRunner
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledImmediateCallerAndWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledCallerAndWordWorkerWordRunner = class(TkwCompiledImmediateCallerAndWordWorkerWordRunner)
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
   function IsRunner: Boolean; override;
 end;//TkwCompiledCallerAndWordWorkerWordRunner
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledCallerAndWordWorkerWordRunner

function TkwCompiledCallerAndWordWorkerWordRunner.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4F413B5D031D_var*
//#UC END# *4DB6D7F70155_4F413B5D031D_var*
begin
//#UC START# *4DB6D7F70155_4F413B5D031D_impl*
 Result := false;
//#UC END# *4DB6D7F70155_4F413B5D031D_impl*
end;//TkwCompiledCallerAndWordWorkerWordRunner.IsImmediate

function TkwCompiledCallerAndWordWorkerWordRunner.IsRunner: Boolean;
//#UC START# *4F3FB2E202A2_4F413B5D031D_var*
//#UC END# *4F3FB2E202A2_4F413B5D031D_var*
begin
//#UC START# *4F3FB2E202A2_4F413B5D031D_impl*
 Result := false;
//#UC END# *4F3FB2E202A2_4F413B5D031D_impl*
end;//TkwCompiledCallerAndWordWorkerWordRunner.IsRunner

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledCallerAndWordWorkerWordRunner
 TkwCompiledCallerAndWordWorkerWordRunner.RegisterClass;
{$IfEnd} //not NoScripts

end.