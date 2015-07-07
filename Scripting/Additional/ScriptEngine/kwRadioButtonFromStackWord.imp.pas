{$IfNDef kwRadioButtonFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwRadioButtonFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::kwRadioButtonFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwRadioButtonFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwRadioButtonFromStackWord_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithRadioButton(aControl: TRadioButton;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwRadioButtonFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwRadioButtonFromStackWord_imp}

{$IfNDef kwRadioButtonFromStackWord_imp_impl}
{$Define kwRadioButtonFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwRadioButtonFromStackWord_

procedure _kwRadioButtonFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F69B9150041_var*
//#UC END# *4F212C3A015A_4F69B9150041_var*
begin
//#UC START# *4F212C3A015A_4F69B9150041_impl*
 DoWithRadioButton(aControl as TRadioButton, aCtx);
//#UC END# *4F212C3A015A_4F69B9150041_impl*
end;//_kwRadioButtonFromStackWord_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwRadioButtonFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwRadioButtonFromStackWord_imp_impl}
{$EndIf kwRadioButtonFromStackWord_imp}
