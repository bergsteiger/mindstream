unit kwOVERRIDE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwOVERRIDE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::OVERRIDE
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
 TkwOVERRIDE = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwOVERRIDE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwOVERRIDE

function TkwOVERRIDE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3EF12200A1get_var*
//#UC END# *4DCACED80361_4F3EF12200A1get_var*
begin
//#UC START# *4DCACED80361_4F3EF12200A1get_impl*
 Result := tfw_wmOverride;
//#UC END# *4DCACED80361_4F3EF12200A1get_impl*
end;//TkwOVERRIDE.pm_GetModifier

class function TkwOVERRIDE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'OVERRIDE';
end;//TkwOVERRIDE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация OVERRIDE
 TkwOVERRIDE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.