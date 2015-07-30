unit kwSetLocalDate;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSetLocalDate.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::SetLocalDate
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
 TkwSetLocalDate = {final scriptword} class(TtfwSysUtilsWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSetLocalDate
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

// start class TkwSetLocalDate

procedure TkwSetLocalDate.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FEEDA7D0182_var*
var
 l_Time: TSystemTime;
//#UC END# *4DAEEDE10285_4FEEDA7D0182_var*
begin
//#UC START# *4DAEEDE10285_4FEEDA7D0182_impl*
 GetLocalTime(l_Time);
 
 l_Time.wDay := aCtx.rEngine.PopInt;
 l_Time.wMonth := aCtx.rEngine.PopInt;
 l_Time.wYear := aCtx.rEngine.PopInt;

 SetLocalTime(l_Time);
//#UC END# *4DAEEDE10285_4FEEDA7D0182_impl*
end;//TkwSetLocalDate.DoDoIt

class function TkwSetLocalDate.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetLocalDate';
end;//TkwSetLocalDate.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация SetLocalDate
 TkwSetLocalDate.RegisterInEngine;
{$IfEnd} //not NoScripts

end.