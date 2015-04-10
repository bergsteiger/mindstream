{$IfNDef kwInterfacedNodeWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwInterfacedNodeWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::NodeWords::kwInterfacedNodeWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwInterfacedNodeWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _kwInterfacedNodeWord_ = {mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoNode(const aNode: Il3Node;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwInterfacedNodeWord_
{$IfEnd} //not NoScripts

{$Else kwInterfacedNodeWord_imp}

{$IfNDef kwInterfacedNodeWord_imp_impl}
{$Define kwInterfacedNodeWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _kwInterfacedNodeWord_

procedure _kwInterfacedNodeWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53B52F08020F_var*
var
 l_Unk: IUnknown;
 l_Node: Il3Node;
//#UC END# *4DAEEDE10285_53B52F08020F_var*
begin
//#UC START# *4DAEEDE10285_53B52F08020F_impl*
 RunnerAssert(aCtx.rEngine.IsTopIntf, 'Не передана нода!', aCtx);
 l_Unk := aCtx.rEngine.PopIntf;
 try
  Supports(l_Unk, Il3Node, l_Node);
 finally
  l_Unk := nil;
 end;
 RunnerAssert(Assigned(l_Node), 'Не передана нода!', aCtx);
 try
  DoNode(l_Node, aCtx);
 finally
  l_Node := nil;
 end;
//#UC END# *4DAEEDE10285_53B52F08020F_impl*
end;//_kwInterfacedNodeWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  kwInterfacedNodeWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwInterfacedNodeWord_imp_impl}
{$EndIf kwInterfacedNodeWord_imp}
