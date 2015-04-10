{$IfNDef kwSendInputSupport_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSendInputSupport.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::kwSendInputSupport
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwSendInputSupport_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _kwSendInputSupport_ = {mixin} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   function GetInputStruct(const aCtx: TtfwContext): TInput; virtual; abstract;
 end;//_kwSendInputSupport_
{$IfEnd} //not NoScripts

{$Else kwSendInputSupport_imp}

{$IfNDef kwSendInputSupport_imp_impl}
{$Define kwSendInputSupport_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _kwSendInputSupport_

procedure _kwSendInputSupport_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F71A8080094_var*
var
 l_Input: TInput;
//#UC END# *4DAEEDE10285_4F71A8080094_var*
begin
//#UC START# *4DAEEDE10285_4F71A8080094_impl*
 l_Input := GetInputStruct(aCtx);
 SendInput(1, l_Input, SizeOf(TInput));
//#UC END# *4DAEEDE10285_4F71A8080094_impl*
end;//_kwSendInputSupport_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  kwSendInputSupport_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwSendInputSupport_imp_impl}
{$EndIf kwSendInputSupport_imp}
