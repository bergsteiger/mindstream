unit kwCompiledTryFinally;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledTryFinally.pas"
// Начат: 29.04.2011 18:05
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledTryFinally
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
  kwDualCompiledWordContainer,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledTryFinally = class(TkwDualCompiledWordContainer)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledTryFinally
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledTryFinally

procedure TkwCompiledTryFinally.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DBAC56C017C_var*
//#UC END# *4DAEEDE10285_4DBAC56C017C_var*
begin
//#UC START# *4DAEEDE10285_4DBAC56C017C_impl*
 try
  Compiled.DoIt(aCtx);
 finally
  f_ElseBranch.DoIt(aCtx);
 end;//try..finally
//#UC END# *4DAEEDE10285_4DBAC56C017C_impl*
end;//TkwCompiledTryFinally.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DB78C203C8*
 TkwCompiledTryFinally.RegisterClass;
//#UC END# *53DB78C203C8*
{$IfEnd} //not NoScripts

end.