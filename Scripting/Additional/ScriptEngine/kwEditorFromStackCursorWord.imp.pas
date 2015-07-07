{$IfNDef kwEditorFromStackCursorWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEditorFromStackCursorWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwEditorFromStackCursorWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwEditorFromStackCursorWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 _kwEditorFromStackCursorWord_ = {mixin} class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // protected methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); virtual; abstract;
 end;//_kwEditorFromStackCursorWord_
{$IfEnd} //not NoScripts

{$Else kwEditorFromStackCursorWord_imp}

{$IfNDef kwEditorFromStackCursorWord_imp_impl}
{$Define kwEditorFromStackCursorWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class _kwEditorFromStackCursorWord_

procedure _kwEditorFromStackCursorWord_.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_50B88DF40154_var*
//#UC END# *4F4CB81200CA_50B88DF40154_var*
begin
//#UC START# *4F4CB81200CA_50B88DF40154_impl*
 RunnerAssert(anEditor.Selection <> nil, '', aCtx);
 RunnerAssert(anEditor.Selection.Cursor <> nil, '', aCtx);
 DoCursor(aCtx, anEditor, anEditor.Selection.Cursor);
//#UC END# *4F4CB81200CA_50B88DF40154_impl*
end;//_kwEditorFromStackCursorWord_.DoWithEditor

{$IfEnd} //not NoScripts

{$Else  kwEditorFromStackCursorWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwEditorFromStackCursorWord_imp_impl}
{$EndIf kwEditorFromStackCursorWord_imp}
