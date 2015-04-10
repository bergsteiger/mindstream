{$IfNDef tfwWordProducer_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwWordProducer.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::tfwWordProducer
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwWordProducer_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwVar.imp.pas}
 _tfwWordProducer_ = {abstract mixin} class(_tfwVar_)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//_tfwWordProducer_
{$IfEnd} //not NoScripts

{$Else tfwWordProducer_imp}

{$IfNDef tfwWordProducer_imp_impl}
{$Define tfwWordProducer_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwVar.imp.pas}

// start class _tfwWordProducer_

function _tfwWordProducer_.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F367D6E004C_var*
//#UC END# *4DBAEE0D028D_4F367D6E004C_var*
begin
//#UC START# *4DBAEE0D028D_4F367D6E004C_impl*
 Result := TkwCompiledWord;
//#UC END# *4DBAEE0D028D_4F367D6E004C_impl*
end;//_tfwWordProducer_.CompiledWordClass

{$IfEnd} //not NoScripts

{$Else  tfwWordProducer_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwVar.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwWordProducer_imp_impl}
{$EndIf tfwWordProducer_imp}
