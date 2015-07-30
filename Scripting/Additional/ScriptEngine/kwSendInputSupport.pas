unit kwSendInputSupport;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSendInputSupport.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::MouseInput::TkwSendInputSupport
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Windows,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _kwSendInputSupportUses_Parent_ = TtfwRegisterableWord;
 {$Include ..\ScriptEngine\kwSendInputSupportUses.imp.pas}
 TkwSendInputSupport = {abstract} class(_kwSendInputSupportUses_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   function GetInputStruct(const aCtx: TtfwContext): TInput; virtual; abstract;
 end;//TkwSendInputSupport
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwSendInputSupportUses.imp.pas}

// start class TkwSendInputSupport

procedure TkwSendInputSupport.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F71A8080094_var*
var
 l_Input: TInput;
//#UC END# *4DAEEDE10285_4F71A8080094_var*
begin
//#UC START# *4DAEEDE10285_4F71A8080094_impl*
 l_Input := GetInputStruct(aCtx);
 SendInput(1, l_Input, SizeOf(TInput));
//#UC END# *4DAEEDE10285_4F71A8080094_impl*
end;//TkwSendInputSupport.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwSendInputSupport
 TkwSendInputSupport.RegisterClass;
{$IfEnd} //not NoScripts

end.