unit kwGetLocalTime;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGetLocalTime.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::GetLocalTime
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
 TkwGetLocalTime = {final} class(_tfwSysUtilsWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGetLocalTime
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwGetLocalTime;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

// start class TkwGetLocalTime

procedure TkwGetLocalTime.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FEEDA000263_var*
var
  l_Time: TSystemTime;
//#UC END# *4DAEEDE10285_4FEEDA000263_var*
begin
//#UC START# *4DAEEDE10285_4FEEDA000263_impl*
 GetLocalTime(l_Time); 
 aCtx.rEngine.PushInt(l_Time.wHour);
 aCtx.rEngine.PushInt(l_Time.wMinute);
 aCtx.rEngine.PushInt(l_Time.wSecond);
 aCtx.rEngine.PushInt(l_Time.wMilliseconds);
//#UC END# *4DAEEDE10285_4FEEDA000263_impl*
end;//TkwGetLocalTime.DoDoIt

class function TkwGetLocalTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GetLocalTime';
end;//TkwGetLocalTime.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.