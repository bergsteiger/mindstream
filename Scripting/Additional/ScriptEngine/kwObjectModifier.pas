unit kwObjectModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwObjectModifier.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ObjectModifier
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
 TkwObjectModifier = class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwObjectModifier
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwObjectModifier;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwObjectModifier

function TkwObjectModifier.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F218C08010Dget_var*
//#UC END# *4DCACED80361_4F218C08010Dget_var*
begin
//#UC START# *4DCACED80361_4F218C08010Dget_impl*
 Result := tfw_wmObj;
//#UC END# *4DCACED80361_4F218C08010Dget_impl*
end;//TkwObjectModifier.pm_GetModifier

class function TkwObjectModifier.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'OBJECT';
end;//TkwObjectModifier.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.