unit kwCopyFile;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCopyFile.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::CopyFile
//
// CopyFile - копирует файл.
// *Формат:*  aCopyMode aDestFile aSourceFile CopyFile
// * aSourceFile - имя исходного файла
// * aDestFile - имя файла, куда копируем
// * aCopyMode - режим копирования файла.
// Результат слово не возвращает. Если появляется ошибка, то будет Exception
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
 TkwCopyFile = {final} class(_tfwAutoregisteringWord_)
  {* CopyFile - копирует файл.
*Формат:*  aCopyMode aDestFile aSourceFile CopyFile
* aSourceFile - имя исходного файла
* aDestFile - имя файла, куда копируем
* aCopyMode - режим копирования файла.
Результат слово не возвращает. Если появляется ошибка, то будет Exception }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCopyFile
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3FileUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCopyFile;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCopyFile

procedure TkwCopyFile.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53FDAD910148_var*
var
 l_Dest    : AnsiString;
 l_Source  : AnsiString;
 l_CopyMode: Byte;
//#UC END# *4DAEEDE10285_53FDAD910148_var*
begin
//#UC START# *4DAEEDE10285_53FDAD910148_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задано имя исходного файла!', aCtx);
 l_Source := aCtx.rEngine.PopDelphiString;
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задано имя файла назначения!', aCtx);
 l_Dest := aCtx.rEngine.PopDelphiString;
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задан режим копирования!', aCtx);
 l_CopyMode := Byte(aCtx.rEngine.PopInt);
 CopyFile(l_Source, l_Dest, l_CopyMode);
//#UC END# *4DAEEDE10285_53FDAD910148_impl*
end;//TkwCopyFile.DoDoIt

class function TkwCopyFile.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CopyFile';
end;//TkwCopyFile.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.