{$IfNDef tfwDualStrWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwDualStrWord.imp.pas"
// Начат: 16.05.2011 11:18
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::tfwDualStrWord
//
// Поддержка работы с парами строк.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwDualStrWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
 _tfwDualStrWord_ = {abstract mixin} class(_tfwStrWord_)
  {* Поддержка работы с парами строк. }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // protected methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); virtual; abstract;
 end;//_tfwDualStrWord_
{$IfEnd} //not NoScripts

{$Else tfwDualStrWord_imp}

{$IfNDef tfwDualStrWord_imp_impl}
{$Define tfwDualStrWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwStrWord.imp.pas}

// start class _tfwDualStrWord_

procedure _tfwDualStrWord_.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4DD0CFBC012F_var*
//#UC END# *4DD0CF6F0197_4DD0CFBC012F_var*
begin
//#UC START# *4DD0CF6F0197_4DD0CFBC012F_impl*
 DoStrings(aCtx, aCtx.rEngine.PopString, aStr);
//#UC END# *4DD0CF6F0197_4DD0CFBC012F_impl*
end;//_tfwDualStrWord_.DoString

{$IfEnd} //not NoScripts

{$Else  tfwDualStrWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwDualStrWord_imp_impl}
{$EndIf tfwDualStrWord_imp}
