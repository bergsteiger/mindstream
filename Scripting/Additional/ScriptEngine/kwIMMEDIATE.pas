unit kwIMMEDIATE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwIMMEDIATE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::IMMEDIATE
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
 TkwIMMEDIATE = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIMMEDIATE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwIMMEDIATE

function TkwIMMEDIATE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_53ECD7700055get_var*
//#UC END# *4DCACED80361_53ECD7700055get_var*
begin
//#UC START# *4DCACED80361_53ECD7700055get_impl*
 Result := tfw_wmImmediate;
//#UC END# *4DCACED80361_53ECD7700055get_impl*
end;//TkwIMMEDIATE.pm_GetModifier

class function TkwIMMEDIATE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IMMEDIATE';
end;//TkwIMMEDIATE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация IMMEDIATE
 TkwIMMEDIATE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.