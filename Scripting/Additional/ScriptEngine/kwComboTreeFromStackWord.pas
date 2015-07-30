unit kwComboTreeFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwComboTreeFromStackWord.pas"
// Начат: 03.11.2011 18:27
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::TkwComboTreeFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  FakeBox,
  tfwScriptingInterfaces,
  kwEditorFromStackWord,
  evCustomEditorWindow
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwComboTreeFromStackWord = {abstract} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // protected methods
   procedure DoCombo(const aCtx: TtfwContext;
     aCombo: TFakeBox); virtual; abstract;
 end;//TkwComboTreeFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwComboTreeFromStackWord

procedure TkwComboTreeFromStackWord.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4EB2A4A7008D_var*
//#UC END# *4F4CB81200CA_4EB2A4A7008D_var*
begin
//#UC START# *4F4CB81200CA_4EB2A4A7008D_impl*
 RunnerAssert(anEditor is TFakeBox, 'Этот редактор не TFakeBox', aCtx);
 DoCombo(aCtx, anEditor as TFakeBox);
//#UC END# *4F4CB81200CA_4EB2A4A7008D_impl*
end;//TkwComboTreeFromStackWord.DoWithEditor

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwComboTreeFromStackWord
 TkwComboTreeFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.