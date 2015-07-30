unit kwSetLocalTime;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSetLocalTime.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::SetLocalTime
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwSysUtilsWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwSetLocalTime = {final scriptword} class(TtfwSysUtilsWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSetLocalTime
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  SysUtils,
  l3String,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwSetLocalTime

procedure TkwSetLocalTime.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FEEDA3402D5_var*
var
 l_Time: TSystemTime;
 l_TickCount: Cardinal;
//#UC END# *4DAEEDE10285_4FEEDA3402D5_var*
begin
//#UC START# *4DAEEDE10285_4FEEDA3402D5_impl*
 GetLocalTime(l_Time);

 l_Time.wMilliseconds := aCtx.rEngine.PopInt;
 l_Time.wSecond := aCtx.rEngine.PopInt;
 l_Time.wMinute := aCtx.rEngine.PopInt;
 l_Time.wHour := aCtx.rEngine.PopInt;

 SetLocalTime(l_Time);
//#UC END# *4DAEEDE10285_4FEEDA3402D5_impl*
end;//TkwSetLocalTime.DoDoIt

class function TkwSetLocalTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetLocalTime';
end;//TkwSetLocalTime.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация SetLocalTime
 TkwSetLocalTime.RegisterInEngine;
{$IfEnd} //not NoScripts

end.