unit kwCompiledTryExcept;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwCompiledTryExcept.pas"
// Начат: 29.04.2011 19:53
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledTryExcept
//
// Скомпилированная версия try except
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 l_WasException : Boolean;
//#UC END# *4DAEEDE10285_4DBADEE702A8_var*
begin
//#UC START# *4DAEEDE10285_4DBADEE702A8_impl*
 try
  WordToWork.DoIt(aCtx);
 except
  on EtfwCodeFlowException do
   raise;
  on E : Exception do
  begin
   l_Ctx := aCtx;
   l_WasException := false;
   try
    l_Ctx.rException := E;
    try
     f_ElseBranch.DoIt(l_Ctx);
    except
     l_WasException := true;
     raise;
    end;//try..except
   finally
    if not l_WasException then
     aCtx.rEngine.WordSuccess;
    Finalize(l_Ctx);
   end;//try..finally
  end;//on E : Exception
 end;//try..except
//#UC END# *4DAEEDE10285_4DBADEE702A8_impl*
end;//TkwCompiledTryExcept.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledTryExcept
 TkwCompiledTryExcept.RegisterClass;
{$IfEnd} //not NoScripts

end.