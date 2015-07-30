unit kwAGGREGATION;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwAGGREGATION.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::AGGREGATION
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
 TkwAGGREGATION = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwAGGREGATION
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwAGGREGATION

function TkwAGGREGATION.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F44DBE903E0get_var*
//#UC END# *4DCACED80361_4F44DBE903E0get_var*
begin
//#UC START# *4DCACED80361_4F44DBE903E0get_impl*
 Result := tfw_wmAggregation;
//#UC END# *4DCACED80361_4F44DBE903E0get_impl*
end;//TkwAGGREGATION.pm_GetModifier

class function TkwAGGREGATION.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'AGGREGATION';
end;//TkwAGGREGATION.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация AGGREGATION
 TkwAGGREGATION.RegisterInEngine;
{$IfEnd} //not NoScripts

end.