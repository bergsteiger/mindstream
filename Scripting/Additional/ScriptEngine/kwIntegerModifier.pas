unit kwIntegerModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwIntegerModifier.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::IntegerModifier
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
 TkwIntegerModifier = {scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIntegerModifier
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwIntegerModifier

function TkwIntegerModifier.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F218BC30154get_var*
//#UC END# *4DCACED80361_4F218BC30154get_var*
begin
//#UC START# *4DCACED80361_4F218BC30154get_impl*
 Result := tfw_wmInt;
//#UC END# *4DCACED80361_4F218BC30154get_impl*
end;//TkwIntegerModifier.pm_GetModifier

class function TkwIntegerModifier.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'INTEGER';
end;//TkwIntegerModifier.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация IntegerModifier
 TkwIntegerModifier.RegisterInEngine;
{$IfEnd} //not NoScripts

end.