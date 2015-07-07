{$IfNDef kwEditorWithToolsFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEditorWithToolsFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwEditorWithToolsFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwEditorWithToolsFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 _kwEditorWithToolsFromStackWord_ = {mixin} class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // protected methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); virtual; abstract;
 end;//_kwEditorWithToolsFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwEditorWithToolsFromStackWord_imp}

{$IfNDef kwEditorWithToolsFromStackWord_imp_impl}
{$Define kwEditorWithToolsFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class _kwEditorWithToolsFromStackWord_

procedure _kwEditorWithToolsFromStackWord_.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F4DD85E0165_var*
//#UC END# *4F4CB81200CA_4F4DD85E0165_var*
begin
//#UC START# *4F4CB81200CA_4F4DD85E0165_impl*
 DoEditorWithTools(aCtx, anEditor as TevCustomEditor);
//#UC END# *4F4CB81200CA_4F4DD85E0165_impl*
end;//_kwEditorWithToolsFromStackWord_.DoWithEditor

{$IfEnd} //not NoScripts

{$Else  kwEditorWithToolsFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwEditorWithToolsFromStackWord_imp_impl}
{$EndIf kwEditorWithToolsFromStackWord_imp}
