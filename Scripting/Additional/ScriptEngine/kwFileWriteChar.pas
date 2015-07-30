unit kwFileWriteChar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileWriteChar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_WriteChar
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
 TkwFileWriteChar = {final scriptword} class(TtfwFileWord)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileWriteChar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFileWriteChar

procedure TkwFileWriteChar.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F4FDC7F012E_var*
//#UC END# *4F5084CF033E_4F4FDC7F012E_var*
begin
//#UC START# *4F5084CF033E_4F4FDC7F012E_impl*
 aFile.WriteChar(aCtx.rEngine.PopChar);
//#UC END# *4F5084CF033E_4F4FDC7F012E_impl*
end;//TkwFileWriteChar.DoFile

class function TkwFileWriteChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:WriteChar';
end;//TkwFileWriteChar.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_WriteChar
 TkwFileWriteChar.RegisterInEngine;
{$IfEnd} //not NoScripts

end.