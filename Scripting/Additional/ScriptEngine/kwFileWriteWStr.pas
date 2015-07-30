unit kwFileWriteWStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileWriteWStr.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_WriteWStr
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
 TkwFileWriteWStr = {final scriptword} class(TtfwFileWord)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileWriteWStr
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFileWriteWStr

procedure TkwFileWriteWStr.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F4FE2FE0284_var*
//#UC END# *4F5084CF033E_4F4FE2FE0284_var*
begin
//#UC START# *4F5084CF033E_4F4FE2FE0284_impl*
 if aCtx.rEngine.IsTopString then
  aFile.WriteWStr(l3PCharLen(aCtx.rEngine.PopString))
 else
  aFile.WriteWStr(aCtx.rEngine.PopWStr);
//#UC END# *4F5084CF033E_4F4FE2FE0284_impl*
end;//TkwFileWriteWStr.DoFile

class function TkwFileWriteWStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:WriteWStr';
end;//TkwFileWriteWStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_WriteWStr
 TkwFileWriteWStr.RegisterInEngine;
{$IfEnd} //not NoScripts

end.