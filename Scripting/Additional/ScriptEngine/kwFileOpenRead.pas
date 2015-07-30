unit kwFileOpenRead;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileOpenRead.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_OpenRead
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
 TkwFileOpenRead = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileOpenRead
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwFile
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFileOpenRead

procedure TkwFileOpenRead.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FD7F8009C_var*
//#UC END# *4DAEEDE10285_4F4FD7F8009C_var*
begin
//#UC START# *4DAEEDE10285_4F4FD7F8009C_impl*
 aCtx.rEngine.PushFile(TtfwFile.MakeRead(aCtx.rCaller.ResolveInputFilePath(aCtx.rEngine.PopDelphiString)));
//#UC END# *4DAEEDE10285_4F4FD7F8009C_impl*
end;//TkwFileOpenRead.DoDoIt

class function TkwFileOpenRead.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:OpenRead';
end;//TkwFileOpenRead.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_OpenRead
 TkwFileOpenRead.RegisterInEngine;
{$IfEnd} //not NoScripts

end.