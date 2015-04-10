unit kwIMMEDIATE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIMMEDIATE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::IMMEDIATE
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
 TkwIMMEDIATE = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIMMEDIATE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIMMEDIATE;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwIMMEDIATE

function TkwIMMEDIATE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_53ECD7700055get_var*
//#UC END# *4DCACED80361_53ECD7700055get_var*
begin
//#UC START# *4DCACED80361_53ECD7700055get_impl*
 Result := tfw_wmImmediate;
//#UC END# *4DCACED80361_53ECD7700055get_impl*
end;//TkwIMMEDIATE.pm_GetModifier

class function TkwIMMEDIATE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IMMEDIATE';
end;//TkwIMMEDIATE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.