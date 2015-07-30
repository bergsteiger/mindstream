unit kwDeleteFile;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwDeleteFile.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::DeleteFile
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
 TkwDeleteFile = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDeleteFile
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwDeleteFile

procedure TkwDeleteFile.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_50914E750101_var*
//#UC END# *4DAEEDE10285_50914E750101_var*
begin
//#UC START# *4DAEEDE10285_50914E750101_impl*
 aCtx.rEngine.PushBool(SysUtils.DeleteFile(aCtx.rEngine.PopDelphiString));
//#UC END# *4DAEEDE10285_50914E750101_impl*
end;//TkwDeleteFile.DoDoIt

class function TkwDeleteFile.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DeleteFile';
end;//TkwDeleteFile.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация DeleteFile
 TkwDeleteFile.RegisterInEngine;
{$IfEnd} //not NoScripts

end.