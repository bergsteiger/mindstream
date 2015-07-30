{$IfNDef tfwStandardProcedureWithStackChecking_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwStandardProcedureWithStackChecking.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine::WordsDefinition::tfwStandardProcedureWithStackChecking
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwStandardProcedureWithStackChecking_imp}
{$If not defined(NoScripts)}
 _tfwStandardProcedureWithStackChecking_ = {mixin} class(TtfwStandardProcedure)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//_tfwStandardProcedureWithStackChecking_
{$Else}

 _tfwStandardProcedureWithStackChecking_ = TtfwStandardProcedure;

{$IfEnd} //not NoScripts

{$Else tfwStandardProcedureWithStackChecking_imp}

{$If not defined(NoScripts)}

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

{$EndIf tfwStandardProcedureWithStackChecking_imp}
