unit kwCompiledImmediateWordWorkerWordRunner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledImmediateWordWorkerWordRunner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledImmediateWordWorkerWordRunner
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledImmediateWordWorkerWordRunner = class(TkwCompiledWordWorkerWordRunner)
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
   function IsRunner: Boolean; override;
 end;//TkwCompiledImmediateWordWorkerWordRunner
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledImmediateWordWorkerWordRunner

function TkwCompiledImmediateWordWorkerWordRunner.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4F3FACA1032B_var*
//#UC END# *4DB6D7F70155_4F3FACA1032B_var*
begin
//#UC START# *4DB6D7F70155_4F3FACA1032B_impl*
 Result := true;
//#UC END# *4DB6D7F70155_4F3FACA1032B_impl*
end;//TkwCompiledImmediateWordWorkerWordRunner.IsImmediate

function TkwCompiledImmediateWordWorkerWordRunner.IsRunner: Boolean;
//#UC START# *4F3FB2E202A2_4F3FACA1032B_var*
//#UC END# *4F3FB2E202A2_4F3FACA1032B_var*
begin
//#UC START# *4F3FB2E202A2_4F3FACA1032B_impl*
 Result := true;
//#UC END# *4F3FB2E202A2_4F3FACA1032B_impl*
end;//TkwCompiledImmediateWordWorkerWordRunner.IsRunner

{$IfEnd} //not NoScripts

end.