unit kwTHREAD;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwTHREAD.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::CodeFlowWords::THREAD
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordWorker,
  tfwScriptingInterfaces,
  kwCompiledWordWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwTHREAD = {final scriptword} class(TtfwWordWorker)
 protected
 // realized methods
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTHREAD
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledThread
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwTHREAD

function TkwTHREAD.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4FFFCE260353_var*
//#UC END# *4DCBD67C0362_4FFFCE260353_var*
begin
//#UC START# *4DCBD67C0362_4FFFCE260353_impl*
 Result := TkwCompiledThread;
//#UC END# *4DCBD67C0362_4FFFCE260353_impl*
end;//TkwTHREAD.CompiledWorkerClass

class function TkwTHREAD.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'THREAD';
end;//TkwTHREAD.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация THREAD
 TkwTHREAD.RegisterInEngine;
{$IfEnd} //not NoScripts

end.