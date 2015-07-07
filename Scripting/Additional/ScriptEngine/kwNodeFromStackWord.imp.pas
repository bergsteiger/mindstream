{$IfNDef kwNodeFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNodeFromStackWord.imp.pas"
// Начат: 03.11.2011 18:31
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::kwNodeFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwNodeFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _kwNodeFromStackWord_ = {abstract mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoNode(const aNode: Il3SimpleNode;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwNodeFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwNodeFromStackWord_imp}

{$IfNDef kwNodeFromStackWord_imp_impl}
{$Define kwNodeFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _kwNodeFromStackWord_

procedure _kwNodeFromStackWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4EB2A5A402D2_var*
//#UC END# *4DAEEDE10285_4EB2A5A402D2_var*
begin
//#UC START# *4DAEEDE10285_4EB2A5A402D2_impl*
 DoNode(Il3SimpleNode(aCtx.rEngine.PopIntf(Il3SimpleNode)), aCtx);
//#UC END# *4DAEEDE10285_4EB2A5A402D2_impl*
end;//_kwNodeFromStackWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  kwNodeFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwNodeFromStackWord_imp_impl}
{$EndIf kwNodeFromStackWord_imp}
