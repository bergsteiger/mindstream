unit kwMODAL;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMODAL.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::CodeFlowWords::MODAL
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
 TkwMODAL = {final scriptword} class(TtfwWordWorker)
 protected
 // realized methods
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMODAL
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledModal
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMODAL

function TkwMODAL.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4FC753AD0369_var*
//#UC END# *4DCBD67C0362_4FC753AD0369_var*
begin
//#UC START# *4DCBD67C0362_4FC753AD0369_impl*
 Result := TkwCompiledModal;
//#UC END# *4DCBD67C0362_4FC753AD0369_impl*
end;//TkwMODAL.CompiledWorkerClass

class function TkwMODAL.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'MODAL';
end;//TkwMODAL.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация MODAL
 TkwMODAL.RegisterInEngine;
{$IfEnd} //not NoScripts

end.