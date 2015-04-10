unit kwPUBLIC;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPUBLIC.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::PUBLIC
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
 TkwPUBLIC = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPUBLIC
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPUBLIC;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwPUBLIC

function TkwPUBLIC.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3D153201ADget_var*
//#UC END# *4DCACED80361_4F3D153201ADget_var*
begin
//#UC START# *4DCACED80361_4F3D153201ADget_impl*
 Result := tfw_wmPublic;
//#UC END# *4DCACED80361_4F3D153201ADget_impl*
end;//TkwPUBLIC.pm_GetModifier

class function TkwPUBLIC.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'PUBLIC';
end;//TkwPUBLIC.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.