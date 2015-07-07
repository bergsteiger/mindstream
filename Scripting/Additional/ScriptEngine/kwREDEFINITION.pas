unit kwREDEFINITION;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwREDEFINITION.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::REDEFINITION
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
 TkwREDEFINITION = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwREDEFINITION
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwREDEFINITION;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwREDEFINITION

function TkwREDEFINITION.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F41FF5D0246get_var*
//#UC END# *4DCACED80361_4F41FF5D0246get_var*
begin
//#UC START# *4DCACED80361_4F41FF5D0246get_impl*
 Result := tfw_wmRedefinition;
//#UC END# *4DCACED80361_4F41FF5D0246get_impl*
end;//TkwREDEFINITION.pm_GetModifier

class function TkwREDEFINITION.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'REDEFINITION';
end;//TkwREDEFINITION.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.