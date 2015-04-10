unit kwTestResolveInputFilePath;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTestResolveInputFilePath.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EtalonsWorking::test_ResolveInputFilePath
//
// *Описание:* добавляет к имени файла путь к директории TestSet, где хранятся исходные файлы.
// *Формат*
// {code}
// aFileName test:ResolveInputFilePath
// {code}
// где aFileName - имя файля без пути (!).
// Результат помещается в стек.
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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwTestResolveInputFilePath = {final} class(_tfwAutoregisteringWord_)
  {* *Описание:* добавляет к имени файла путь к директории TestSet, где хранятся исходные файлы.
*Формат*
[code]
aFileName test:ResolveInputFilePath
[code]
где aFileName - имя файля без пути (!).
Результат помещается в стек. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTestResolveInputFilePath
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwTestResolveInputFilePath;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwTestResolveInputFilePath

procedure TkwTestResolveInputFilePath.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53FC3551023F_var*
//#UC END# *4DAEEDE10285_53FC3551023F_var*
begin
//#UC START# *4DAEEDE10285_53FC3551023F_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задано имя файла!', aCtx);
 aCtx.rEngine.PushString(aCtx.rCaller.ResolveInputFilePath(aCtx.rEngine.PopDelphiString));
//#UC END# *4DAEEDE10285_53FC3551023F_impl*
end;//TkwTestResolveInputFilePath.DoDoIt

class function TkwTestResolveInputFilePath.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'test:ResolveInputFilePath';
end;//TkwTestResolveInputFilePath.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.