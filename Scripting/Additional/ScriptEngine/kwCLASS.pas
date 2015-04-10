unit kwCLASS;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCLASS.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::CLASS
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
 TkwCLASS = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCLASS
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCLASS;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwCLASS

function TkwCLASS.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_508530370210get_var*
//#UC END# *4DCACED80361_508530370210get_var*
begin
//#UC START# *4DCACED80361_508530370210get_impl*
 Result := tfw_wmClass;
//#UC END# *4DCACED80361_508530370210get_impl*
end;//TkwCLASS.pm_GetModifier

class function TkwCLASS.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CLASS';
end;//TkwCLASS.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.