unit tfwWordWorkerEx;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwWordWorkerEx.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TtfwWordWorkerEx
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
 TtfwWordWorkerEx = {abstract} class(TtfwWordWorker)
 protected
 // realized methods
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
 end;//TtfwWordWorkerEx
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledWordWorkerEx
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwWordWorkerEx

function TtfwWordWorkerEx.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_5512E4070106_var*
//#UC END# *4DCBD67C0362_5512E4070106_var*
begin
//#UC START# *4DCBD67C0362_5512E4070106_impl*
 Result := TkwCompiledWordWorkerEx;
//#UC END# *4DCBD67C0362_5512E4070106_impl*
end;//TtfwWordWorkerEx.CompiledWorkerClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwWordWorkerEx
 TtfwWordWorkerEx.RegisterClass;
{$IfEnd} //not NoScripts

end.