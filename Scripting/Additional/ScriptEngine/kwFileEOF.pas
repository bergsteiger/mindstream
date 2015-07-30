unit kwFileEOF;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileEOF.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_EOF
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
 TkwFileEOF = {final scriptword} class(TtfwFileWord)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileEOF
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFileEOF

procedure TkwFileEOF.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F507FED0030_var*
//#UC END# *4F5084CF033E_4F507FED0030_var*
begin
//#UC START# *4F5084CF033E_4F507FED0030_impl*
 aCtx.rEngine.PushBool(aFile.EOF);
//#UC END# *4F5084CF033E_4F507FED0030_impl*
end;//TkwFileEOF.DoFile

class function TkwFileEOF.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:EOF';
end;//TkwFileEOF.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_EOF
 TkwFileEOF.RegisterInEngine;
{$IfEnd} //not NoScripts

end.