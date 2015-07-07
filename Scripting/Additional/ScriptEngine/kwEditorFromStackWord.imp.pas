{$IfNDef kwEditorFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEditorFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwEditorFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwEditorFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwEditorFromStackWord_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); virtual; abstract;
 end;//_kwEditorFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwEditorFromStackWord_imp}

{$IfNDef kwEditorFromStackWord_imp_impl}
{$Define kwEditorFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwEditorFromStackWord_

procedure _kwEditorFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F4CB625027A_var*
//#UC END# *4F212C3A015A_4F4CB625027A_var*
begin
//#UC START# *4F212C3A015A_4F4CB625027A_impl*
 DoWithEditor(aCtx, aControl as TevCustomEditorWindow);
//#UC END# *4F212C3A015A_4F4CB625027A_impl*
end;//_kwEditorFromStackWord_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwEditorFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwEditorFromStackWord_imp_impl}
{$EndIf kwEditorFromStackWord_imp}
