{$IfNDef kwWinControlFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWinControlFromStackWord.imp.pas"
// Начат: 26.01.2012 14:35
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::kwWinControlFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwWinControlFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwWinControlFromStackWord_ = {abstract mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwWinControlFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwWinControlFromStackWord_imp}

{$IfNDef kwWinControlFromStackWord_imp_impl}
{$Define kwWinControlFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwWinControlFromStackWord_

procedure _kwWinControlFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F212C680161_var*
//#UC END# *4F212C3A015A_4F212C680161_var*
begin
//#UC START# *4F212C3A015A_4F212C680161_impl*
 DoWinControl(aControl As TWinControl, aCtx);
//#UC END# *4F212C3A015A_4F212C680161_impl*
end;//_kwWinControlFromStackWord_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwWinControlFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwWinControlFromStackWord_imp_impl}
{$EndIf kwWinControlFromStackWord_imp}
