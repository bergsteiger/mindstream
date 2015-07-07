{$IfNDef kwCheckListBox_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCheckListBox.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::kwCheckListBox
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwCheckListBox_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwCheckListBox_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithCheckListBox(aControl: TCheckListBox;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwCheckListBox_
{$IfEnd} //not NoScripts

{$Else kwCheckListBox_imp}

{$IfNDef kwCheckListBox_imp_impl}
{$Define kwCheckListBox_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwCheckListBox_

procedure _kwCheckListBox_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_51F24BF30118_var*
//#UC END# *4F212C3A015A_51F24BF30118_var*
begin
//#UC START# *4F212C3A015A_51F24BF30118_impl*
 DoWithCheckListBox(aControl as TCheckListBox, aCtx);
//#UC END# *4F212C3A015A_51F24BF30118_impl*
end;//_kwCheckListBox_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwCheckListBox_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwCheckListBox_imp_impl}
{$EndIf kwCheckListBox_imp}
