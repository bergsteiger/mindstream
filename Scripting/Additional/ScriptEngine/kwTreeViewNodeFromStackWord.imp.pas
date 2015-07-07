{$IfNDef kwTreeViewNodeFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeViewNodeFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::TreeViewWords::kwTreeViewNodeFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwTreeViewNodeFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwTreeViewNodeFromStackWord_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithTreeView(const aTreeView: TTreeView;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwTreeViewNodeFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwTreeViewNodeFromStackWord_imp}

{$IfNDef kwTreeViewNodeFromStackWord_imp_impl}
{$Define kwTreeViewNodeFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwTreeViewNodeFromStackWord_

procedure _kwTreeViewNodeFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_512F4794030D_var*
//#UC END# *4F212C3A015A_512F4794030D_var*
begin
//#UC START# *4F212C3A015A_512F4794030D_impl*
 DoWithTreeView(aControl as TTreeView, aCtx);
//#UC END# *4F212C3A015A_512F4794030D_impl*
end;//_kwTreeViewNodeFromStackWord_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwTreeViewNodeFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwTreeViewNodeFromStackWord_imp_impl}
{$EndIf kwTreeViewNodeFromStackWord_imp}
