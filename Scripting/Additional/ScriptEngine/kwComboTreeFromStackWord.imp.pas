{$IfNDef kwComboTreeFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwComboTreeFromStackWord.imp.pas"
// Начат: 03.11.2011 18:27
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwComboTreeFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwComboTreeFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 _kwComboTreeFromStackWord_ = {abstract mixin} class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // protected methods
   procedure DoCombo(const aCtx: TtfwContext;
     aCombo: TFakeBox); virtual; abstract;
 end;//_kwComboTreeFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwComboTreeFromStackWord_imp}

{$IfNDef kwComboTreeFromStackWord_imp_impl}
{$Define kwComboTreeFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class _kwComboTreeFromStackWord_

procedure _kwComboTreeFromStackWord_.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4EB2A4A7008D_var*
//#UC END# *4F4CB81200CA_4EB2A4A7008D_var*
begin
//#UC START# *4F4CB81200CA_4EB2A4A7008D_impl*
 RunnerAssert(anEditor is TFakeBox, 'Этот редактор не TFakeBox', aCtx);
 DoCombo(aCtx, anEditor as TFakeBox);
//#UC END# *4F4CB81200CA_4EB2A4A7008D_impl*
end;//_kwComboTreeFromStackWord_.DoWithEditor

{$IfEnd} //not NoScripts

{$Else  kwComboTreeFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwComboTreeFromStackWord_imp_impl}
{$EndIf kwComboTreeFromStackWord_imp}
