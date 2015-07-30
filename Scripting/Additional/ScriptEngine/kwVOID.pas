unit kwVOID;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwVOID.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::VOID
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
 TkwVOID = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVOID
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwVOID

function TkwVOID.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_52E913210085get_var*
//#UC END# *4DCACED80361_52E913210085get_var*
begin
//#UC START# *4DCACED80361_52E913210085get_impl*
 Result := tfw_wmVoid;
//#UC END# *4DCACED80361_52E913210085get_impl*
end;//TkwVOID.pm_GetModifier

class function TkwVOID.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'VOID';
end;//TkwVOID.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация VOID
 TkwVOID.RegisterInEngine;
{$IfEnd} //not NoScripts

end.