unit kwPopTreeNodeGetNext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopTreeNodeGetNext.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::TreeViewWords::pop_TreeNode_GetNext
//
// Помещает в стек указатель на следующий узел в дереве. Подробности см. TTreeNode.GetNext
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
 TkwPopTreeNodeGetNext = {final} class(_kwTreeNodeFromStackWord_)
  {* Помещает в стек указатель на следующий узел в дереве. Подробности см. TTreeNode.GetNext }
 protected
 // realized methods
   procedure DoWithTTreeNode(const aTreeView: TTreeNode;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopTreeNodeGetNext
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

type _Instance_R_ = TkwPopTreeNodeGetNext;

{$Include ..\ScriptEngine\kwTreeNodeFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwTreeNodeFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.