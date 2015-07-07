unit kwSetLocalDateTime;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSetLocalDateTime.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::SetLocalDateTime
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
 TkwSetLocalDateTime = {final} class(_tfwSysUtilsWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
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
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSetLocalDateTime;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.