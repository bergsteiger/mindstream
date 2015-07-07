{$IfNDef kwRadioGroupFromStack_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwRadioGroupFromStack.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::kwRadioGroupFromStack
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwRadioGroupFromStack_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwRadioGroupFromStack_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithRadioGroup(const aRadioGroup: TRadioGroup;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwRadioGroupFromStack_
{$IfEnd} //not NoScripts

{$Else kwRadioGroupFromStack_imp}

{$IfNDef kwRadioGroupFromStack_imp_impl}
{$Define kwRadioGroupFromStack_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwRadioGroupFromStack_

procedure _kwRadioGroupFromStack_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_5034B4080380_var*
//#UC END# *4F212C3A015A_5034B4080380_var*
begin
//#UC START# *4F212C3A015A_5034B4080380_impl*
 DoWithRadioGroup(aControl as TRadioGroup, aCtx);
//#UC END# *4F212C3A015A_5034B4080380_impl*
end;//_kwRadioGroupFromStack_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwRadioGroupFromStack_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwRadioGroupFromStack_imp_impl}
{$EndIf kwRadioGroupFromStack_imp}
