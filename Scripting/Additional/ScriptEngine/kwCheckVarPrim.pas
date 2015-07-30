unit kwCheckVarPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCheckVarPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::MembersWorking::TkwCheckVarPrim
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
 TkwCheckVarPrim = {abstract} class(TtfwWordWorker)
 protected
 // realized methods
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
 protected
 // overridden protected methods
   procedure DoCompiledWord(aWord: TtfwWord;
     const aContext: TtfwContext); override;
 end;//TkwCheckVarPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledCheckVarByRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCheckVarPrim

function TkwCheckVarPrim.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_53E22FD30376_var*
//#UC END# *4DCBD67C0362_53E22FD30376_var*
begin
//#UC START# *4DCBD67C0362_53E22FD30376_impl*
 Result := TkwCompiledCheckVarByRef;
//#UC END# *4DCBD67C0362_53E22FD30376_impl*
end;//TkwCheckVarPrim.CompiledWorkerClass

procedure TkwCheckVarPrim.DoCompiledWord(aWord: TtfwWord;
  const aContext: TtfwContext);
//#UC START# *4DB9BBD6024F_53E22FD30376_var*
//#UC END# *4DB9BBD6024F_53E22FD30376_var*
begin
//#UC START# *4DB9BBD6024F_53E22FD30376_impl*
 inherited;
//#UC END# *4DB9BBD6024F_53E22FD30376_impl*
end;//TkwCheckVarPrim.DoCompiledWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCheckVarPrim
 TkwCheckVarPrim.RegisterClass;
{$IfEnd} //not NoScripts

end.