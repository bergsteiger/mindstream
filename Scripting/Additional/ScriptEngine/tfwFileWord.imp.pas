{$IfNDef tfwFileWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwFileWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::tfwFileWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwFileWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _tfwFileWord_ = {abstract mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_tfwFileWord_
{$IfEnd} //not NoScripts

{$Else tfwFileWord_imp}

{$IfNDef tfwFileWord_imp_impl}
{$Define tfwFileWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _tfwFileWord_

procedure _tfwFileWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F5084B60237_var*
//#UC END# *4DAEEDE10285_4F5084B60237_var*
begin
//#UC START# *4DAEEDE10285_4F5084B60237_impl*
 DoFile(aCtx.rEngine.PopFile, aCtx);
//#UC END# *4DAEEDE10285_4F5084B60237_impl*
end;//_tfwFileWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  tfwFileWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwFileWord_imp_impl}
{$EndIf tfwFileWord_imp}
