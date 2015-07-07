unit kwCompiledImmediateCallerWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledImmediateCallerWorkerWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledImmediateCallerWorkerWord
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
  kwCompiledCallerWorkerWord,
  kwCompiledWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledImmediateCallerWorkerWord = class(TkwCompiledCallerWorkerWord)
 protected
 // overridden protected methods
   function RunnerClass: RkwCompiledWordWorkerWordRunner; override;
 end;//TkwCompiledImmediateCallerWorkerWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledImmediateCallerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledImmediateCallerWorkerWord

function TkwCompiledImmediateCallerWorkerWord.RunnerClass: RkwCompiledWordWorkerWordRunner;
//#UC START# *4F3FAC0C0170_4F4200A703AA_var*
//#UC END# *4F3FAC0C0170_4F4200A703AA_var*
begin
//#UC START# *4F3FAC0C0170_4F4200A703AA_impl*
 Result := TkwCompiledImmediateCallerWordRunner;
//#UC END# *4F3FAC0C0170_4F4200A703AA_impl*
end;//TkwCompiledImmediateCallerWorkerWord.RunnerClass

{$IfEnd} //not NoScripts

end.