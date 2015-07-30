unit kwRandom;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwRandom.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::Random
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
 TkwRandom = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwRandom
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwRandom

procedure TkwRandom.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_50599E3802CF_var*
//#UC END# *4DAEEDE10285_50599E3802CF_var*
begin
//#UC START# *4DAEEDE10285_50599E3802CF_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Функции Random надо передать число.', aCtx);
 aCtx.rEngine.PushInt(Random(aCtx.rEngine.PopInt));
//#UC END# *4DAEEDE10285_50599E3802CF_impl*
end;//TkwRandom.DoDoIt

class function TkwRandom.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Random';
end;//TkwRandom.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Random
 TkwRandom.RegisterInEngine;
{$IfEnd} //not NoScripts

end.