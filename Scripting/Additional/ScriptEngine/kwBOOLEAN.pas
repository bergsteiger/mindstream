unit kwBOOLEAN;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwBOOLEAN.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::BOOLEAN
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
 TkwBOOLEAN = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBOOLEAN
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwBOOLEAN;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwBOOLEAN

function TkwBOOLEAN.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3EF1430208get_var*
//#UC END# *4DCACED80361_4F3EF1430208get_var*
begin
//#UC START# *4DCACED80361_4F3EF1430208get_impl*
 Result := tfw_wmBool;
//#UC END# *4DCACED80361_4F3EF1430208get_impl*
end;//TkwBOOLEAN.pm_GetModifier

class function TkwBOOLEAN.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'BOOLEAN';
end;//TkwBOOLEAN.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.