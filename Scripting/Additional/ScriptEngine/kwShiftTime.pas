unit kwShiftTime;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwShiftTime.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::ShiftTime
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
 TkwShiftTime = {final} class(_tfwSysUtilsWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
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
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwShiftTime;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.