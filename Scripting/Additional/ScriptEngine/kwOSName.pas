unit kwOSName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwOSName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::OSName
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwOSName = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwOSName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  JclSysInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwOSName

procedure TkwOSName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_51AF57470154_var*
//#UC END# *4DAEEDE10285_51AF57470154_var*
begin
//#UC START# *4DAEEDE10285_51AF57470154_impl*
 aCtx.rEngine.PushString(GetWindowsVersionString);
//#UC END# *4DAEEDE10285_51AF57470154_impl*
end;//TkwOSName.DoDoIt

class function TkwOSName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'OSName';
end;//TkwOSName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация OSName
 TkwOSName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.