{$IfNDef tfwArrayWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwArrayWord.imp.pas"
// Начат: 01.12.2011 19:40
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::tfwArrayWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwArrayWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _tfwArrayWord_ = {abstract mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoArray(const aCtx: TtfwContext;
     const anArray: ItfwValueList); virtual; abstract;
 end;//_tfwArrayWord_
{$IfEnd} //not NoScripts

{$Else tfwArrayWord_imp}

{$IfNDef tfwArrayWord_imp_impl}
{$Define tfwArrayWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _tfwArrayWord_

procedure _tfwArrayWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4ED79FEE01F6_var*
//#UC END# *4DAEEDE10285_4ED79FEE01F6_var*
begin
//#UC START# *4DAEEDE10285_4ED79FEE01F6_impl*
 DoArray(aCtx, aCtx.rEngine.Pop.AsList);
//#UC END# *4DAEEDE10285_4ED79FEE01F6_impl*
end;//_tfwArrayWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  tfwArrayWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwArrayWord_imp_impl}
{$EndIf tfwArrayWord_imp}
