unit kwREFERENCE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwREFERENCE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::REFERENCE
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
 TkwREFERENCE = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwREFERENCE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwREFERENCE

function TkwREFERENCE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F44DC1A00ECget_var*
//#UC END# *4DCACED80361_4F44DC1A00ECget_var*
begin
//#UC START# *4DCACED80361_4F44DC1A00ECget_impl*
 Result := tfw_wmReference;
//#UC END# *4DCACED80361_4F44DC1A00ECget_impl*
end;//TkwREFERENCE.pm_GetModifier

class function TkwREFERENCE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'REFERENCE';
end;//TkwREFERENCE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация REFERENCE
 TkwREFERENCE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.