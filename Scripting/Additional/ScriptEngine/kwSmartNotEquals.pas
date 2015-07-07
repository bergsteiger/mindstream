unit kwSmartNotEquals;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSmartNotEquals.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ExtendedPrimitives::ExtendedPrimitivesPack::SmartNotEquals
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
 {$Include ..\ScriptEngine\tfwTwoValuesWord.imp.pas}
 TkwSmartNotEquals = {final} class(_tfwTwoValuesWord_)
 protected
 // realized methods
   procedure DoValues(const aV1: TtfwStackValue;
     const aV2: TtfwStackValue;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSmartNotEquals
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwSmartEquals,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSmartNotEquals;

{$Include ..\ScriptEngine\tfwTwoValuesWord.imp.pas}

// start class TkwSmartNotEquals

procedure TkwSmartNotEquals.DoValues(const aV1: TtfwStackValue;
  const aV2: TtfwStackValue;
  const aCtx: TtfwContext);
//#UC START# *4F51EEF0010D_4F51EBC200FA_var*
//#UC END# *4F51EEF0010D_4F51EBC200FA_var*
begin
//#UC START# *4F51EEF0010D_4F51EBC200FA_impl*
 aCtx.rEngine.PushBool(not TkwSmartEquals.CompareValues(aV1, aV2, aCtx));
//#UC END# *4F51EEF0010D_4F51EBC200FA_impl*
end;//TkwSmartNotEquals.DoValues

class function TkwSmartNotEquals.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '?!=';
end;//TkwSmartNotEquals.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwTwoValuesWord.imp.pas}
{$IfEnd} //not NoScripts

end.