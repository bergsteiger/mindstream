unit kwApplicationGetLastHint;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwApplicationGetLastHint.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::application_GetLastHint
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
 TkwApplicationGetLastHint = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwApplicationGetLastHint
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  vtHintManager,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwApplicationGetLastHint;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwApplicationGetLastHint

procedure TkwApplicationGetLastHint.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_50C72D690144_var*
//#UC END# *4DAEEDE10285_50C72D690144_var*
begin
//#UC START# *4DAEEDE10285_50C72D690144_impl*
 with TvtHintManager.Instance do
  if Count > 0
   then aCtx.rEngine.PushString(Item[Count - 1].LastHint)
   else aCtx.rEngine.PushString('');
//#UC END# *4DAEEDE10285_50C72D690144_impl*
end;//TkwApplicationGetLastHint.DoDoIt

class function TkwApplicationGetLastHint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'application:GetLastHint';
end;//TkwApplicationGetLastHint.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.