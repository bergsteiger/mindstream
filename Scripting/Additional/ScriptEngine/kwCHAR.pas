unit kwCHAR;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCHAR.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::CHAR
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
 TkwCHAR = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCHAR
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCHAR

function TkwCHAR.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F4FDD6900D6get_var*
//#UC END# *4DCACED80361_4F4FDD6900D6get_var*
begin
//#UC START# *4DCACED80361_4F4FDD6900D6get_impl*
 Result := tfw_wmChar;
//#UC END# *4DCACED80361_4F4FDD6900D6get_impl*
end;//TkwCHAR.pm_GetModifier

class function TkwCHAR.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CHAR';
end;//TkwCHAR.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CHAR
 TkwCHAR.RegisterInEngine;
{$IfEnd} //not NoScripts

end.