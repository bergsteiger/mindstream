{$IfNDef kwTreeNodeFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeNodeFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::TreeViewWords::kwTreeNodeFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwTreeNodeFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}
 _kwTreeNodeFromStackWord_ = {mixin} class(_kwObjectFromStackWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithTTreeNode(const aTreeView: TTreeNode;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwTreeNodeFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwTreeNodeFromStackWord_imp}

{$IfNDef kwTreeNodeFromStackWord_imp_impl}
{$Define kwTreeNodeFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}

// start class _kwTreeNodeFromStackWord_

procedure _kwTreeNodeFromStackWord_.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_512F49B603E6_var*
//#UC END# *4F212BD5010E_512F49B603E6_var*
begin
//#UC START# *4F212BD5010E_512F49B603E6_impl*
 DoWithTTreeNode(anObject as TTreeNode, aCtx);
//#UC END# *4F212BD5010E_512F49B603E6_impl*
end;//_kwTreeNodeFromStackWord_.DoObject

{$IfEnd} //not NoScripts

{$Else  kwTreeNodeFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwTreeNodeFromStackWord_imp_impl}
{$EndIf kwTreeNodeFromStackWord_imp}
