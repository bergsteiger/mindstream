unit kwSysUtilsExtractFileName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSysUtilsExtractFileName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::SysUtils::TkwSysUtilsExtractFileName
//
// Функция ExtractFileName из SysUtils Паскаля.
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
 TkwSysUtilsExtractFileName = class(TtfwStrWord)
  {* Функция ExtractFileName из SysUtils Паскаля. }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysUtilsExtractFileName
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

// start class TkwSysUtilsExtractFileName

procedure TkwSysUtilsExtractFileName.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4DDE50110333_var*
var
 l_N : AnsiString;
//#UC END# *4DD0CF6F0197_4DDE50110333_var*
begin
//#UC START# *4DD0CF6F0197_4DDE50110333_impl*
 l_N := l3Str(aStr);
 aCtx.rEngine.PushString(ExtractFileName(l_N));
//#UC END# *4DD0CF6F0197_4DDE50110333_impl*
end;//TkwSysUtilsExtractFileName.DoString

class function TkwSysUtilsExtractFileName.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DDE50110333_var*
//#UC END# *4DB0614603C8_4DDE50110333_var*
begin
//#UC START# *4DB0614603C8_4DDE50110333_impl*
 Result := 'sysutils:ExtractFileName';
//#UC END# *4DB0614603C8_4DDE50110333_impl*
end;//TkwSysUtilsExtractFileName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwSysUtilsExtractFileName
 TkwSysUtilsExtractFileName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.