unit kwNotImplemented;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwNotImplemented.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Compilation::NotImplemented
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
 TkwNotImplemented = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNotImplemented
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwNotImplemented

procedure TkwNotImplemented.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4068660387_var*
//#UC END# *4DAEEDE10285_4F4068660387_var*
begin
//#UC START# *4DAEEDE10285_4F4068660387_impl*
 RunnerError('Не реализовано', aCtx);
//#UC END# *4DAEEDE10285_4F4068660387_impl*
end;//TkwNotImplemented.DoDoIt

class function TkwNotImplemented.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'NotImplemented';
end;//TkwNotImplemented.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация NotImplemented
 TkwNotImplemented.RegisterInEngine;
{$IfEnd} //not NoScripts

end.