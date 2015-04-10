{$IfNDef kwInitedVarProducer_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwInitedVarProducer.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::VarProducing::kwInitedVarProducer
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwInitedVarProducer_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordProducer.imp.pas}
 _kwInitedVarProducer_ = {mixin} class(_tfwWordProducer_)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//_kwInitedVarProducer_
{$IfEnd} //not NoScripts

{$Else kwInitedVarProducer_imp}

{$IfNDef kwInitedVarProducer_imp_impl}
{$Define kwInitedVarProducer_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwWordProducer.imp.pas}

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

{$Else  kwInitedVarProducer_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordProducer.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwInitedVarProducer_imp_impl}
{$EndIf kwInitedVarProducer_imp}
