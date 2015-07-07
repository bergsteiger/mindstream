unit kwScriptFileName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwScriptFileName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::TkwScriptFileName
//
// Возвращает имя файла, где находится скрипт. Возвращается полный путь к файлу.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
 TkwScriptFileName = class(_tfwSysUtilsWord_)
  {* Возвращает имя файла, где находится скрипт. Возвращается полный путь к файлу. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwScriptFileName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwScriptFileName;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.