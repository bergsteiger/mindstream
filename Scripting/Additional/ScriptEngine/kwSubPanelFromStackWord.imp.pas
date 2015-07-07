{$IfNDef kwSubPanelFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSubPanelFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::SubPanelWords::kwSubPanelFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwSubPanelFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwSubPanelFromStackWord_ = {final mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithSubPanel(aControl: TevCustomSubPanel;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwSubPanelFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwSubPanelFromStackWord_imp}

{$IfNDef kwSubPanelFromStackWord_imp_impl}
{$Define kwSubPanelFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwSubPanelFromStackWord_

procedure _kwSubPanelFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_52D646990049_var*
//#UC END# *4F212C3A015A_52D646990049_var*
begin
//#UC START# *4F212C3A015A_52D646990049_impl*
 DoWithSubPanel(aControl as TevCustomSubPanel, aCtx);
//#UC END# *4F212C3A015A_52D646990049_impl*
end;//_kwSubPanelFromStackWord_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwSubPanelFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwSubPanelFromStackWord_imp_impl}
{$EndIf kwSubPanelFromStackWord_imp}
