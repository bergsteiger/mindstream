unit kwGetLocalDate;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGetLocalDate.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::GetLocalDate
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
 TkwGetLocalDate = {final} class(_tfwSysUtilsWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGetLocalDate
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

type _Instance_R_ = TkwGetLocalDate;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

// start class TkwGetLocalDate

procedure TkwGetLocalDate.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FEEDA6901CF_var*
var
  l_Time: TSystemTime;
//#UC END# *4DAEEDE10285_4FEEDA6901CF_var*
begin
//#UC START# *4DAEEDE10285_4FEEDA6901CF_impl*
 GetLocalTime(l_Time);
 aCtx.rEngine.PushInt(l_Time.wYear);
 aCtx.rEngine.PushInt(l_Time.wMonth);
 aCtx.rEngine.PushInt(l_Time.wDay);
//#UC END# *4DAEEDE10285_4FEEDA6901CF_impl*
end;//TkwGetLocalDate.DoDoIt

class function TkwGetLocalDate.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GetLocalDate';
end;//TkwGetLocalDate.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.