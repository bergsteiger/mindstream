{$IfNDef tfwConstLike_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwConstLike.imp.pas"
// Начат: 15.02.2012 18:29
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::tfwConstLike
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwConstLike_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwNewWord.imp.pas}
 _tfwConstLike_ = {abstract mixin} class(_tfwNewWord_)
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//_tfwConstLike_
{$IfEnd} //not NoScripts

{$Else tfwConstLike_imp}

{$IfNDef tfwConstLike_imp_impl}
{$Define tfwConstLike_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwNewWord.imp.pas}

// start class _tfwConstLike_

function _tfwConstLike_.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F3BC124004D_var*
//#UC END# *4DB6C99F026E_4F3BC124004D_var*
begin
//#UC START# *4DB6C99F026E_4F3BC124004D_impl*
 Result := DisabledEndBracket(aContext, aSilent);
//#UC END# *4DB6C99F026E_4F3BC124004D_impl*
end;//_tfwConstLike_.EndBracket

function _tfwConstLike_.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4F3BC124004D_var*
//#UC END# *4DB9B446039A_4F3BC124004D_var*
begin
//#UC START# *4DB9B446039A_4F3BC124004D_impl*
 Result := 1;
//#UC END# *4DB9B446039A_4F3BC124004D_impl*
end;//_tfwConstLike_.AfterWordMaxCount

function _tfwConstLike_.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F3BC124004D_var*
//#UC END# *4DBAEE0D028D_4F3BC124004D_var*
begin
//#UC START# *4DBAEE0D028D_4F3BC124004D_impl*
 Result := TkwRuntimeWordWithCodeExecution;
//#UC END# *4DBAEE0D028D_4F3BC124004D_impl*
end;//_tfwConstLike_.CompiledWordClass

{$IfEnd} //not NoScripts

{$Else  tfwConstLike_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwNewWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwConstLike_imp_impl}
{$EndIf tfwConstLike_imp}
