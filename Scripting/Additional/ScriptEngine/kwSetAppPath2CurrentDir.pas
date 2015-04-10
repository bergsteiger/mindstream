unit kwSetAppPath2CurrentDir;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSetAppPath2CurrentDir.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::SetAppPath2CurrentDir
//
// Устанавливает CurrentDirectory значение директории запуска тестового приложения.
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
 TkwSetAppPath2CurrentDir = {final} class(_tfwSysUtilsWord_)
  {* Устанавливает CurrentDirectory значение директории запуска тестового приложения. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSetAppPath2CurrentDir
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

type _Instance_R_ = TkwSetAppPath2CurrentDir;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

// start class TkwSetAppPath2CurrentDir

procedure TkwSetAppPath2CurrentDir.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_545B5D020069_var*
//#UC END# *4DAEEDE10285_545B5D020069_var*
begin
//#UC START# *4DAEEDE10285_545B5D020069_impl*
 SetCurrentDir(ExtractFilePath(ParamStr(0)));
//#UC END# *4DAEEDE10285_545B5D020069_impl*
end;//TkwSetAppPath2CurrentDir.DoDoIt

class function TkwSetAppPath2CurrentDir.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetAppPath2CurrentDir';
end;//TkwSetAppPath2CurrentDir.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.