unit kwOVERRIDE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwOVERRIDE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::OVERRIDE
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
 TkwOVERRIDE = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwOVERRIDE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwOVERRIDE;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwOVERRIDE

function TkwOVERRIDE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3EF12200A1get_var*
//#UC END# *4DCACED80361_4F3EF12200A1get_var*
begin
//#UC START# *4DCACED80361_4F3EF12200A1get_impl*
 Result := tfw_wmOverride;
//#UC END# *4DCACED80361_4F3EF12200A1get_impl*
end;//TkwOVERRIDE.pm_GetModifier

class function TkwOVERRIDE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'OVERRIDE';
end;//TkwOVERRIDE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.