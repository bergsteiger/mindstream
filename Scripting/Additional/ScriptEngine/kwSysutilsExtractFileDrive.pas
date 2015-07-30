unit kwSysutilsExtractFileDrive;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSysutilsExtractFileDrive.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::sysutils_ExtractFileDrive
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
 TkwSysutilsExtractFileDrive = {final scriptword} class(TtfwStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysutilsExtractFileDrive
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

// start class TkwSysutilsExtractFileDrive

procedure TkwSysutilsExtractFileDrive.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4F5EFAD701E7_var*
var
 l_N : AnsiString;
//#UC END# *4DD0CF6F0197_4F5EFAD701E7_var*
begin
//#UC START# *4DD0CF6F0197_4F5EFAD701E7_impl*
 l_N := l3Str(aStr);
 aCtx.rEngine.PushString(ExtractFileDrive(l_N));
//#UC END# *4DD0CF6F0197_4F5EFAD701E7_impl*
end;//TkwSysutilsExtractFileDrive.DoString

class function TkwSysutilsExtractFileDrive.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ExtractFileDrive';
end;//TkwSysutilsExtractFileDrive.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация sysutils_ExtractFileDrive
 TkwSysutilsExtractFileDrive.RegisterInEngine;
{$IfEnd} //not NoScripts

end.