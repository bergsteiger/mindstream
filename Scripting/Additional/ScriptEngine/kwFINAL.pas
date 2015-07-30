unit kwFINAL;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwFINAL.pas"
// Начат: 12.02.2012 16:32
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::FINAL
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
 TkwFINAL = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFINAL
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFINAL

function TkwFINAL.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F37B140004Eget_var*
//#UC END# *4DCACED80361_4F37B140004Eget_var*
begin
//#UC START# *4DCACED80361_4F37B140004Eget_impl*
 Result := tfw_wmFinal;
//#UC END# *4DCACED80361_4F37B140004Eget_impl*
end;//TkwFINAL.pm_GetModifier

class function TkwFINAL.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FINAL';
end;//TkwFINAL.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация FINAL
 TkwFINAL.RegisterInEngine;
{$IfEnd} //not NoScripts

end.