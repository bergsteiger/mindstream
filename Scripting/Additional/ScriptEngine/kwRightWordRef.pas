unit kwRightWordRef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwRightWordRef.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::RightWordRef
//
// Указатель на параметр права
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
 TkwRightWordRef = {final scriptword} class(TkwModifier)
  {* Указатель на параметр права }
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwRightWordRef
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwRightWordRef

function TkwRightWordRef.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_52E91E0201A9get_var*
//#UC END# *4DCACED80361_52E91E0201A9get_var*
begin
//#UC START# *4DCACED80361_52E91E0201A9get_impl*
 Result := tfw_wmRightWordRef;
//#UC END# *4DCACED80361_52E91E0201A9get_impl*
end;//TkwRightWordRef.pm_GetModifier

class function TkwRightWordRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '^';
end;//TkwRightWordRef.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация RightWordRef
 TkwRightWordRef.RegisterInEngine;
{$IfEnd} //not NoScripts

end.