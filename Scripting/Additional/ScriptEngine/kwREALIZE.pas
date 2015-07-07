unit kwREALIZE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwREALIZE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::REALIZE
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
 TkwREALIZE = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwREALIZE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwREALIZE;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwREALIZE

function TkwREALIZE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3EF1570018get_var*
//#UC END# *4DCACED80361_4F3EF1570018get_var*
begin
//#UC START# *4DCACED80361_4F3EF1570018get_impl*
 Result := tfw_wmRealize;
//#UC END# *4DCACED80361_4F3EF1570018get_impl*
end;//TkwREALIZE.pm_GetModifier

class function TkwREALIZE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'REALIZE';
end;//TkwREALIZE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.