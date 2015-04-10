unit kwCompiledCallerWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledCallerWorkerWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledCallerWorkerWord
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
  kwCompiledCallerAndWordWorkerWord,
  tfwScriptingInterfaces,
  kwCompiledWordPrim,
  kwCompiledWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledCallerWorkerWord = class(TkwCompiledCallerAndWordWorkerWord)
 protected
 // overridden protected methods
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function RunnerClass: RkwCompiledWordWorkerWordRunner; override;
   procedure CompileWordWorker(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
 end;//TkwCompiledCallerWorkerWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledCallerWordRunner,
  kwCompiledWordWorker,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledCallerWorkerWord

procedure TkwCompiledCallerWorkerWord.AfterCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4F4148350282_var*
//#UC END# *4DB6CE2302C9_4F4148350282_var*
begin
//#UC START# *4DB6CE2302C9_4F4148350282_impl*
 inherited;
//#UC END# *4DB6CE2302C9_4F4148350282_impl*
end;//TkwCompiledCallerWorkerWord.AfterCompile

function TkwCompiledCallerWorkerWord.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4F4148350282_var*
//#UC END# *4DB9B446039A_4F4148350282_var*
begin
//#UC START# *4DB9B446039A_4F4148350282_impl*
 Result := inherited AfterWordMaxCount(aCtx);
//#UC END# *4DB9B446039A_4F4148350282_impl*
end;//TkwCompiledCallerWorkerWord.AfterWordMaxCount

function TkwCompiledCallerWorkerWord.RunnerClass: RkwCompiledWordWorkerWordRunner;
//#UC START# *4F3FAC0C0170_4F4148350282_var*
//#UC END# *4F3FAC0C0170_4F4148350282_var*
begin
//#UC START# *4F3FAC0C0170_4F4148350282_impl*
 Result := TkwCompiledCallerWordRunner;
//#UC END# *4F3FAC0C0170_4F4148350282_impl*
end;//TkwCompiledCallerWorkerWord.RunnerClass

procedure TkwCompiledCallerWorkerWord.CompileWordWorker(const aContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4F41566A02E5_4F4148350282_var*
var
 l_CPW : TkwCompiledWordWorker;
//#UC END# *4F41566A02E5_4F4148350282_var*
begin
//#UC START# *4F41566A02E5_4F4148350282_impl*
(* CompilerAssert(not aCompiled.HasCode,
                'После слова недопустимы параметры',
                aContext);
 l_CPW := CompiledWorkerClass.Create(nil{aCompiled.Code[0]});
 try
  FillCompiledWorker(l_CPW, aContext);
  DoCompiledWord(l_CPW, aContext);
 finally
  FreeAndNil(l_CPW);
 end;//try..finally*)
 inherited;
//#UC END# *4F41566A02E5_4F4148350282_impl*
end;//TkwCompiledCallerWorkerWord.CompileWordWorker

{$IfEnd} //not NoScripts

end.