unit kwLeftWordRef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwLeftWordRef.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::LeftWordRef
//
// Указатель на параметр слева
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
 TkwLeftWordRef = {final scriptword} class(TkwModifier)
  {* Указатель на параметр слева }
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwLeftWordRef
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwLeftWordRef

function TkwLeftWordRef.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_53E35E6B0004get_var*
//#UC END# *4DCACED80361_53E35E6B0004get_var*
begin
//#UC START# *4DCACED80361_53E35E6B0004get_impl*
 Result := tfw_wmLeftWordRef;
//#UC END# *4DCACED80361_53E35E6B0004get_impl*
end;//TkwLeftWordRef.pm_GetModifier

class function TkwLeftWordRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '^@';
end;//TkwLeftWordRef.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация LeftWordRef
 TkwLeftWordRef.RegisterInEngine;
{$IfEnd} //not NoScripts

end.