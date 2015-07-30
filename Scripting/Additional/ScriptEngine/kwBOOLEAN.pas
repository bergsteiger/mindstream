unit kwBOOLEAN;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwBOOLEAN.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::BOOLEAN
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
 TkwBOOLEAN = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBOOLEAN
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwBOOLEAN

function TkwBOOLEAN.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3EF1430208get_var*
//#UC END# *4DCACED80361_4F3EF1430208get_var*
begin
//#UC START# *4DCACED80361_4F3EF1430208get_impl*
 Result := tfw_wmBool;
//#UC END# *4DCACED80361_4F3EF1430208get_impl*
end;//TkwBOOLEAN.pm_GetModifier

class function TkwBOOLEAN.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'BOOLEAN';
end;//TkwBOOLEAN.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация BOOLEAN
 TkwBOOLEAN.RegisterInEngine;
{$IfEnd} //not NoScripts

end.