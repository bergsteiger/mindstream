unit kwComputerName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwComputerName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::ComputerName
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
 TkwComputerName = {final scriptword} class(TtfwSysUtilsWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwComputerName
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

// start class TkwComputerName

procedure TkwComputerName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5115224C032F_var*
var
 l_CompSize : Integer;
 l_S : AnsiString;
//#UC END# *4DAEEDE10285_5115224C032F_var*
begin
//#UC START# *4DAEEDE10285_5115224C032F_impl*
 l_CompSize := MAX_COMPUTERNAME_LENGTH + 1;
 SetLength(l_S, l_CompSize);

 Win32Check(GetComputerNameA(PAnsiChar(l_S), LongWord(l_CompSize)));
 SetLength(l_S, l_CompSize);
 aCtx.rEngine.PushString(l_S);
//#UC END# *4DAEEDE10285_5115224C032F_impl*
end;//TkwComputerName.DoDoIt

class function TkwComputerName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ComputerName';
end;//TkwComputerName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация ComputerName
 TkwComputerName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.