{$IfNDef kwComboBoxFromStack_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwComboBoxFromStack.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::kwComboBoxFromStack
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwComboBoxFromStack_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwComboBoxFromStack_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithComboBox(aCombobox: TCustomCombo;
     const aCtx: TtfwContext); virtual; abstract;
   procedure DoWithFakeBox(aFakeBox: TFakeBox;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwComboBoxFromStack_
{$IfEnd} //not NoScripts

{$Else kwComboBoxFromStack_imp}

{$IfNDef kwComboBoxFromStack_imp_impl}
{$Define kwComboBoxFromStack_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwComboBoxFromStack_

procedure _kwComboBoxFromStack_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_5049C6B900E3_var*
//#UC END# *4F212C3A015A_5049C6B900E3_var*
begin
//#UC START# *4F212C3A015A_5049C6B900E3_impl*
 if aControl is TCustomCombo then
  DoWithComboBox(aControl as TCustomCombo, aCtx)
 else
 if aControl is TFakeBox then
  DoWithFakeBox(aControl as TFakeBox, aCtx)
 else
  RunnerAssert(False, 'В слово ' + Key.AsString + ' передан неверный тип контрола.', aCtx);
//#UC END# *4F212C3A015A_5049C6B900E3_impl*
end;//_kwComboBoxFromStack_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwComboBoxFromStack_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwComboBoxFromStack_imp_impl}
{$EndIf kwComboBoxFromStack_imp}
