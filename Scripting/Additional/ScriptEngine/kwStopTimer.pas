unit kwStopTimer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwStopTimer.pas"
// Начат: 16.01.2012 21:13
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::StopTimer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 TkwStopTimer = {scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStopTimer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwStopTimer

procedure TkwStopTimer.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F145AAC03CB_var*
var
 l_S : AnsiString;
//#UC END# *4DAEEDE10285_4F145AAC03CB_var*
begin
//#UC START# *4DAEEDE10285_4F145AAC03CB_impl*
 l_S := aCtx.rEngine.PopDelphiString;
 aCtx.rEngine.PushInt(aCtx.rCaller.StopTimer(l_S));
//#UC END# *4DAEEDE10285_4F145AAC03CB_impl*
end;//TkwStopTimer.DoDoIt

class function TkwStopTimer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StopTimer';
end;//TkwStopTimer.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StopTimer
 TkwStopTimer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.