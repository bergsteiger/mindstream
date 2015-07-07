unit kwLeftWordRef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwLeftWordRef.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ModifiersPack::LeftWordRef
//
// Указатель на параметр слева
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
 TkwLeftWordRef = {final} class(_kwModifier_)
  {* Указатель на параметр слева }
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwLeftWordRef
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwLeftWordRef;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwLeftWordRef

function TkwLeftWordRef.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_53E35E6B0004get_var*
//#UC END# *4DCACED80361_53E35E6B0004get_var*
begin
//#UC START# *4DCACED80361_53E35E6B0004get_impl*
 Result := tfw_wmLeftWordRef;
//#UC END# *4DCACED80361_53E35E6B0004get_impl*
end;//TkwLeftWordRef.pm_GetModifier

class function TkwLeftWordRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '^@';
end;//TkwLeftWordRef.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.