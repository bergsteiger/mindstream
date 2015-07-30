unit kwWasWait;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwWasWait.pas"
// Начат: 28.04.2011 15:11
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::ModalDialogs::Was_Wait
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

 _afwImpurity_Parent_ = TtfwRegisterableWord;
 {$Include ..\ScriptEngine\afwImpurity.imp.pas}
 TkwWasWait = {scriptword} class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWasWait
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Classes
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  ,
  Controls
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\afwImpurity.imp.pas}

// start class TkwWasWait

procedure TkwWasWait.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB94B3103DB_var*
//#UC END# *4DAEEDE10285_4DB94B3103DB_var*
begin
//#UC START# *4DAEEDE10285_4DB94B3103DB_impl*
 {$If NOT defined(nsTest)}
 RunnerError('', aCtx);
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
// Регистрация Was_Wait
 TkwWasWait.RegisterInEngine;
{$IfEnd} //not NoScripts

end.