unit tfwProcedure;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwProcedure.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TtfwProcedure
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwNewWord,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwProcedure = {abstract} class(TtfwNewWord)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//TtfwProcedure
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledProcedure
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwProcedure

function TtfwProcedure.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F216D4803C0_var*
//#UC END# *4DBAEE0D028D_4F216D4803C0_var*
begin
//#UC START# *4DBAEE0D028D_4F216D4803C0_impl*
 Result := TkwCompiledProcedure;
//#UC END# *4DBAEE0D028D_4F216D4803C0_impl*
end;//TtfwProcedure.CompiledWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwProcedure
 TtfwProcedure.RegisterClass;
{$IfEnd} //not NoScripts

end.