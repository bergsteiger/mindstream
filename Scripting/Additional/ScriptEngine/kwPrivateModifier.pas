unit kwPrivateModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPrivateModifier.pas"
// Начат: 11.05.2011 22:28
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::PrivateModifier
//
// PRIVATE
// Модификатор для создания приватных полей и методов в объявляемом классе.
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
 TkwPrivateModifier = class(_kwModifier_)
  {* PRIVATE
Модификатор для создания приватных полей и методов в объявляемом классе. }
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPrivateModifier
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPrivateModifier;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwPrivateModifier

function TkwPrivateModifier.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4DCAD530021Bget_var*
//#UC END# *4DCACED80361_4DCAD530021Bget_var*
begin
//#UC START# *4DCACED80361_4DCAD530021Bget_impl*
 Result := tfw_wmPrivate;
//#UC END# *4DCACED80361_4DCAD530021Bget_impl*
end;//TkwPrivateModifier.pm_GetModifier

class function TkwPrivateModifier.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'PRIVATE';
end;//TkwPrivateModifier.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.