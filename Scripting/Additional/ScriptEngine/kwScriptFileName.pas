unit kwScriptFileName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwScriptFileName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::SysUtils::TkwScriptFileName
//
// Возвращает имя файла, где находится скрипт. Возвращается полный путь к файлу.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwSysUtilsWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwScriptFileName = class(TtfwSysUtilsWord)
  {* Возвращает имя файла, где находится скрипт. Возвращается полный путь к файлу. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwScriptFileName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwScriptFileName

procedure TkwScriptFileName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DDE4FB503A3_var*
//#UC END# *4DAEEDE10285_4DDE4FB503A3_var*
begin
//#UC START# *4DAEEDE10285_4DDE4FB503A3_impl*
 aCtx.rEngine.PushString(aCtx.rScriptFileName);
//#UC END# *4DAEEDE10285_4DDE4FB503A3_impl*
end;//TkwScriptFileName.DoDoIt

class function TkwScriptFileName.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DDE4FB503A3_var*
//#UC END# *4DB0614603C8_4DDE4FB503A3_var*
begin
//#UC START# *4DB0614603C8_4DDE4FB503A3_impl*
 Result := 'script:FileName';
//#UC END# *4DB0614603C8_4DDE4FB503A3_impl*
end;//TkwScriptFileName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwScriptFileName
 TkwScriptFileName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.