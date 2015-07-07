{$IfNDef tfwStandardProcedureWithStackChecking_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwStandardProcedureWithStackChecking.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::WordsDefinition::tfwStandardProcedureWithStackChecking
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwStandardProcedureWithStackChecking_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStandardProcedure.imp.pas}
 _tfwStandardProcedureWithStackChecking_ = {mixin} class(_tfwStandardProcedure_)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//_tfwStandardProcedureWithStackChecking_
{$IfEnd} //not NoScripts

{$Else tfwStandardProcedureWithStackChecking_imp}

{$IfNDef tfwStandardProcedureWithStackChecking_imp_impl}
{$Define tfwStandardProcedureWithStackChecking_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwStandardProcedure.imp.pas}

// start class _tfwStandardProcedureWithStackChecking_

function _tfwStandardProcedureWithStackChecking_.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_528F652902C1_var*
//#UC END# *4DBAEE0D028D_528F652902C1_var*
begin
//#UC START# *4DBAEE0D028D_528F652902C1_impl*
 Result := TkwCompiledProcedureWithStackChecking;
//#UC END# *4DBAEE0D028D_528F652902C1_impl*
end;//_tfwStandardProcedureWithStackChecking_.CompiledWordClass

{$IfEnd} //not NoScripts

{$Else  tfwStandardProcedureWithStackChecking_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStandardProcedure.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwStandardProcedureWithStackChecking_imp_impl}
{$EndIf tfwStandardProcedureWithStackChecking_imp}
