unit kwCompiledCallerAndWordWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledCallerAndWordWorkerWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledCallerAndWordWorkerWord
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
  kwCompiledImmediateCallerWordWorkerWord,
  kwCompiledWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledCallerAndWordWorkerWord = class(TkwCompiledImmediateCallerWordWorkerWord)
 protected
 // overridden protected methods
   function RunnerClass: RkwCompiledWordWorkerWordRunner; override;
 end;//TkwCompiledCallerAndWordWorkerWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledCallerAndWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledCallerAndWordWorkerWord

function TkwCompiledCallerAndWordWorkerWord.RunnerClass: RkwCompiledWordWorkerWordRunner;
//#UC START# *4F3FAC0C0170_4F413A93030D_var*
//#UC END# *4F3FAC0C0170_4F413A93030D_var*
begin
//#UC START# *4F3FAC0C0170_4F413A93030D_impl*
 Result := TkwCompiledCallerAndWordWorkerWordRunner;
//#UC END# *4F3FAC0C0170_4F413A93030D_impl*
end;//TkwCompiledCallerAndWordWorkerWord.RunnerClass

{$IfEnd} //not NoScripts

end.