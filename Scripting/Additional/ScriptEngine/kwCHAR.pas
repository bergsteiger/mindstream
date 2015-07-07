unit kwCHAR;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCHAR.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ModifiersPack::CHAR
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
 TkwCHAR = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCHAR
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCHAR;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwCHAR

function TkwCHAR.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F4FDD6900D6get_var*
//#UC END# *4DCACED80361_4F4FDD6900D6get_var*
begin
//#UC START# *4DCACED80361_4F4FDD6900D6get_impl*
 Result := tfw_wmChar;
//#UC END# *4DCACED80361_4F4FDD6900D6get_impl*
end;//TkwCHAR.pm_GetModifier

class function TkwCHAR.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CHAR';
end;//TkwCHAR.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.