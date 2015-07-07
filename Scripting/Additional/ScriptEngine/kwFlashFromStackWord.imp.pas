{$IfNDef kwFlashFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFlashFromStackWord.imp.pas"
// Начат: 21.10.2011 19:30
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::kwFlashFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwFlashFromStackWord_imp}
{$If not defined(NoFlash) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwFlashFromStackWord_ = {abstract mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoFlash(aControl: TvtShockwaveFlashEx;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwFlashFromStackWord_
{$IfEnd} //not NoFlash AND not NoScripts

{$Else kwFlashFromStackWord_imp}

{$IfNDef kwFlashFromStackWord_imp_impl}
{$Define kwFlashFromStackWord_imp_impl}

{$If not defined(NoFlash) AND not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwFlashFromStackWord_

procedure _kwFlashFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4EA1900500E4_var*
//#UC END# *4F212C3A015A_4EA1900500E4_var*
begin
//#UC START# *4F212C3A015A_4EA1900500E4_impl*
 DoFlash(aControl As TvtShockwaveFlashEx, aCtx);
//#UC END# *4F212C3A015A_4EA1900500E4_impl*
end;//_kwFlashFromStackWord_.DoControl

{$IfEnd} //not NoFlash AND not NoScripts

{$Else  kwFlashFromStackWord_imp_impl}
{$If not defined(NoFlash) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoFlash AND not NoScripts

{$EndIf kwFlashFromStackWord_imp_impl}
{$EndIf kwFlashFromStackWord_imp}
