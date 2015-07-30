unit kwSysutilsExtractFilePath;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSysutilsExtractFilePath.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::sysutils_ExtractFilePath
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwSysutilsExtractFilePath = {final scriptword} class(TtfwStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysutilsExtractFilePath
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwSysutilsExtractFilePath

procedure TkwSysutilsExtractFilePath.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4F5EFA7400BE_var*
var
 l_N : AnsiString;
//#UC END# *4DD0CF6F0197_4F5EFA7400BE_var*
begin
//#UC START# *4DD0CF6F0197_4F5EFA7400BE_impl*
 l_N := l3Str(aStr);
 aCtx.rEngine.PushString(ExtractFilePath(l_N));
//#UC END# *4DD0CF6F0197_4F5EFA7400BE_impl*
end;//TkwSysutilsExtractFilePath.DoString

class function TkwSysutilsExtractFilePath.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ExtractFilePath';
end;//TkwSysutilsExtractFilePath.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация sysutils_ExtractFilePath
 TkwSysutilsExtractFilePath.RegisterInEngine;
{$IfEnd} //not NoScripts

end.