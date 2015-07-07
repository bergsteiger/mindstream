unit kwProcessFilesWithMask;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwProcessFilesWithMask.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::ProcessFilesWithMask
//
// ProcessFilesWithMask - перебирает файлы по маске в заданной директории и вызывает для каждого
// найденного функцию.
// *Формат:*
// aProc aFileMask aDirName ProcessFilesWithMask
// * aProc - функция, которая вызывается для каждого файла. В стек при вызове помещается имя файла.
// * aFileMask - маска, по которой отбираются файлы, например '*.script'
// * aDirName - путь, по которому ищутся файлы.
// *Пример:*
// {code}
// : PrintFileName
// .
// ;
// 
// @ PrintFileName '*.script' 'w:\archi\source\projects\Archi\TestSet\Scripts\' ProcessFilesWithMask
// {code}
// В результате будет создан файл с имя_скрипта.prn с именами файлов с полными путями.
// *Примечание:* Если ни один файл не найден, то функция не будет вызвана ни разу. Ни дирректории,
// ни ссылки на файлы, ни имена дисков в поиск не попадают. Поиск во вложенных директориях не
// прозводится. Имя файла передается с полным путем.
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
 TkwProcessFilesWithMask = {final} class(_tfwAutoregisteringWord_)
  {* ProcessFilesWithMask - перебирает файлы по маске в заданной директории и вызывает для каждого найденного функцию.
*Формат:*
aProc aFileMask aDirName ProcessFilesWithMask
* aProc - функция, которая вызывается для каждого файла. В стек при вызове помещается имя файла.
* aFileMask - маска, по которой отбираются файлы, например '*.script'
* aDirName - путь, по которому ищутся файлы.
*Пример:*
[code]
: PrintFileName
 .
;

@ PrintFileName '*.script' 'w:\archi\source\projects\Archi\TestSet\Scripts\' ProcessFilesWithMask
[code]
В результате будет создан файл с имя_скрипта.prn с именами файлов с полными путями.
*Примечание:* Если ни один файл не найден, то функция не будет вызвана ни разу. Ни дирректории, ни ссылки на файлы, ни имена дисков в поиск не попадают. Поиск во вложенных директориях не прозводится. Имя файла передается с полным путем. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwProcessFilesWithMask
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3FileUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwProcessFilesWithMask;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwProcessFilesWithMask

procedure TkwProcessFilesWithMask.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5090FF1E038D_var*
var
 l_V          : TtfwStackValue;
 l_Word       : TtfwWord;
 l_DirName    : AnsiString;
 l_FileMask   : AnsiString;
 l_SearchRec  : TSearchRec;
 l_FindResult : Integer;
//#UC END# *4DAEEDE10285_5090FF1E038D_var*
begin
//#UC START# *4DAEEDE10285_5090FF1E038D_impl*
 if aCtx.rEngine.IsTopString then
 begin
  l_DirName := aCtx.rEngine.PopDelphiString;
  if not DirectoryExists(l_DirName) then
  begin
   Assert(False, Format('Директория %s не существует', [l_DirName]));
   Exit;
  end; // if not DirectoryExists(l_DirName) then
  if aCtx.rEngine.IsTopString then
  begin
   l_FileMask := aCtx.rEngine.PopDelphiString;
   l_FindResult := FindFirst(ConcatDirName(l_DirName, l_FileMask),
                             faAnyFile,
                             l_SearchRec);
   l_V := aCtx.rEngine.Pop;
   l_Word := TtfwWord(l_V.AsObject);
   try
    while l_FindResult = 0 do
    begin
     if (l_SearchRec.Attr and (faDirectory or faVolumeID or faSymLink)) = 0 then
     begin
      aCtx.rEngine.PushString(ConcatDirName(l_DirName, l_SearchRec.Name));
      l_Word.DoIt(aCtx);
     end; // if (l_SearchRec.Attr and (faDirectory or faVolumeID or faSymLink)) = 0 then
     l_FindResult := FindNext(l_SearchRec);
    end; // while l_FindResult = 0 do
   finally
    FindClose(l_SearchRec);
   end;
  end // if aCtx.rEngine.IsTopString then
  else
   Assert(False, 'Не задана маска для поиска!');
 end // if aCtx.rEngine.IsTopString then
 else
  Assert(False, 'Не задана директория для поиска!');
//#UC END# *4DAEEDE10285_5090FF1E038D_impl*
end;//TkwProcessFilesWithMask.DoDoIt

class function TkwProcessFilesWithMask.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ProcessFilesWithMask';
end;//TkwProcessFilesWithMask.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.