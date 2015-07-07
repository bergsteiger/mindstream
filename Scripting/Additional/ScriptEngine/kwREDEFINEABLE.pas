unit kwREDEFINEABLE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwREDEFINEABLE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ModifiersPack::REDEFINEABLE
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
 TkwREDEFINEABLE = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwREDEFINEABLE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwREDEFINEABLE;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwREDEFINEABLE

function TkwREDEFINEABLE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F44DC3E0343get_var*
//#UC END# *4DCACED80361_4F44DC3E0343get_var*
begin
//#UC START# *4DCACED80361_4F44DC3E0343get_impl*
 Result := tfw_wmRedefineable;
//#UC END# *4DCACED80361_4F44DC3E0343get_impl*
end;//TkwREDEFINEABLE.pm_GetModifier

class function TkwREDEFINEABLE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'REDEFINEABLE';
end;//TkwREDEFINEABLE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.