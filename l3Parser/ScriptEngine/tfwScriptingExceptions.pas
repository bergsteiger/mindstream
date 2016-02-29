unit tfwScriptingExceptions;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwScriptingExceptions.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: InternalInterfaces::Category Shared Delphi Low Level::ScriptEngine$Core::tfwScriptingExceptions
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  SysUtils
  ;

type
 EtfwException = class(Exception)
 end;//EtfwException

 EtfwCheckPrim = class(EtfwException)
 public
 // public methods
   class procedure IsTrue(aCondition: Boolean;
     const aMessage: AnsiString);
   class procedure Fail(const aMessage: AnsiString);
 end;//EtfwCheckPrim

 EtfwCheck = class(EtfwCheckPrim)
 end;//EtfwCheck
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
// start class EtfwCheckPrim

class procedure EtfwCheckPrim.IsTrue(aCondition: Boolean;
  const aMessage: AnsiString);
//#UC START# *54F8741B021E_54F873F5009A_var*
//#UC END# *54F8741B021E_54F873F5009A_var*
begin
//#UC START# *54F8741B021E_54F873F5009A_impl*
 if not aCondition then
  raise Self.Create(aMessage);
//#UC END# *54F8741B021E_54F873F5009A_impl*
end;//EtfwCheckPrim.IsTrue

class procedure EtfwCheckPrim.Fail(const aMessage: AnsiString);
//#UC START# *550C432A0223_54F873F5009A_var*
//#UC END# *550C432A0223_54F873F5009A_var*
begin
//#UC START# *550C432A0223_54F873F5009A_impl*
 IsTrue(false, aMessage);
//#UC END# *550C432A0223_54F873F5009A_impl*
end;//EtfwCheckPrim.Fail
{$IfEnd} //not NoScripts

end.