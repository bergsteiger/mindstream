unit kwCompiledImmediateCallerAndWordWorkerWordRunner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledImmediateCallerAndWordWorkerWordRunner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledImmediateCallerAndWordWorkerWordRunner
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
  tfwScriptingInterfaces,
  kwCompiledImmediateWordWorkerWordRunner
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledImmediateCallerAndWordWorkerWordRunner = class(TkwCompiledImmediateWordWorkerWordRunner)
 private
 // private fields
   f_Caller : TtfwWord;
    {* Поле для свойства Caller}
 protected
 // overridden protected methods
   procedure PushState(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure PushCaller(const aCtx: TtfwContext); virtual;
 public
 // public properties
   property Caller: TtfwWord
     read f_Caller
     write f_Caller;
 end;//TkwCompiledImmediateCallerAndWordWorkerWordRunner
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledImmediateCallerAndWordWorkerWordRunner

procedure TkwCompiledImmediateCallerAndWordWorkerWordRunner.PushCaller(const aCtx: TtfwContext);
//#UC START# *4F41435B027B_4F3FF64A00F3_var*
//#UC END# *4F41435B027B_4F3FF64A00F3_var*
begin
//#UC START# *4F41435B027B_4F3FF64A00F3_impl*
 aCtx.rEngine.Push(TtfwStackValue_C(Caller));
//#UC END# *4F41435B027B_4F3FF64A00F3_impl*
end;//TkwCompiledImmediateCallerAndWordWorkerWordRunner.PushCaller

procedure TkwCompiledImmediateCallerAndWordWorkerWordRunner.PushState(const aCtx: TtfwContext);
//#UC START# *4F3FF6C20122_4F3FF64A00F3_var*
//#UC END# *4F3FF6C20122_4F3FF64A00F3_var*
begin
//#UC START# *4F3FF6C20122_4F3FF64A00F3_impl*
 inherited;
 PushCaller(aCtx);
//#UC END# *4F3FF6C20122_4F3FF64A00F3_impl*
end;//TkwCompiledImmediateCallerAndWordWorkerWordRunner.PushState

{$IfEnd} //not NoScripts

end.