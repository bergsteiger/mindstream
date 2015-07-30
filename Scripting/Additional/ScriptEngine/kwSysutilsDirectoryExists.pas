unit kwSysutilsDirectoryExists;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSysutilsDirectoryExists.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::sysutils_DirectoryExists
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
 TkwSysutilsDirectoryExists = {final scriptword} class(TtfwStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysutilsDirectoryExists
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

// start class TkwSysutilsDirectoryExists

procedure TkwSysutilsDirectoryExists.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_502380B6032B_var*
//#UC END# *4DD0CF6F0197_502380B6032B_var*
begin
//#UC START# *4DD0CF6F0197_502380B6032B_impl*
 aCtx.rEngine.PushBool(DirectoryExists(l3Str(aStr)));
//#UC END# *4DD0CF6F0197_502380B6032B_impl*
end;//TkwSysutilsDirectoryExists.DoString

class function TkwSysutilsDirectoryExists.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:DirectoryExists';
end;//TkwSysutilsDirectoryExists.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация sysutils_DirectoryExists
 TkwSysutilsDirectoryExists.RegisterInEngine;
{$IfEnd} //not NoScripts

end.