{$IfNDef kwStatusBarFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStatusBarFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::StatusBarWords::kwStatusBarFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwStatusBarFromStackWord_imp}
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwStatusBarFromStackWord_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoStatusBar(aControl: TnscStatusBar;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwStatusBarFromStackWord_
{$IfEnd} //Nemesis AND not NoScripts

{$Else kwStatusBarFromStackWord_imp}

{$IfNDef kwStatusBarFromStackWord_imp_impl}
{$Define kwStatusBarFromStackWord_imp_impl}

{$If defined(Nemesis) AND not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwStatusBarFromStackWord_

procedure _kwStatusBarFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_505C84DD0398_var*
//#UC END# *4F212C3A015A_505C84DD0398_var*
begin
//#UC START# *4F212C3A015A_505C84DD0398_impl*
 RunnerAssert(aControl is TnscStatusBar, 'На входе должен быть TnscStatusBar, а у меня - ' + aControl.ClassName, aCtx);
 DoStatusBar(aControl as TnscStatusBar, aCtx);
//#UC END# *4F212C3A015A_505C84DD0398_impl*
end;//_kwStatusBarFromStackWord_.DoControl

{$IfEnd} //Nemesis AND not NoScripts

{$Else  kwStatusBarFromStackWord_imp_impl}
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

{$EndIf kwStatusBarFromStackWord_imp_impl}
{$EndIf kwStatusBarFromStackWord_imp}
