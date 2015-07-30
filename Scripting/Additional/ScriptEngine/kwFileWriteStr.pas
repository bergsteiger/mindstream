unit kwFileWriteStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileWriteStr.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_WriteStr
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
 TkwFileWriteStr = {final scriptword} class(TtfwFileWord)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileWriteStr
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFileWriteStr

procedure TkwFileWriteStr.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F51E88702E8_var*
//#UC END# *4F5084CF033E_4F51E88702E8_var*
begin
//#UC START# *4F5084CF033E_4F51E88702E8_impl*
 aFile.WriteWStr(l3PCharLen(aCtx.rEngine.PopString));
//#UC END# *4F5084CF033E_4F51E88702E8_impl*
end;//TkwFileWriteStr.DoFile

class function TkwFileWriteStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:WriteStr';
end;//TkwFileWriteStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_WriteStr
 TkwFileWriteStr.RegisterInEngine;
{$IfEnd} //not NoScripts

end.