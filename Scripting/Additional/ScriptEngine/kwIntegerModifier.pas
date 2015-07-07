unit kwIntegerModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIntegerModifier.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::IntegerModifier
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
 TkwIntegerModifier = class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIntegerModifier
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIntegerModifier;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwIntegerModifier

function TkwIntegerModifier.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F218BC30154get_var*
//#UC END# *4DCACED80361_4F218BC30154get_var*
begin
//#UC START# *4DCACED80361_4F218BC30154get_impl*
 Result := tfw_wmInt;
//#UC END# *4DCACED80361_4F218BC30154get_impl*
end;//TkwIntegerModifier.pm_GetModifier

class function TkwIntegerModifier.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'INTEGER';
end;//TkwIntegerModifier.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.