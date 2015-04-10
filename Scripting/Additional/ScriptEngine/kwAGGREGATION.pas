unit kwAGGREGATION;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwAGGREGATION.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ModifiersPack::AGGREGATION
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
 TkwAGGREGATION = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwAGGREGATION
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwAGGREGATION;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwAGGREGATION

function TkwAGGREGATION.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F44DBE903E0get_var*
//#UC END# *4DCACED80361_4F44DBE903E0get_var*
begin
//#UC START# *4DCACED80361_4F44DBE903E0get_impl*
 Result := tfw_wmAggregation;
//#UC END# *4DCACED80361_4F44DBE903E0get_impl*
end;//TkwAGGREGATION.pm_GetModifier

class function TkwAGGREGATION.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'AGGREGATION';
end;//TkwAGGREGATION.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.