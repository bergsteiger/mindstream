unit kwRightWordRef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwRightWordRef.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ModifiersPack::RightWordRef
//
// Указатель на параметр права
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
 TkwRightWordRef = {final} class(_kwModifier_)
  {* Указатель на параметр права }
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwRightWordRef
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwRightWordRef;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwRightWordRef

function TkwRightWordRef.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_52E91E0201A9get_var*
//#UC END# *4DCACED80361_52E91E0201A9get_var*
begin
//#UC START# *4DCACED80361_52E91E0201A9get_impl*
 Result := tfw_wmRightWordRef;
//#UC END# *4DCACED80361_52E91E0201A9get_impl*
end;//TkwRightWordRef.pm_GetModifier

class function TkwRightWordRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '^';
end;//TkwRightWordRef.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.