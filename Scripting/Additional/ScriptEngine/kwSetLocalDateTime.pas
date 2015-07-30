unit kwSetLocalDateTime;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSetLocalDateTime.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::SetLocalDateTime
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
 TkwSetLocalDateTime = {final scriptword} class(TtfwSysUtilsWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSetLocalDateTime
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  DateUtils,
  SysUtils,
  l3String,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwSetLocalDateTime

procedure TkwSetLocalDateTime.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FEEDAB30095_var*
var
 l_Time: TSystemTime;
 l_TickCount: Cardinal;
//#UC END# *4DAEEDE10285_4FEEDAB30095_var*
begin
//#UC START# *4DAEEDE10285_4FEEDAB30095_impl*
 GetLocalTime(l_Time);

 l_Time.wMilliseconds := aCtx.rEngine.PopInt;
 l_Time.wSecond := aCtx.rEngine.PopInt;
 l_Time.wMinute := aCtx.rEngine.PopInt;
 l_Time.wHour := aCtx.rEngine.PopInt;
 l_Time.wDay := aCtx.rEngine.PopInt;
 l_Time.wMonth := aCtx.rEngine.PopInt;
 l_Time.wYear := aCtx.rEngine.PopInt;

 SetLocalTime(l_Time);
//#UC END# *4DAEEDE10285_4FEEDAB30095_impl*
end;//TkwSetLocalDateTime.DoDoIt

class function TkwSetLocalDateTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetLocalDateTime';
end;//TkwSetLocalDateTime.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация SetLocalDateTime
 TkwSetLocalDateTime.RegisterInEngine;
{$IfEnd} //not NoScripts

end.