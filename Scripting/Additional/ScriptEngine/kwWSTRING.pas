unit kwWSTRING;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWSTRING.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::WSTRING
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
 TkwWSTRING = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWSTRING
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwWSTRING

function TkwWSTRING.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F4FE0C4031Bget_var*
//#UC END# *4DCACED80361_4F4FE0C4031Bget_var*
begin
//#UC START# *4DCACED80361_4F4FE0C4031Bget_impl*
 Result := tfw_wmWStr;
//#UC END# *4DCACED80361_4F4FE0C4031Bget_impl*
end;//TkwWSTRING.pm_GetModifier

class function TkwWSTRING.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'W-STRING';
end;//TkwWSTRING.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WSTRING
 TkwWSTRING.RegisterInEngine;
{$IfEnd} //not NoScripts

end.