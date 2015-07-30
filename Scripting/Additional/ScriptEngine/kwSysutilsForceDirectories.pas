unit kwSysutilsForceDirectories;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSysutilsForceDirectories.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::sysutils_ForceDirectories
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
 TkwSysutilsForceDirectories = {final scriptword} class(TtfwStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysutilsForceDirectories
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

// start class TkwSysutilsForceDirectories

procedure TkwSysutilsForceDirectories.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4F5F005601E9_var*
var
 l_N : AnsiString;
//#UC END# *4DD0CF6F0197_4F5F005601E9_var*
begin
//#UC START# *4DD0CF6F0197_4F5F005601E9_impl*
 l_N := l3Str(aStr);
 aCtx.rEngine.PushBool(ForceDirectories(l_N));
//#UC END# *4DD0CF6F0197_4F5F005601E9_impl*
end;//TkwSysutilsForceDirectories.DoString

class function TkwSysutilsForceDirectories.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ForceDirectories';
end;//TkwSysutilsForceDirectories.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация sysutils_ForceDirectories
 TkwSysutilsForceDirectories.RegisterInEngine;
{$IfEnd} //not NoScripts

end.