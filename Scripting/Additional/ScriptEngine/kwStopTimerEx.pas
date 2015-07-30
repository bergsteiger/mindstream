unit kwStopTimerEx;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwStopTimerEx.pas"
// Начат: 16.01.2012 21:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::StopTimerEx
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
 TkwStopTimerEx = {scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStopTimerEx
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwStopTimerEx

procedure TkwStopTimerEx.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F145AEB0088_var*
var
 l_S1 : AnsiString;
 l_S2 : AnsiString;
//#UC END# *4DAEEDE10285_4F145AEB0088_var*
begin
//#UC START# *4DAEEDE10285_4F145AEB0088_impl*
 l_S2 := aCtx.rEngine.PopDelphiString;
 l_S1 := aCtx.rEngine.PopDelphiString;
 aCtx.rEngine.PushInt(aCtx.rCaller.StopTimer(l_S1, l_S2));
//#UC END# *4DAEEDE10285_4F145AEB0088_impl*
end;//TkwStopTimerEx.DoDoIt

class function TkwStopTimerEx.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StopTimerEx';
end;//TkwStopTimerEx.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StopTimerEx
 TkwStopTimerEx.RegisterInEngine;
{$IfEnd} //not NoScripts

end.