unit kwSUMMONED;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwSUMMONED.pas"
// Начат: 12.02.2012 16:32
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::SUMMONED
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
 TkwSUMMONED = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSUMMONED
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwSUMMONED

function TkwSUMMONED.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F37B16002C5get_var*
//#UC END# *4DCACED80361_4F37B16002C5get_var*
begin
//#UC START# *4DCACED80361_4F37B16002C5get_impl*
 Result := tfw_wmSummoned;
//#UC END# *4DCACED80361_4F37B16002C5get_impl*
end;//TkwSUMMONED.pm_GetModifier

class function TkwSUMMONED.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SUMMONED';
end;//TkwSUMMONED.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация SUMMONED
 TkwSUMMONED.RegisterInEngine;
{$IfEnd} //not NoScripts

end.