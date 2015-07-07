unit kwInterfaceModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwInterfaceModifier.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::InterfaceModifier
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
 TkwInterfaceModifier = class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwInterfaceModifier
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwInterfaceModifier;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwInterfaceModifier

function TkwInterfaceModifier.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F28097103AFget_var*
//#UC END# *4DCACED80361_4F28097103AFget_var*
begin
//#UC START# *4DCACED80361_4F28097103AFget_impl*
 Result := tfw_wmIntf;
//#UC END# *4DCACED80361_4F28097103AFget_impl*
end;//TkwInterfaceModifier.pm_GetModifier

class function TkwInterfaceModifier.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'INTERFACE';
end;//TkwInterfaceModifier.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.