unit kwPopTreeNodeHasChildren;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopTreeNodeHasChildren.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::TreeViewWords::pop_TreeNode_HasChildren
//
// Проверят есть ли дочерние у узла дерева.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwTreeNodeFromStackWord,
  ComCtrls,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopTreeNodeHasChildren = {final scriptword} class(TkwTreeNodeFromStackWord)
  {* Проверят есть ли дочерние у узла дерева. }
 protected
 // realized methods
   procedure DoWithTTreeNode(const aTreeView: TTreeNode;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopTreeNodeHasChildren
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopTreeNodeHasChildren

procedure TkwPopTreeNodeHasChildren.DoWithTTreeNode(const aTreeView: TTreeNode;
  const aCtx: TtfwContext);
//#UC START# *512F49F103A8_512F4CDB0349_var*
//#UC END# *512F49F103A8_512F4CDB0349_var*
begin
//#UC START# *512F49F103A8_512F4CDB0349_impl*
 aCtx.rEngine.PushBool(aTreeView.HasChildren);
//#UC END# *512F49F103A8_512F4CDB0349_impl*
end;//TkwPopTreeNodeHasChildren.DoWithTTreeNode

class function TkwPopTreeNodeHasChildren.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:TreeNode:HasChildren';
end;//TkwPopTreeNodeHasChildren.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_TreeNode_HasChildren
 TkwPopTreeNodeHasChildren.RegisterInEngine;
{$IfEnd} //not NoScripts

end.