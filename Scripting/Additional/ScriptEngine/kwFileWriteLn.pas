unit kwFileWriteLn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileWriteLn.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_WriteLn
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
 TkwFileWriteLn = {final scriptword} class(TtfwFileWord)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileWriteLn
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFileWriteLn

procedure TkwFileWriteLn.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F4FD9100262_var*
//#UC END# *4F5084CF033E_4F4FD9100262_var*
begin
//#UC START# *4F5084CF033E_4F4FD9100262_impl*
 aFile.WriteLn(aCtx.rEngine.PopString);
//#UC END# *4F5084CF033E_4F4FD9100262_impl*
end;//TkwFileWriteLn.DoFile

class function TkwFileWriteLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:WriteLn';
end;//TkwFileWriteLn.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_WriteLn
 TkwFileWriteLn.RegisterInEngine;
{$IfEnd} //not NoScripts

end.