{$IfNDef kwInitedVarProducer_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwInitedVarProducer.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Scripting::ScriptEngine::VarProducing::kwInitedVarProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwInitedVarProducer_imp}
{$If not defined(NoScripts)}
 _kwInitedVarProducer_ = {mixin} class(TtfwWordProducer)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//_kwInitedVarProducer_
{$IfEnd} //not NoScripts

{$Else kwInitedVarProducer_imp}

{$If not defined(NoScripts)}

// start class _kwInitedVarProducer_

function _kwInitedVarProducer_.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F3E187500E9_var*
//#UC END# *4DBAEE0D028D_4F3E187500E9_var*
begin
//#UC START# *4DBAEE0D028D_4F3E187500E9_impl*
 Result := TkwCompiledInitableVar;
//#UC END# *4DBAEE0D028D_4F3E187500E9_impl*
end;//_kwInitedVarProducer_.CompiledWordClass

{$IfEnd} //not NoScripts

{$EndIf kwInitedVarProducer_imp}
