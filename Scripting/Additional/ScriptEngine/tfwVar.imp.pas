{$IfNDef tfwVar_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwVar.imp.pas"
// Начат: 111.05.2011 19:56
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::tfwVar
//
// Поддержка переменных
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwVar_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwNewWord.imp.pas}
 _tfwVar_ = {abstract mixin} class(_tfwNewWord_)
  {* Поддержка переменных }
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function AcceptsKeyWordAfter: Boolean; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//_tfwVar_
{$IfEnd} //not NoScripts

{$Else tfwVar_imp}

{$IfNDef tfwVar_imp_impl}
{$Define tfwVar_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwNewWord.imp.pas}

// start class _tfwVar_

function _tfwVar_.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4DCAB1A2017C_var*
//#UC END# *4DB6C99F026E_4DCAB1A2017C_var*
begin
//#UC START# *4DB6C99F026E_4DCAB1A2017C_impl*
 Result := DisabledEndBracket(aContext, aSilent);
//#UC END# *4DB6C99F026E_4DCAB1A2017C_impl*
end;//_tfwVar_.EndBracket

function _tfwVar_.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4DCAB1A2017C_var*
//#UC END# *4DB9B446039A_4DCAB1A2017C_var*
begin
//#UC START# *4DB9B446039A_4DCAB1A2017C_impl*
 Result := 0;
//#UC END# *4DB9B446039A_4DCAB1A2017C_impl*
end;//_tfwVar_.AfterWordMaxCount

function _tfwVar_.AcceptsKeyWordAfter: Boolean;
//#UC START# *4DB9B502013D_4DCAB1A2017C_var*
//#UC END# *4DB9B502013D_4DCAB1A2017C_var*
begin
//#UC START# *4DB9B502013D_4DCAB1A2017C_impl*
 Result := false;
//#UC END# *4DB9B502013D_4DCAB1A2017C_impl*
end;//_tfwVar_.AcceptsKeyWordAfter

function _tfwVar_.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4DCAB1A2017C_var*
//#UC END# *4DBAEE0D028D_4DCAB1A2017C_var*
begin
//#UC START# *4DBAEE0D028D_4DCAB1A2017C_impl*
 Result := TkwCompiledVar;
//#UC END# *4DBAEE0D028D_4DCAB1A2017C_impl*
end;//_tfwVar_.CompiledWordClass

{$IfEnd} //not NoScripts

{$Else  tfwVar_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwNewWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwVar_imp_impl}
{$EndIf tfwVar_imp}
