{$IfNDef kwSpintEditFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSpintEditFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::kwSpintEditFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwSpintEditFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwSpintEditFromStackWord_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoSpinEdit(aControl: TvtSpinEdit;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwSpintEditFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwSpintEditFromStackWord_imp}

{$IfNDef kwSpintEditFromStackWord_imp_impl}
{$Define kwSpintEditFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwSpintEditFromStackWord_

procedure _kwSpintEditFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F609562002C_var*
//#UC END# *4F212C3A015A_4F609562002C_var*
begin
//#UC START# *4F212C3A015A_4F609562002C_impl*
 DoSpinEdit(aControl as TvtSpinEdit, aCtx);
//#UC END# *4F212C3A015A_4F609562002C_impl*
end;//_kwSpintEditFromStackWord_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwSpintEditFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwSpintEditFromStackWord_imp_impl}
{$EndIf kwSpintEditFromStackWord_imp}
