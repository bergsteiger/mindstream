unit kwCompiledImmediateCallerWordWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledImmediateCallerWordWorkerWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledImmediateCallerWordWorkerWord
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
  kwCompiledImmediateWordWorkerWord,
  tfwScriptingInterfaces,
  kwCompiledWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledImmediateCallerWordWorkerWord = class(TkwCompiledImmediateWordWorkerWord)
 protected
 // overridden protected methods
   procedure FillCompiledWorker(aWorker: TtfwWord;
     const aContext: TtfwContext); override;
   function RunnerClass: RkwCompiledWordWorkerWordRunner; override;
 end;//TkwCompiledImmediateCallerWordWorkerWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledImmediateCallerAndWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledImmediateCallerWordWorkerWord

procedure TkwCompiledImmediateCallerWordWorkerWord.FillCompiledWorker(aWorker: TtfwWord;
  const aContext: TtfwContext);
//#UC START# *4F219FA10268_4F3FF5A903DE_var*
//#UC END# *4F219FA10268_4F3FF5A903DE_var*
begin
//#UC START# *4F219FA10268_4F3FF5A903DE_impl*
 inherited;
 (aWorker As TkwCompiledImmediateCallerAndWordWorkerWordRunner).Caller := aContext.rCompiler.GetWordCompilingNow.GetAsCaller(aContext);
                                                                          // м.б. тут надо aContext.rWordDefiningNow
                                                                          // см. TkwCompilingWordSelf.DoDoIt
                                                                          // см. ещё Assert выше
//#UC END# *4F219FA10268_4F3FF5A903DE_impl*
end;//TkwCompiledImmediateCallerWordWorkerWord.FillCompiledWorker

function TkwCompiledImmediateCallerWordWorkerWord.RunnerClass: RkwCompiledWordWorkerWordRunner;
//#UC START# *4F3FAC0C0170_4F3FF5A903DE_var*
//#UC END# *4F3FAC0C0170_4F3FF5A903DE_var*
begin
//#UC START# *4F3FAC0C0170_4F3FF5A903DE_impl*
 Result := TkwCompiledImmediateCallerAndWordWorkerWordRunner;
//#UC END# *4F3FAC0C0170_4F3FF5A903DE_impl*
end;//TkwCompiledImmediateCallerWordWorkerWord.RunnerClass

{$IfEnd} //not NoScripts

end.