unit kwSEALED;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSEALED.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::SEALED
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
 TkwSEALED = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSEALED
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwSEALED

function TkwSEALED.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F44DC7A01C9get_var*
//#UC END# *4DCACED80361_4F44DC7A01C9get_var*
begin
//#UC START# *4DCACED80361_4F44DC7A01C9get_impl*
 Result := tfw_wmSealed;
//#UC END# *4DCACED80361_4F44DC7A01C9get_impl*
end;//TkwSEALED.pm_GetModifier

class function TkwSEALED.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SEALED';
end;//TkwSEALED.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация SEALED
 TkwSEALED.RegisterInEngine;
{$IfEnd} //not NoScripts

end.