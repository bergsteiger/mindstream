unit kwGetTickCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwGetTickCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::GetTickCount
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 TkwGetTickCount = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGetTickCount
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwGetTickCount

procedure TkwGetTickCount.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FEF0704038A_var*
//#UC END# *4DAEEDE10285_4FEF0704038A_var*
begin
//#UC START# *4DAEEDE10285_4FEF0704038A_impl*
 aCtx.rEngine.PushInt(GetTickCount);
//#UC END# *4DAEEDE10285_4FEF0704038A_impl*
end;//TkwGetTickCount.DoDoIt

class function TkwGetTickCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GetTickCount';
end;//TkwGetTickCount.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация GetTickCount
 TkwGetTickCount.RegisterInEngine;
{$IfEnd} //not NoScripts

end.