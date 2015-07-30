unit kwObjectModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwObjectModifier.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ObjectModifier
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
 TkwObjectModifier = {scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwObjectModifier
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwObjectModifier

function TkwObjectModifier.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F218C08010Dget_var*
//#UC END# *4DCACED80361_4F218C08010Dget_var*
begin
//#UC START# *4DCACED80361_4F218C08010Dget_impl*
 Result := tfw_wmObj;
//#UC END# *4DCACED80361_4F218C08010Dget_impl*
end;//TkwObjectModifier.pm_GetModifier

class function TkwObjectModifier.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'OBJECT';
end;//TkwObjectModifier.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация ObjectModifier
 TkwObjectModifier.RegisterInEngine;
{$IfEnd} //not NoScripts

end.