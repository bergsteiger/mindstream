unit kwSysutilsFileExists;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSysutilsFileExists.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::sysutils_FileExists
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
 TkwSysutilsFileExists = {final scriptword} class(TtfwStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysutilsFileExists
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

// start class TkwSysutilsFileExists

procedure TkwSysutilsFileExists.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_501FD63F01EE_var*
//#UC END# *4DD0CF6F0197_501FD63F01EE_var*
begin
//#UC START# *4DD0CF6F0197_501FD63F01EE_impl*
 aCtx.rEngine.PushBool(FileExists(l3Str(aStr)));
//#UC END# *4DD0CF6F0197_501FD63F01EE_impl*
end;//TkwSysutilsFileExists.DoString

class function TkwSysutilsFileExists.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:FileExists';
end;//TkwSysutilsFileExists.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация sysutils_FileExists
 TkwSysutilsFileExists.RegisterInEngine;
{$IfEnd} //not NoScripts

end.