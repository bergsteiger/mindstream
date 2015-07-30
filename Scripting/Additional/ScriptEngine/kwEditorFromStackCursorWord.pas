unit kwEditorFromStackCursorWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwEditorFromStackCursorWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::TkwEditorFromStackCursorWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  kwEditorFromStackWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _kwEditorFromStackCursorWordUses_Parent_ = TkwEditorFromStackWord;
 {$Include ..\ScriptEngine\kwEditorFromStackCursorWordUses.imp.pas}
 TkwEditorFromStackCursorWord = {abstract} class(_kwEditorFromStackCursorWordUses_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // protected methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); virtual; abstract;
 end;//TkwEditorFromStackCursorWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TextPara_Const,
  CommentPara_Const,
  Windows,
  Controls,
  evParaTools,
  evOp
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwEditorFromStackCursorWordUses.imp.pas}

// start class TkwEditorFromStackCursorWord

procedure TkwEditorFromStackCursorWord.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_50B88DF40154_var*
//#UC END# *4F4CB81200CA_50B88DF40154_var*
begin
//#UC START# *4F4CB81200CA_50B88DF40154_impl*
 RunnerAssert(anEditor.Selection <> nil, '', aCtx);
 RunnerAssert(anEditor.Selection.Cursor <> nil, '', aCtx);
 DoCursor(aCtx, anEditor, anEditor.Selection.Cursor);
//#UC END# *4F4CB81200CA_50B88DF40154_impl*
end;//TkwEditorFromStackCursorWord.DoWithEditor

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwEditorFromStackCursorWord
 TkwEditorFromStackCursorWord.RegisterClass;
{$IfEnd} //not NoScripts

end.