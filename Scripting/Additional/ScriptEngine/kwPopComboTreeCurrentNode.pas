unit kwPopComboTreeCurrentNode;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopComboTreeCurrentNode.pas"
// Начат: 03.11.2011 18:29
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_ComboTree_CurrentNode
//
// Получает текущую ноду выбранную в дереве комбо
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwComboTreeFromStackWord,
  FakeBox,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopComboTreeCurrentNode = {scriptword} class(TkwComboTreeFromStackWord)
  {* Получает текущую ноду выбранную в дереве комбо }
 protected
 // realized methods
   procedure DoCombo(const aCtx: TtfwContext;
     aCombo: TFakeBox); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComboTreeCurrentNode
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopComboTreeCurrentNode

procedure TkwPopComboTreeCurrentNode.DoCombo(const aCtx: TtfwContext;
  aCombo: TFakeBox);
//#UC START# *4EB2A555015E_4EB2A4FE00A9_var*
//#UC END# *4EB2A555015E_4EB2A4FE00A9_var*
begin
//#UC START# *4EB2A555015E_4EB2A4FE00A9_impl*
 aCtx.rEngine.PushIntf(aCombo.Tree.GetCurrentNode);
//#UC END# *4EB2A555015E_4EB2A4FE00A9_impl*
end;//TkwPopComboTreeCurrentNode.DoCombo

class function TkwPopComboTreeCurrentNode.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboTree:CurrentNode';
end;//TkwPopComboTreeCurrentNode.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_ComboTree_CurrentNode
 TkwPopComboTreeCurrentNode.RegisterInEngine;
{$IfEnd} //not NoScripts

end.