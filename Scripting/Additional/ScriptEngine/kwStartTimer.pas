unit kwStartTimer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwStartTimer.pas"
// Начат: 16.01.2012 21:12
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::StartTimer
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
 TkwStartTimer = {scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStartTimer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwStartTimer

procedure TkwStartTimer.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F145A7102A5_var*
//#UC END# *4DAEEDE10285_4F145A7102A5_var*
begin
//#UC START# *4DAEEDE10285_4F145A7102A5_impl*
 aCtx.rCaller.StartTimer;
//#UC END# *4DAEEDE10285_4F145A7102A5_impl*
end;//TkwStartTimer.DoDoIt

class function TkwStartTimer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StartTimer';
end;//TkwStartTimer.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StartTimer
 TkwStartTimer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.