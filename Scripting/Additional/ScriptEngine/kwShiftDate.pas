unit kwShiftDate;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwShiftDate.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::ShiftDate
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
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
 TkwShiftDate = {final} class(_tfwSysUtilsWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
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
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwShiftDate;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.