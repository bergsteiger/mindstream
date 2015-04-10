unit kwPROTECTED;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPROTECTED.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::PROTECTED
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
 TkwPROTECTED = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPROTECTED
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPROTECTED;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwPROTECTED

function TkwPROTECTED.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3D1517023Eget_var*
//#UC END# *4DCACED80361_4F3D1517023Eget_var*
begin
//#UC START# *4DCACED80361_4F3D1517023Eget_impl*
 Result := tfw_wmProtected;
//#UC END# *4DCACED80361_4F3D1517023Eget_impl*
end;//TkwPROTECTED.pm_GetModifier

class function TkwPROTECTED.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'PROTECTED';
end;//TkwPROTECTED.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.