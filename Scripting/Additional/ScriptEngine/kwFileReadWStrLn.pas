unit kwFileReadWStrLn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFileReadWStrLn.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::file_ReadWStrLn
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
 TkwFileReadWStrLn = {final scriptword} class(TtfwFileWord)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileReadWStrLn
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwFileReadWStrLn

procedure TkwFileReadWStrLn.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F4FE2B70138_var*
//#UC END# *4F5084CF033E_4F4FE2B70138_var*
begin
//#UC START# *4F5084CF033E_4F4FE2B70138_impl*
 aCtx.rEngine.PushWStr(aFile.ReadWStrLn);
//#UC END# *4F5084CF033E_4F4FE2B70138_impl*
end;//TkwFileReadWStrLn.DoFile

class function TkwFileReadWStrLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:ReadWStrLn';
end;//TkwFileReadWStrLn.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация file_ReadWStrLn
 TkwFileReadWStrLn.RegisterInEngine;
{$IfEnd} //not NoScripts

end.