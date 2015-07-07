{$IfNDef kwParaFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwParaFromStackWord.imp.pas"
// Начат: 03.11.2011 15:48
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::kwParaFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwParaFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _kwParaFromStackWord_ = {abstract mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoPara(const aPara: InevPara;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwParaFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwParaFromStackWord_imp}

{$IfNDef kwParaFromStackWord_imp_impl}
{$Define kwParaFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _kwParaFromStackWord_

procedure _kwParaFromStackWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4EB27F58027B_var*
//#UC END# *4DAEEDE10285_4EB27F58027B_var*
begin
//#UC START# *4DAEEDE10285_4EB27F58027B_impl*
 DoPara(InevPara(aCtx.rEngine.PopIntf(InevPara)), aCtx);
//#UC END# *4DAEEDE10285_4EB27F58027B_impl*
end;//_kwParaFromStackWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  kwParaFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwParaFromStackWord_imp_impl}
{$EndIf kwParaFromStackWord_imp}
