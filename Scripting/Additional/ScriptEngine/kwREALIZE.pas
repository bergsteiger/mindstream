unit kwREALIZE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwREALIZE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::REALIZE
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
 TkwREALIZE = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwREALIZE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwREALIZE

function TkwREALIZE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3EF1570018get_var*
//#UC END# *4DCACED80361_4F3EF1570018get_var*
begin
//#UC START# *4DCACED80361_4F3EF1570018get_impl*
 Result := tfw_wmRealize;
//#UC END# *4DCACED80361_4F3EF1570018get_impl*
end;//TkwREALIZE.pm_GetModifier

class function TkwREALIZE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'REALIZE';
end;//TkwREALIZE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация REALIZE
 TkwREALIZE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.