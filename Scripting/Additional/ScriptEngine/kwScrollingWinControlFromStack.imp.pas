{$IfNDef kwScrollingWinControlFromStack_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwScrollingWinControlFromStack.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::kwScrollingWinControlFromStack
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwScrollingWinControlFromStack_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
 _kwScrollingWinControlFromStack_ = {mixin} class(_kwWinControlFromStackWord_)
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithScrollWinControl(aScrollWinControl: TScrollingWinControl;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwScrollingWinControlFromStack_
{$IfEnd} //not NoScripts

{$Else kwScrollingWinControlFromStack_imp}

{$IfNDef kwScrollingWinControlFromStack_imp_impl}
{$Define kwScrollingWinControlFromStack_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

// start class _kwScrollingWinControlFromStack_

procedure _kwScrollingWinControlFromStack_.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4FA25C910138_var*
//#UC END# *4F212C930149_4FA25C910138_var*
begin
//#UC START# *4F212C930149_4FA25C910138_impl*
 DoWithScrollWinControl(aControl as TScrollingWinControl, aCtx);
//#UC END# *4F212C930149_4FA25C910138_impl*
end;//_kwScrollingWinControlFromStack_.DoWinControl

{$IfEnd} //not NoScripts

{$Else  kwScrollingWinControlFromStack_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwScrollingWinControlFromStack_imp_impl}
{$EndIf kwScrollingWinControlFromStack_imp}
