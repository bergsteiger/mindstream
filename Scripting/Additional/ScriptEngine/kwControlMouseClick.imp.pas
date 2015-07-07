{$IfNDef kwControlMouseClick_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwControlMouseClick.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::kwControlMouseClick
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwControlMouseClick_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwControlMouseClick_ = {mixin} class(_kwControlFromStackWord_)
 private
 // private methods
   procedure DoClick(aTarget: TWinControl;
     X: Integer;
     Y: Integer); virtual; abstract;
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 end;//_kwControlMouseClick_
{$IfEnd} //not NoScripts

{$Else kwControlMouseClick_imp}

{$IfNDef kwControlMouseClick_imp_impl}
{$Define kwControlMouseClick_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwControlMouseClick_

procedure _kwControlMouseClick_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F8EC89C0219_var*
var
 l_X, l_Y: Integer;
//#UC END# *4F212C3A015A_4F8EC89C0219_var*
begin
//#UC START# *4F212C3A015A_4F8EC89C0219_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не заданы координаты для щелчка мышью!', aCtx);
 l_Y := aCtx.rEngine.PopInt;
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не заданы координаты для щелчка мышью!', aCtx);
 l_X := aCtx.rEngine.PopInt;
 DoClick(aControl as TWinControl, l_X, l_Y);
//#UC END# *4F212C3A015A_4F8EC89C0219_impl*
end;//_kwControlMouseClick_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwControlMouseClick_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwControlMouseClick_imp_impl}
{$EndIf kwControlMouseClick_imp}
