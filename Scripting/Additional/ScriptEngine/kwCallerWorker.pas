unit kwCallerWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCallerWorker.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::CallerWorker
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCallerAndWordWorker,
  tfwScriptingInterfaces,
  kwCompiledWordWorkerWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCallerWorker = {final scriptword} class(TkwCallerAndWordWorker)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledWordWorkerWordClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWord; override;
 end;//TkwCallerWorker
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  kwCompiledCallerWorkerWord,
  kwCompiledImmediateCallerWorkerWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCallerWorker

class function TkwCallerWorker.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CallerWorker';
end;//TkwCallerWorker.GetWordNameForRegister

function TkwCallerWorker.CompiledWordWorkerWordClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWord;
//#UC START# *4F3FA9670261_4F41472B021E_var*
//#UC END# *4F3FA9670261_4F41472B021E_var*
begin
//#UC START# *4F3FA9670261_4F41472B021E_impl*
 if (tfw_wmImmediate in aCtx.rTypeInfo.Modifiers) then
  Result := TkwCompiledImmediateCallerWorkerWord
 else
  Result := TkwCompiledCallerWorkerWord;
//#UC END# *4F3FA9670261_4F41472B021E_impl*
end;//TkwCallerWorker.CompiledWordWorkerWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CallerWorker
 TkwCallerWorker.RegisterInEngine;
{$IfEnd} //not NoScripts

end.