unit kwShiftDate;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwShiftDate.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::ShiftDate
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
 TkwShiftDate = {final scriptword} class(TtfwSysUtilsWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwShiftDate
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

// start class TkwShiftDate

procedure TkwShiftDate.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FF1C8C203D2_var*
var
 l_Time: TSystemTime;
 l_DelphiTime: TDateTime;
 l_DeltaY, l_DeltaM, l_DeltaD: Integer;
//#UC END# *4DAEEDE10285_4FF1C8C203D2_var*
begin
//#UC START# *4DAEEDE10285_4FF1C8C203D2_impl*
 l_DeltaD := aCtx.rEngine.PopInt;
 l_DeltaM := aCtx.rEngine.PopInt;
 l_DeltaY := aCtx.rEngine.PopInt;             
 GetLocalTime(l_Time);
 with l_Time do
  l_DelphiTime := EncodeDateTime(wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds);
 l_DelphiTime := IncYear(l_DelphiTime, l_DeltaY);
 l_DelphiTime := IncMonth(l_DelphiTime, l_DeltaM);
 l_DelphiTime := IncDay(l_DelphiTime, l_DeltaD);
 with l_Time do
  DecodeDateTime(l_DelphiTime, wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds);
 SetLocalTime(l_Time);
//#UC END# *4DAEEDE10285_4FF1C8C203D2_impl*
end;//TkwShiftDate.DoDoIt

class function TkwShiftDate.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ShiftDate';
end;//TkwShiftDate.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация ShiftDate
 TkwShiftDate.RegisterInEngine;
{$IfEnd} //not NoScripts

end.