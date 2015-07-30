unit kwCompiledImmediateWordWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledImmediateWordWorkerWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledImmediateWordWorkerWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
   function RunnerClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWordRunner; override;
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

function TkwCompiledImmediateWordWorkerWord.RunnerClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWordRunner;
//#UC START# *4F3FAC0C0170_4F3FAC650392_var*
//#UC END# *4F3FAC0C0170_4F3FAC650392_var*
begin
//#UC START# *4F3FAC0C0170_4F3FAC650392_impl*
 Result := TkwCompiledImmediateWordWorkerWordRunner;
//#UC END# *4F3FAC0C0170_4F3FAC650392_impl*
end;//TkwCompiledImmediateWordWorkerWord.RunnerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledImmediateWordWorkerWord
 TkwCompiledImmediateWordWorkerWord.RegisterInEngine;
{$IfEnd} //not NoScripts

end.