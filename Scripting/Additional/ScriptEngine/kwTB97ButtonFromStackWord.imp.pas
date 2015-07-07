{$IfNDef kwTB97ButtonFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTB97ButtonFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::kwTB97ButtonFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwTB97ButtonFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwTB97ButtonFromStackWord_ = {abstract mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoButton(aButton: TCustomToolbarButton97;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwTB97ButtonFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwTB97ButtonFromStackWord_imp}

{$IfNDef kwTB97ButtonFromStackWord_imp_impl}
{$Define kwTB97ButtonFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwTB97ButtonFromStackWord_

procedure _kwTB97ButtonFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F69EFB6013D_var*
//#UC END# *4F212C3A015A_4F69EFB6013D_var*
begin
//#UC START# *4F212C3A015A_4F69EFB6013D_impl*
 DoButton(aControl As TCustomToolbarButton97, aCtx);
//#UC END# *4F212C3A015A_4F69EFB6013D_impl*
end;//_kwTB97ButtonFromStackWord_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwTB97ButtonFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwTB97ButtonFromStackWord_imp_impl}
{$EndIf kwTB97ButtonFromStackWord_imp}
