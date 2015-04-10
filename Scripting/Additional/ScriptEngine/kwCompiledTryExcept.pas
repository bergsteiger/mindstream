unit kwCompiledTryExcept;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledTryExcept.pas"
// Начат: 29.04.2011 19:53
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledTryExcept
//
// Скомпилированная версия try except
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
 TkwCompiledTryExcept = class(TkwDualCompiledWordContainer)
  {* Скомпилированная версия try except }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledTryExcept
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  StrUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledTryExcept

procedure TkwCompiledTryExcept.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DBADEE702A8_var*
var
 l_Ctx : TtfwContext;
//#UC END# *4DAEEDE10285_4DBADEE702A8_var*
begin
//#UC START# *4DAEEDE10285_4DBADEE702A8_impl*
 try
  Compiled.DoIt(aCtx);
 except
  on EtfwCodeFlowException do
   raise;
  on E : Exception do
  begin
   l_Ctx := aCtx;
   try
    l_Ctx.rException := E;
    f_ElseBranch.DoIt(l_Ctx);
   finally
    Finalize(l_Ctx);
   end;//try..finally
  end;//on E : Exception
 end;//try..except
//#UC END# *4DAEEDE10285_4DBADEE702A8_impl*
end;//TkwCompiledTryExcept.DoDoIt

{$IfEnd} //not NoScripts

end.