unit kwVIRTUAL;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwVIRTUAL.pas"
// Начат: 11.06.2012 18:36
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::VIRTUAL
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
 TkwVIRTUAL = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVIRTUAL
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwVIRTUAL

function TkwVIRTUAL.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F367CE603BDget_var*
//#UC END# *4DCACED80361_4F367CE603BDget_var*
begin
//#UC START# *4DCACED80361_4F367CE603BDget_impl*
 Result := tfw_wmVirtual;
//#UC END# *4DCACED80361_4F367CE603BDget_impl*
end;//TkwVIRTUAL.pm_GetModifier

class function TkwVIRTUAL.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'VIRTUAL';
end;//TkwVIRTUAL.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация VIRTUAL
 TkwVIRTUAL.RegisterInEngine;
{$IfEnd} //not NoScripts

end.