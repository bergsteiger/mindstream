unit kwLINK;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwLINK.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::LINK
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
 TkwLINK = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwLINK
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwLINK

function TkwLINK.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F44DC270242get_var*
//#UC END# *4DCACED80361_4F44DC270242get_var*
begin
//#UC START# *4DCACED80361_4F44DC270242get_impl*
 Result := tfw_wmLink;
//#UC END# *4DCACED80361_4F44DC270242get_impl*
end;//TkwLINK.pm_GetModifier

class function TkwLINK.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'LINK';
end;//TkwLINK.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация LINK
 TkwLINK.RegisterInEngine;
{$IfEnd} //not NoScripts

end.