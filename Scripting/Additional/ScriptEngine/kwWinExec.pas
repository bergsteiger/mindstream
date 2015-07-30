unit kwWinExec;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwWinExec.pas"
// Начат: 20.10.2011 18:55
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::WinExec
//
// Выполняет команду командной строки Windows
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwWinExec = {scriptword} class(TtfwStrWord)
  {* Выполняет команду командной строки Windows }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWinExec
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWinExec

procedure TkwWinExec.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4EA036540138_var*
var
 l_S : AnsiString;
//#UC END# *4DD0CF6F0197_4EA036540138_var*
begin
//#UC START# *4DD0CF6F0197_4EA036540138_impl*
 l_S := l3Str(aStr);
 if (ExtractFilePath(l_S) = '') then
  l_S := ExtractFilePath(ParamStr(0)) + l_S;
 WinExec(PAnsiChar(l_S), {SW_HIDE}SW_SHOWNORMAL);
//#UC END# *4DD0CF6F0197_4EA036540138_impl*
end;//TkwWinExec.DoString

class function TkwWinExec.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WinExec';
end;//TkwWinExec.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WinExec
 TkwWinExec.RegisterInEngine;
{$IfEnd} //not NoScripts

end.