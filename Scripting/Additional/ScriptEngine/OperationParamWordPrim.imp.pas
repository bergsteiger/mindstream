{$IfNDef OperationParamWordPrim_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/OperationParamWordPrim.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::OperationParamWordPrim
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define OperationParamWordPrim_imp}
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _OperationParamWordPrim_ = {mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoParams(const aParams: IvcmTestParams;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_OperationParamWordPrim_
{$IfEnd} //not NoScripts AND not NoVCM

{$Else OperationParamWordPrim_imp}

{$IfNDef OperationParamWordPrim_imp_impl}
{$Define OperationParamWordPrim_imp_impl}

{$If not defined(NoScripts) AND not defined(NoVCM)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _OperationParamWordPrim_

procedure _OperationParamWordPrim_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5230182A02A3_var*
var
 l_Params : IvcmTestParams;
//#UC END# *4DAEEDE10285_5230182A02A3_var*
begin
//#UC START# *4DAEEDE10285_5230182A02A3_impl*
 l_Params := IvcmTestParams(aCtx.rEngine.PopIntf(IvcmTestParams));
 DoParams(l_Params, aCtx);
//#UC END# *4DAEEDE10285_5230182A02A3_impl*
end;//_OperationParamWordPrim_.DoDoIt

{$IfEnd} //not NoScripts AND not NoVCM

{$Else  OperationParamWordPrim_imp_impl}
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

{$EndIf OperationParamWordPrim_imp_impl}
{$EndIf OperationParamWordPrim_imp}
