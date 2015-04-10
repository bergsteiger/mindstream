unit kwPopTreeNodeHasChildren;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopTreeNodeHasChildren.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::TreeViewWords::pop_TreeNode_HasChildren
//
// Проверят есть ли дочерние у узла дерева.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  ComCtrls,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwTreeNodeFromStackWord.imp.pas}
 TkwPopTreeNodeHasChildren = {final} class(_kwTreeNodeFromStackWord_)
  {* Проверят есть ли дочерние у узла дерева. }
 protected
 // realized methods
   procedure DoWithTTreeNode(const aTreeView: TTreeNode;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopTreeNodeHasChildren
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopTreeNodeHasChildren;

{$Include ..\ScriptEngine\kwTreeNodeFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwTreeNodeFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.