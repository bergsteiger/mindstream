{$IfNDef tfwTwoValuesWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwTwoValuesWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ExtendedPrimitives::tfwTwoValuesWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwTwoValuesWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _tfwTwoValuesWord_ = {abstract mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoValues(const aV1: TtfwStackValue;
     const aV2: TtfwStackValue;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_tfwTwoValuesWord_
{$IfEnd} //not NoScripts

{$Else tfwTwoValuesWord_imp}

{$IfNDef tfwTwoValuesWord_imp_impl}
{$Define tfwTwoValuesWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _tfwTwoValuesWord_

procedure _tfwTwoValuesWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F51EEB5008C_var*
var
 l_V1: TtfwStackValue;
 l_V2: TtfwStackValue;
//#UC END# *4DAEEDE10285_4F51EEB5008C_var*
begin
//#UC START# *4DAEEDE10285_4F51EEB5008C_impl*
 l_V2 := aCtx.rEngine.Pop;
 l_V1 := aCtx.rEngine.Pop;
 DoValues(l_V1, l_V2, aCtx);
//#UC END# *4DAEEDE10285_4F51EEB5008C_impl*
end;//_tfwTwoValuesWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  tfwTwoValuesWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwTwoValuesWord_imp_impl}
{$EndIf tfwTwoValuesWord_imp}
