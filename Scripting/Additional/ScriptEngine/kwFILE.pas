unit kwFILE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFILE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ModifiersPack::FILE
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
 TkwFILE = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFILE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFILE

function TkwFILE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F4E4F4D0189get_var*
//#UC END# *4DCACED80361_4F4E4F4D0189get_var*
begin
//#UC START# *4DCACED80361_4F4E4F4D0189get_impl*
 Result := tfw_wmFile;
//#UC END# *4DCACED80361_4F4E4F4D0189get_impl*
end;//TkwFILE.pm_GetModifier

class function TkwFILE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FILE';
end;//TkwFILE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация FILE
 TkwFILE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.