unit kwApplicationIsHintVisible;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwApplicationIsHintVisible.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::application_IsHintVisible
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwApplicationIsHintVisible = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwApplicationIsHintVisible
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  vtHintManager,
  Windows,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwApplicationIsHintVisible;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwApplicationIsHintVisible

procedure TkwApplicationIsHintVisible.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_50C6334D0028_var*
//#UC END# *4DAEEDE10285_50C6334D0028_var*
begin
//#UC START# *4DAEEDE10285_50C6334D0028_impl*
 with TvtHintManager.Instance do
  aCtx.rEngine.PushBool((Count > 0) and IsWindowVisible(Item[Count - 1].Handle));
//#UC END# *4DAEEDE10285_50C6334D0028_impl*
end;//TkwApplicationIsHintVisible.DoDoIt

class function TkwApplicationIsHintVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'application:IsHintVisible';
end;//TkwApplicationIsHintVisible.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.