unit kwPopTreeNodeGetNext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopTreeNodeGetNext.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::TreeViewWords::pop_TreeNode_GetNext
//
// Помещает в стек указатель на следующий узел в дереве. Подробности см. TTreeNode.GetNext
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
 TkwPopTreeNodeGetNext = {final scriptword} class(TkwTreeNodeFromStackWord)
  {* Помещает в стек указатель на следующий узел в дереве. Подробности см. TTreeNode.GetNext }
 protected
 // realized methods
   procedure DoWithTTreeNode(const aTreeView: TTreeNode;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopTreeNodeGetNext
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopTreeNodeGetNext

procedure TkwPopTreeNodeGetNext.DoWithTTreeNode(const aTreeView: TTreeNode;
  const aCtx: TtfwContext);
//#UC START# *512F49F103A8_512F4A8901C1_var*
//#UC END# *512F49F103A8_512F4A8901C1_var*
begin
//#UC START# *512F49F103A8_512F4A8901C1_impl*
 aCtx.rEngine.PushObj(aTreeView.GetNext);
//#UC END# *512F49F103A8_512F4A8901C1_impl*
end;//TkwPopTreeNodeGetNext.DoWithTTreeNode

class function TkwPopTreeNodeGetNext.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:TreeNode:GetNext';
end;//TkwPopTreeNodeGetNext.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_TreeNode_GetNext
 TkwPopTreeNodeGetNext.RegisterInEngine;
{$IfEnd} //not NoScripts

end.