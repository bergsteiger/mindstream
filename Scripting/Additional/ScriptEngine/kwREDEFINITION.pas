unit kwREDEFINITION;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwREDEFINITION.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::REDEFINITION
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
 TkwREDEFINITION = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwREDEFINITION
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwREDEFINITION

function TkwREDEFINITION.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F41FF5D0246get_var*
//#UC END# *4DCACED80361_4F41FF5D0246get_var*
begin
//#UC START# *4DCACED80361_4F41FF5D0246get_impl*
 Result := tfw_wmRedefinition;
//#UC END# *4DCACED80361_4F41FF5D0246get_impl*
end;//TkwREDEFINITION.pm_GetModifier

class function TkwREDEFINITION.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'REDEFINITION';
end;//TkwREDEFINITION.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация REDEFINITION
 TkwREDEFINITION.RegisterInEngine;
{$IfEnd} //not NoScripts

end.