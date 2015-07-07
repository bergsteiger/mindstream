{$IfNDef tfwTripleStrWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwTripleStrWord.imp.pas"
// Начат: 01.12.2011 18:57
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::tfwTripleStrWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwTripleStrWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
 _tfwTripleStrWord_ = {abstract mixin} class(_tfwDualStrWord_)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // protected methods
   procedure DoTriple(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString;
     const aStr3: Il3CString); virtual; abstract;
 end;//_tfwTripleStrWord_
{$IfEnd} //not NoScripts

{$Else tfwTripleStrWord_imp}

{$IfNDef tfwTripleStrWord_imp_impl}
{$Define tfwTripleStrWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}

// start class _tfwTripleStrWord_

procedure _tfwTripleStrWord_.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4ED795C300AC_var*
//#UC END# *4DD0D021034C_4ED795C300AC_var*
begin
//#UC START# *4DD0D021034C_4ED795C300AC_impl*
 DoTriple(aCtx, aCtx.rEngine.PopString, aStr1, aStr2);
//#UC END# *4DD0D021034C_4ED795C300AC_impl*
end;//_tfwTripleStrWord_.DoStrings

{$IfEnd} //not NoScripts

{$Else  tfwTripleStrWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwTripleStrWord_imp_impl}
{$EndIf tfwTripleStrWord_imp}
