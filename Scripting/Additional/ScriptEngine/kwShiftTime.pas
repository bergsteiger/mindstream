unit kwShiftTime;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwShiftTime.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::ShiftTime
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
 TkwShiftTime = {final scriptword} class(TtfwSysUtilsWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwShiftTime
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  DateUtils,
  Windows,
  SysUtils,
  l3String,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwShiftTime

procedure TkwShiftTime.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FEF091001A3_var*
var
 l_Time: TSystemTime;
 l_DelphiTime: TDateTime;
 l_Delta: Int64;
//#UC END# *4DAEEDE10285_4FEF091001A3_var*
begin
//#UC START# *4DAEEDE10285_4FEF091001A3_impl*
 l_Delta := aCtx.rEngine.PopInt;

 GetLocalTime(l_Time);
 with l_Time do
  l_DelphiTime := EncodeDateTime(wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds);
 l_DelphiTime := IncMilliSecond(l_DelphiTime, l_Delta);
 with l_Time do
  DecodeDateTime(l_DelphiTime, wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds);
 SetLocalTime(l_Time);
//#UC END# *4DAEEDE10285_4FEF091001A3_impl*
end;//TkwShiftTime.DoDoIt

class function TkwShiftTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ShiftTime';
end;//TkwShiftTime.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация ShiftTime
 TkwShiftTime.RegisterInEngine;
{$IfEnd} //not NoScripts

end.