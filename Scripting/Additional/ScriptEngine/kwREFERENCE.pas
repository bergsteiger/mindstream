unit kwREFERENCE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwREFERENCE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ModifiersPack::REFERENCE
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
 TkwREFERENCE = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwREFERENCE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwREFERENCE;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwREFERENCE

function TkwREFERENCE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F44DC1A00ECget_var*
//#UC END# *4DCACED80361_4F44DC1A00ECget_var*
begin
//#UC START# *4DCACED80361_4F44DC1A00ECget_impl*
 Result := tfw_wmReference;
//#UC END# *4DCACED80361_4F44DC1A00ECget_impl*
end;//TkwREFERENCE.pm_GetModifier

class function TkwREFERENCE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'REFERENCE';
end;//TkwREFERENCE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.