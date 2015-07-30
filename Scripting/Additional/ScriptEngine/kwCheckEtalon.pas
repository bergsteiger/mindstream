unit kwCheckEtalon;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwCheckEtalon.pas"
// Начат: 19.05.2011 20:39
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::EtalonsWorking::CheckEtalon
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
 TkwCheckEtalon = {scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCheckEtalon
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCheckEtalon

procedure TkwCheckEtalon.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DD547B70001_var*
var
 l_H : AnsiString;
 l_S : AnsiString;
 l_Delim : AnsiChar;
//#UC END# *4DAEEDE10285_4DD547B70001_var*
begin
//#UC START# *4DAEEDE10285_4DD547B70001_impl*
 l_H := aCtx.rEngine.PopDelphiString;
 if (Length(l_H) > 0) then
  l_Delim := l_H[1]
 else
  l_Delim := #0; 
 l_S := aCtx.rCaller.ResolveOutputFilePath(aCtx.rEngine.PopDelphiString);
 RunnerAssert(Length(l_S) > 0, 'Имя файла не может быть пустым', aCtx);
 aCtx.rCaller.CheckWithEtalon(l_S, l_Delim);
//#UC END# *4DAEEDE10285_4DD547B70001_impl*
end;//TkwCheckEtalon.DoDoIt

class function TkwCheckEtalon.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tests:CheckEtalon';
end;//TkwCheckEtalon.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CheckEtalon
 TkwCheckEtalon.RegisterInEngine;
{$IfEnd} //not NoScripts

end.