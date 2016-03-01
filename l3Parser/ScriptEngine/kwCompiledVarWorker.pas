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
  kwCompiledWordWorker,
  tfwAnonimousWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledVarWorker = class of TkwCompiledVarWorker;

 _tfwOtherWordRunner_Parent_ = TkwCompiledWordWorker;
 {$Include ..\ScriptEngine\tfwOtherWordRunner.imp.pas}
 TkwCompiledVarWorker = {abstract} class(_tfwOtherWordRunner_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
   function GetWordToRun: TtfwAnonimousWord; override;
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
     aWordToRun: TtfwWord;
     const aCtx: TtfwContext); reintroduce;
 end;//TkwCompiledVarWorker
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwVarWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\tfwOtherWordRunner.imp.pas}

// start class TkwCompiledVarWorker

procedure TkwCompiledVarWorker.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4DCBCCE40219_var*
//#UC END# *4DCBCD2200D2_4DCBCCE40219_var*
begin
//#UC START# *4DCBCD2200D2_4DCBCCE40219_impl*
 aCtx.rEngine.PushObj(aVar);
 RunOther(aCtx);
//#UC END# *4DCBCD2200D2_4DCBCCE40219_impl*
end;//TkwCompiledVarWorker.DoVar

constructor TkwCompiledVarWorker.Create(aWordToPush: TtfwWord;
  aWordToRun: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *5512950C01BA_4DCBCCE40219_var*
//#UC END# *5512950C01BA_4DCBCCE40219_var*
begin
//#UC START# *5512950C01BA_4DCBCCE40219_impl*
 f_WordToRun := aWordToRun;
 inherited Create(aWordToPush, aWordToRun, aCtx);
//#UC END# *5512950C01BA_4DCBCCE40219_impl*
end;//TkwCompiledVarWorker.Create

procedure TkwCompiledVarWorker.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DCBCCE40219_var*
//#UC END# *4DAEEDE10285_4DCBCCE40219_var*
begin
//#UC START# *4DAEEDE10285_4DCBCCE40219_impl*
 DoVar(aCtx, WordToWork);
//#UC END# *4DAEEDE10285_4DCBCCE40219_impl*
end;//TkwCompiledVarWorker.DoDoIt

function TkwCompiledVarWorker.GetWordToRun: TtfwAnonimousWord;
//#UC START# *55630CB40207_4DCBCCE40219_var*
//#UC END# *55630CB40207_4DCBCCE40219_var*
begin
//#UC START# *55630CB40207_4DCBCCE40219_impl*
 Result := (f_WordToRun As TtfwAnonimousWord);
//#UC END# *55630CB40207_4DCBCCE40219_impl*
end;//TkwCompiledVarWorker.GetWordToRun

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledVarWorker
 TkwCompiledVarWorker.RegisterClass;
{$IfEnd} //not NoScripts

end.