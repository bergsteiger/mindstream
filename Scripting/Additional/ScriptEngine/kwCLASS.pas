unit kwCLASS;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCLASS.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::CLASS
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwModifier,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCLASS = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCLASS
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCLASS

function TkwCLASS.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_508530370210get_var*
//#UC END# *4DCACED80361_508530370210get_var*
begin
//#UC START# *4DCACED80361_508530370210get_impl*
 Result := tfw_wmClass;
//#UC END# *4DCACED80361_508530370210get_impl*
end;//TkwCLASS.pm_GetModifier

class function TkwCLASS.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CLASS';
end;//TkwCLASS.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CLASS
 TkwCLASS.RegisterInEngine;
{$IfEnd} //not NoScripts

end.