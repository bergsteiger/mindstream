unit kwREDEFINEABLE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwREDEFINEABLE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::REDEFINEABLE
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
 TkwREDEFINEABLE = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwREDEFINEABLE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwREDEFINEABLE

function TkwREDEFINEABLE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F44DC3E0343get_var*
//#UC END# *4DCACED80361_4F44DC3E0343get_var*
begin
//#UC START# *4DCACED80361_4F44DC3E0343get_impl*
 Result := tfw_wmRedefineable;
//#UC END# *4DCACED80361_4F44DC3E0343get_impl*
end;//TkwREDEFINEABLE.pm_GetModifier

class function TkwREDEFINEABLE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'REDEFINEABLE';
end;//TkwREDEFINEABLE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация REDEFINEABLE
 TkwREDEFINEABLE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.