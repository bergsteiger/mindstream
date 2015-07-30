unit kwCompiledVarWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwCompiledVarWorker.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwCompiledVarWorker
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwCompiledWordWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledVarWorker = class of TkwCompiledVarWorker;

 TkwCompiledVarWorker = {abstract} class(TkwCompiledWordWorker)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected fields
   f_WordToRun : TtfwWord;
 protected
 // protected methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); virtual;
 public
 // public methods
   constructor Create(aWordToPush: TtfwWord;
     aWordToRun: TtfwWord); reintroduce;
 end;//TkwCompiledVarWorker
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwVarWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledVarWorker

procedure TkwCompiledVarWorker.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4DCBCCE40219_var*
//#UC END# *4DCBCD2200D2_4DCBCCE40219_var*
begin
//#UC START# *4DCBCD2200D2_4DCBCCE40219_impl*
 aCtx.rEngine.PushObj(aVar);
 (f_WordToRun As TtfwVarWorker).DoRun(aCtx);
//#UC END# *4DCBCD2200D2_4DCBCCE40219_impl*
end;//TkwCompiledVarWorker.DoVar

constructor TkwCompiledVarWorker.Create(aWordToPush: TtfwWord;
  aWordToRun: TtfwWord);
//#UC START# *5512950C01BA_4DCBCCE40219_var*
//#UC END# *5512950C01BA_4DCBCCE40219_var*
begin
//#UC START# *5512950C01BA_4DCBCCE40219_impl*
 f_WordToRun := aWordToRun;
 inherited Create(aWordToPush, aWordToRun);
//#UC END# *5512950C01BA_4DCBCCE40219_impl*
end;//TkwCompiledVarWorker.Create

procedure TkwCompiledVarWorker.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DCBCCE40219_var*
//#UC END# *4DAEEDE10285_4DCBCCE40219_var*
begin
//#UC START# *4DAEEDE10285_4DCBCCE40219_impl*
 DoVar(aCtx, f_Word);
//#UC END# *4DAEEDE10285_4DCBCCE40219_impl*
end;//TkwCompiledVarWorker.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledVarWorker
 TkwCompiledVarWorker.RegisterClass;
{$IfEnd} //not NoScripts

end.