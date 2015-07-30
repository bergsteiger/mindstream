unit kwInterfaceModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwInterfaceModifier.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::InterfaceModifier
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
 TkwInterfaceModifier = {scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwInterfaceModifier
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwInterfaceModifier

function TkwInterfaceModifier.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F28097103AFget_var*
//#UC END# *4DCACED80361_4F28097103AFget_var*
begin
//#UC START# *4DCACED80361_4F28097103AFget_impl*
 Result := tfw_wmIntf;
//#UC END# *4DCACED80361_4F28097103AFget_impl*
end;//TkwInterfaceModifier.pm_GetModifier

class function TkwInterfaceModifier.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'INTERFACE';
end;//TkwInterfaceModifier.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация InterfaceModifier
 TkwInterfaceModifier.RegisterInEngine;
{$IfEnd} //not NoScripts

end.