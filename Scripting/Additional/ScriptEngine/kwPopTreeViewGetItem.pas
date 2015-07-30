unit kwPopTreeViewGetItem;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopTreeViewGetItem.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::TreeViewWords::pop_TreeView_GetItem
//
// Возвращает узел TTreeNode по номеру.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwTreeViewNodeFromStackWord,
  ComCtrls,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopTreeViewGetItem = {final scriptword} class(TkwTreeViewNodeFromStackWord)
  {* Возвращает узел TTreeNode по номеру. }
 protected
 // realized methods
   procedure DoWithTreeView(const aTreeView: TTreeView;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopTreeViewGetItem
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopTreeViewGetItem

procedure TkwPopTreeViewGetItem.DoWithTreeView(const aTreeView: TTreeView;
  const aCtx: TtfwContext);
//#UC START# *512F47F00183_512F491C0347_var*
//#UC END# *512F47F00183_512F491C0347_var*
begin
//#UC START# *512F47F00183_512F491C0347_impl*
 if aCtx.rEngine.IsTopInt then
  aCtx.rEngine.PushObj(aTreeView.Items[0])
 else
  RunnerError('Не задан номер узла в дереве!', aCtx);
//#UC END# *512F47F00183_512F491C0347_impl*
end;//TkwPopTreeViewGetItem.DoWithTreeView

class function TkwPopTreeViewGetItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:TreeView:GetItem';
end;//TkwPopTreeViewGetItem.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_TreeView_GetItem
 TkwPopTreeViewGetItem.RegisterInEngine;
{$IfEnd} //not NoScripts

end.