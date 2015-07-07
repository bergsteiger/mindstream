{$IfNDef vtStatusBarFromStack_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/vtStatusBarFromStack.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::vtStatusBarFromStack
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define vtStatusBarFromStack_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _vtStatusBarFromStack_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithStatusBar(aControl: TvtStatusBar;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_vtStatusBarFromStack_
{$IfEnd} //not NoScripts

{$Else vtStatusBarFromStack_imp}

{$IfNDef vtStatusBarFromStack_imp_impl}
{$Define vtStatusBarFromStack_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _vtStatusBarFromStack_

procedure _vtStatusBarFromStack_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_53F6F824023F_var*
//#UC END# *4F212C3A015A_53F6F824023F_var*
begin
//#UC START# *4F212C3A015A_53F6F824023F_impl*
 DoWithStatusBar(aControl as TvtStatusBar, aCtx);
//#UC END# *4F212C3A015A_53F6F824023F_impl*
end;//_vtStatusBarFromStack_.DoControl

{$IfEnd} //not NoScripts

{$Else  vtStatusBarFromStack_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf vtStatusBarFromStack_imp_impl}
{$EndIf vtStatusBarFromStack_imp}
