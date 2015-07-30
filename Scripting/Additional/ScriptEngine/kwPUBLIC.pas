unit kwPUBLIC;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwPUBLIC.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::PUBLIC
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
 TkwPUBLIC = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPUBLIC
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPUBLIC

function TkwPUBLIC.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3D153201ADget_var*
//#UC END# *4DCACED80361_4F3D153201ADget_var*
begin
//#UC START# *4DCACED80361_4F3D153201ADget_impl*
 Result := tfw_wmPublic;
//#UC END# *4DCACED80361_4F3D153201ADget_impl*
end;//TkwPUBLIC.pm_GetModifier

class function TkwPUBLIC.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'PUBLIC';
end;//TkwPUBLIC.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация PUBLIC
 TkwPUBLIC.RegisterInEngine;
{$IfEnd} //not NoScripts

end.