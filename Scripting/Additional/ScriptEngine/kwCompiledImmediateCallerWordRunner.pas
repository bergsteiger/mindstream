unit kwCompiledImmediateCallerWordRunner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledImmediateCallerWordRunner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledImmediateCallerWordRunner
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledCallerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledImmediateCallerWordRunner = class(TkwCompiledCallerWordRunner)
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
   function IsRunner: Boolean; override;
 end;//TkwCompiledImmediateCallerWordRunner
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledImmediateCallerWordRunner

function TkwCompiledImmediateCallerWordRunner.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4F4200E70318_var*
//#UC END# *4DB6D7F70155_4F4200E70318_var*
begin
//#UC START# *4DB6D7F70155_4F4200E70318_impl*
 Result := true;
//#UC END# *4DB6D7F70155_4F4200E70318_impl*
end;//TkwCompiledImmediateCallerWordRunner.IsImmediate

function TkwCompiledImmediateCallerWordRunner.IsRunner: Boolean;
//#UC START# *4F3FB2E202A2_4F4200E70318_var*
//#UC END# *4F3FB2E202A2_4F4200E70318_var*
begin
//#UC START# *4F3FB2E202A2_4F4200E70318_impl*
 Result := true;
//#UC END# *4F3FB2E202A2_4F4200E70318_impl*
end;//TkwCompiledImmediateCallerWordRunner.IsRunner

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledImmediateCallerWordRunner
 TkwCompiledImmediateCallerWordRunner.RegisterClass;
{$IfEnd} //not NoScripts

end.