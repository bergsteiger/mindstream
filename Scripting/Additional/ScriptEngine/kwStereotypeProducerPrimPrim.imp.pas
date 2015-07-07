{$IfNDef kwStereotypeProducerPrimPrim_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStereotypeProducerPrimPrim.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Stereotyping::kwStereotypeProducerPrimPrim
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwStereotypeProducerPrimPrim_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordProducer.imp.pas}
 _kwStereotypeProducerPrimPrim_ = {mixin} class(_tfwWordProducer_)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   function GetNewWordName(const aContext: TtfwContext): Il3CString; override;
 end;//_kwStereotypeProducerPrimPrim_
{$IfEnd} //not NoScripts

{$Else kwStereotypeProducerPrimPrim_imp}

{$IfNDef kwStereotypeProducerPrimPrim_imp_impl}
{$Define kwStereotypeProducerPrimPrim_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwWordProducer.imp.pas}

// start class _kwStereotypeProducerPrimPrim_

function _kwStereotypeProducerPrimPrim_.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F442FBE0300_var*
//#UC END# *4DBAEE0D028D_4F442FBE0300_var*
begin
//#UC START# *4DBAEE0D028D_4F442FBE0300_impl*
 Result := TkwCompiledStereotypedWord;
//#UC END# *4DBAEE0D028D_4F442FBE0300_impl*
end;//_kwStereotypeProducerPrimPrim_.CompiledWordClass

function _kwStereotypeProducerPrimPrim_.GetNewWordName(const aContext: TtfwContext): Il3CString;
//#UC START# *4F37B3F10318_4F442FBE0300_var*
//#UC END# *4F37B3F10318_4F442FBE0300_var*
begin
//#UC START# *4F37B3F10318_4F442FBE0300_impl*
 Result := l3Cat([TtfwCStringFactory.C('<<'), inherited GetNewWordName(aContext), TtfwCStringFactory.C('>>')]);
//#UC END# *4F37B3F10318_4F442FBE0300_impl*
end;//_kwStereotypeProducerPrimPrim_.GetNewWordName

{$IfEnd} //not NoScripts

{$Else  kwStereotypeProducerPrimPrim_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordProducer.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwStereotypeProducerPrimPrim_imp_impl}
{$EndIf kwStereotypeProducerPrimPrim_imp}
