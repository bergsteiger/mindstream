unit kwCompiledImmediateWordWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledImmediateWordWorkerWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledImmediateWordWorkerWord
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
  kwCompiledWordWorkerWord,
  tfwScriptingInterfaces,
  kwCompiledWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledImmediateWordWorkerWord = class(TkwCompiledWordWorkerWord)
 protected
 // overridden protected methods
   function SupressNextImmediate: TtfwSuppressNextImmediate; override;
   function RunnerClass: RkwCompiledWordWorkerWordRunner; override;
 end;//TkwCompiledImmediateWordWorkerWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledImmediateWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledImmediateWordWorkerWord

function TkwCompiledImmediateWordWorkerWord.SupressNextImmediate: TtfwSuppressNextImmediate;
//#UC START# *4F3AB3B101FC_4F3FAC650392_var*
//#UC END# *4F3AB3B101FC_4F3FAC650392_var*
begin
//#UC START# *4F3AB3B101FC_4F3FAC650392_impl*
 Result := tfw_sniYes;
//#UC END# *4F3AB3B101FC_4F3FAC650392_impl*
end;//TkwCompiledImmediateWordWorkerWord.SupressNextImmediate

function TkwCompiledImmediateWordWorkerWord.RunnerClass: RkwCompiledWordWorkerWordRunner;
//#UC START# *4F3FAC0C0170_4F3FAC650392_var*
//#UC END# *4F3FAC0C0170_4F3FAC650392_var*
begin
//#UC START# *4F3FAC0C0170_4F3FAC650392_impl*
 Result := TkwCompiledImmediateWordWorkerWordRunner;
//#UC END# *4F3FAC0C0170_4F3FAC650392_impl*
end;//TkwCompiledImmediateWordWorkerWord.RunnerClass

{$IfEnd} //not NoScripts

end.