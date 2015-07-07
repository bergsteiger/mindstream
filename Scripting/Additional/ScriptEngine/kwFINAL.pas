unit kwFINAL;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFINAL.pas"
// Начат: 12.02.2012 16:32
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::FINAL
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
 TkwFINAL = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFINAL
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFINAL;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwFINAL

function TkwFINAL.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F37B140004Eget_var*
//#UC END# *4DCACED80361_4F37B140004Eget_var*
begin
//#UC START# *4DCACED80361_4F37B140004Eget_impl*
 Result := tfw_wmFinal;
//#UC END# *4DCACED80361_4F37B140004Eget_impl*
end;//TkwFINAL.pm_GetModifier

class function TkwFINAL.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FINAL';
end;//TkwFINAL.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.