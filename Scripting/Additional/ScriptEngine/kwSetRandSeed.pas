unit kwSetRandSeed;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSetRandSeed.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::SetRandSeed
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
 TkwSetRandSeed = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSetRandSeed
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwSetRandSeed

procedure TkwSetRandSeed.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_50599E5402BB_var*
//#UC END# *4DAEEDE10285_50599E5402BB_var*
begin
//#UC START# *4DAEEDE10285_50599E5402BB_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Функции SetRandSeed надо передать число.', aCtx);
 RandSeed := aCtx.rEngine.PopInt;
//#UC END# *4DAEEDE10285_50599E5402BB_impl*
end;//TkwSetRandSeed.DoDoIt

class function TkwSetRandSeed.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetRandSeed';
end;//TkwSetRandSeed.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация SetRandSeed
 TkwSetRandSeed.RegisterInEngine;
{$IfEnd} //not NoScripts

end.