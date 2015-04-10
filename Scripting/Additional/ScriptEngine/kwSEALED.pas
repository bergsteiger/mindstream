unit kwSEALED;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSEALED.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ModifiersPack::SEALED
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
 TkwSEALED = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSEALED
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSEALED;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwSEALED

function TkwSEALED.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F44DC7A01C9get_var*
//#UC END# *4DCACED80361_4F44DC7A01C9get_var*
begin
//#UC START# *4DCACED80361_4F44DC7A01C9get_impl*
 Result := tfw_wmSealed;
//#UC END# *4DCACED80361_4F44DC7A01C9get_impl*
end;//TkwSEALED.pm_GetModifier

class function TkwSEALED.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SEALED';
end;//TkwSEALED.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.