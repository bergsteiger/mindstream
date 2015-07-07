{$IfNDef kwCustomFormFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCustomFormFromStackWord.imp.pas"
// Начат: 02.02.2012 14:47
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::FormsProcessing::kwCustomFormFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwCustomFormFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
 _kwCustomFormFromStackWord_ = {abstract mixin} class(_kwWinControlFromStackWord_)
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoCustomForm(aForm: TCustomForm;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwCustomFormFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwCustomFormFromStackWord_imp}

{$IfNDef kwCustomFormFromStackWord_imp_impl}
{$Define kwCustomFormFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

type
  TCustomFormHack = {abstract} class(TCustomForm)
  end;//TCustomFormHack

// start class _kwCustomFormFromStackWord_

procedure _kwCustomFormFromStackWord_.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4F2A69AA03AE_var*
//#UC END# *4F212C930149_4F2A69AA03AE_var*
begin
//#UC START# *4F212C930149_4F2A69AA03AE_impl*
 DoCustomForm(aControl As TCustomForm, aCtx);
//#UC END# *4F212C930149_4F2A69AA03AE_impl*
end;//_kwCustomFormFromStackWord_.DoWinControl

{$IfEnd} //not NoScripts

{$Else  kwCustomFormFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwCustomFormFromStackWord_imp_impl}
{$EndIf kwCustomFormFromStackWord_imp}
