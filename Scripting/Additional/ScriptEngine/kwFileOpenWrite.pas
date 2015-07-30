unit kwFileOpenWrite;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileOpenWrite.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_OpenWrite
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
 TkwFileOpenWrite = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileOpenWrite
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwFile
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFileOpenWrite

procedure TkwFileOpenWrite.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FD8250023_var*
//#UC END# *4DAEEDE10285_4F4FD8250023_var*
begin
//#UC START# *4DAEEDE10285_4F4FD8250023_impl*
 aCtx.rEngine.PushFile(TtfwFile.MakeWrite(aCtx.rCaller.ResolveOutputFilePath(aCtx.rEngine.PopDelphiString)));
//#UC END# *4DAEEDE10285_4F4FD8250023_impl*
end;//TkwFileOpenWrite.DoDoIt

class function TkwFileOpenWrite.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:OpenWrite';
end;//TkwFileOpenWrite.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_OpenWrite
 TkwFileOpenWrite.RegisterInEngine;
{$IfEnd} //not NoScripts

end.