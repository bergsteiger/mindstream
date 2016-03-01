unit kwCompiledWordWorkerEx;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwCompiledWordWorkerEx.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwCompiledWordWorkerEx
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
 _tfwOtherWordRunner_Parent_ = TkwCompiledWordWorker;
 {$Include tfwOtherWordRunner.imp.pas}
 TkwCompiledWordWorkerEx = class(_tfwOtherWordRunner_)
 private
 // private fields
   f_WordToRun : TtfwWord;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
   function GetWordToRun: TtfwAnonimousWord; override;
 public
 // overridden public methods
   constructor Create(aWordToPush: TtfwWord;
     aWordToRun: TtfwWord;
     const aCtx: TtfwContext); override;
 end;//TkwCompiledWordWorkerEx
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwWordWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include tfwOtherWordRunner.imp.pas}

// start class TkwCompiledWordWorkerEx

procedure TkwCompiledWordWorkerEx.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5512E3740036_var*
//#UC END# *4DAEEDE10285_5512E3740036_var*
begin
//#UC START# *4DAEEDE10285_5512E3740036_impl*
 aCtx.rEngine.PushObj(WordToWork);
 RunOther(aCtx);
//#UC END# *4DAEEDE10285_5512E3740036_impl*
end;//TkwCompiledWordWorkerEx.DoDoIt

function TkwCompiledWordWorkerEx.GetWordToRun: TtfwAnonimousWord;
//#UC START# *55630CB40207_5512E3740036_var*
//#UC END# *55630CB40207_5512E3740036_var*
begin
//#UC START# *55630CB40207_5512E3740036_impl*
 Result := (f_WordToRun As TtfwAnonimousWord);
//#UC END# *55630CB40207_5512E3740036_impl*
end;//TkwCompiledWordWorkerEx.GetWordToRun

constructor TkwCompiledWordWorkerEx.Create(aWordToPush: TtfwWord;
  aWordToRun: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4DCBB0CD028D_5512E3740036_var*
//#UC END# *4DCBB0CD028D_5512E3740036_var*
begin
//#UC START# *4DCBB0CD028D_5512E3740036_impl*
 f_WordToRun := aWordToRun;
 inherited Create(aWordToPush, aWordToRun, aCtx);
//#UC END# *4DCBB0CD028D_5512E3740036_impl*
end;//TkwCompiledWordWorkerEx.Create

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWordWorkerEx
 TkwCompiledWordWorkerEx.RegisterClass;
{$IfEnd} //not NoScripts

end.