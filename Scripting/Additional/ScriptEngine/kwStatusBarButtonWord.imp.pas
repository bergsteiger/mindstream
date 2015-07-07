{$IfNDef kwStatusBarButtonWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStatusBarButtonWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::StatusBarWords::kwStatusBarButtonWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwStatusBarButtonWord_imp}
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwStatusBarButtonWord_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoButton(aControl: TnscStatusBarButton;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwStatusBarButtonWord_
{$IfEnd} //Nemesis AND not NoScripts

{$Else kwStatusBarButtonWord_imp}

{$IfNDef kwStatusBarButtonWord_imp_impl}
{$Define kwStatusBarButtonWord_imp_impl}

{$If defined(Nemesis) AND not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwStatusBarButtonWord_

procedure _kwStatusBarButtonWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_512665AD02CB_var*
//#UC END# *4F212C3A015A_512665AD02CB_var*
begin
//#UC START# *4F212C3A015A_512665AD02CB_impl*
 RunnerAssert(aControl is TnscStatusBarButton, 'Это не кнопка статусбара.', aCtx);
 DoButton(aControl as TnscStatusBarButton, aCtx);
//#UC END# *4F212C3A015A_512665AD02CB_impl*
end;//_kwStatusBarButtonWord_.DoControl

{$IfEnd} //Nemesis AND not NoScripts

{$Else  kwStatusBarButtonWord_imp_impl}
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

{$EndIf kwStatusBarButtonWord_imp_impl}
{$EndIf kwStatusBarButtonWord_imp}
