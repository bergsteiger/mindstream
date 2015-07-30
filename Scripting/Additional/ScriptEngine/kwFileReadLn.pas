unit kwFileReadLn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileReadLn.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_ReadLn
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwFileWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwFileReadLn = {final scriptword} class(TtfwFileWord)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileReadLn
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFileReadLn

procedure TkwFileReadLn.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F4FD8EA00C9_var*
//#UC END# *4F5084CF033E_4F4FD8EA00C9_var*
begin
//#UC START# *4F5084CF033E_4F4FD8EA00C9_impl*
 aCtx.rEngine.PushString(aFile.ReadLn);
//#UC END# *4F5084CF033E_4F4FD8EA00C9_impl*
end;//TkwFileReadLn.DoFile

class function TkwFileReadLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:ReadLn';
end;//TkwFileReadLn.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_ReadLn
 TkwFileReadLn.RegisterInEngine;
{$IfEnd} //not NoScripts

end.