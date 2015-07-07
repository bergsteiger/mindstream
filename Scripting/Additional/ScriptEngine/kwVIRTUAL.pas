unit kwVIRTUAL;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVIRTUAL.pas"
// Начат: 11.06.2012 18:36
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::VIRTUAL
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
 TkwVIRTUAL = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVIRTUAL
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwVIRTUAL;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwVIRTUAL

function TkwVIRTUAL.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F367CE603BDget_var*
//#UC END# *4DCACED80361_4F367CE603BDget_var*
begin
//#UC START# *4DCACED80361_4F367CE603BDget_impl*
 Result := tfw_wmVirtual;
//#UC END# *4DCACED80361_4F367CE603BDget_impl*
end;//TkwVIRTUAL.pm_GetModifier

class function TkwVIRTUAL.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'VIRTUAL';
end;//TkwVIRTUAL.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.