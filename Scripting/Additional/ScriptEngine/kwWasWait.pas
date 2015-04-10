unit kwWasWait;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWasWait.pas"
// Начат: 28.04.2011 15:11
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ModalDialogs::Was_Wait
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
  SysUtils,
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 EkwWaitBracketsBalance = class(Exception)
 end;//EkwWaitBracketsBalance

 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _afwImpurity_Parent_ = _tfwAutoregisteringWord_;
 {$Include ..\ScriptEngine\afwImpurity.imp.pas}
 TkwWasWait = class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWasWait
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  ,
  Controls
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWasWait;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{$Include ..\ScriptEngine\afwImpurity.imp.pas}

// start class TkwWasWait

procedure TkwWasWait.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB94B3103DB_var*
//#UC END# *4DAEEDE10285_4DB94B3103DB_var*
begin
//#UC START# *4DAEEDE10285_4DB94B3103DB_impl*
 {$If NOT defined(nsTest)}
 RunnerAssert(false, '', aCtx);
 {$Else}
 aCtx.rEngine.PushBool(g_WasWait > 0);
 Dec(g_WasWait);
 if (g_WasWait < 0) then
  raise EkwWaitBracketsBalance.Create('Ожидали диалоговое окно, но не появилось');
 //RunnerAssert(g_WasWait >= 0);
 {$IfEnd}
//#UC END# *4DAEEDE10285_4DB94B3103DB_impl*
end;//TkwWasWait.DoDoIt

class function TkwWasWait.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'waited:?';
end;//TkwWasWait.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.