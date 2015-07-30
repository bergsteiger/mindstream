unit kwProcessSubDirs;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwProcessSubDirs.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::ProcessSubDirs
//
// ProcessSubDirs - перебирает директории в заданной директории и вызывает для каждого найденного
// функцию.
// *Формат:*
// aProc aDirName ProcessSubDirs
// * aProc - функция, которая вызывается для каждой директории. В стек при вызове помещается имя
// директории.
// * aDirName - путь, по которому ищутся директории.
// *Пример:*
// {code}
// : PrintFileName
// .
// ;
// 
// @ PrintFileName 'w:\archi\source\projects\Archi\TestSet\' ProcessSubDirs
// {code}
// В результате будет создан файл с имя_скрипта.prn с именами директорий с полными путями.
// *Примечание:* Если ни одна директория  не найдена, то функция не будет вызвана ни разу.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 TkwProcessSubDirs = {final scriptword} class(TtfwRegisterableWord)
  {* ProcessSubDirs - перебирает директории в заданной директории и вызывает для каждого найденного функцию.
*Формат:*
aProc aDirName ProcessSubDirs
* aProc - функция, которая вызывается для каждой директории. В стек при вызове помещается имя директории.
* aDirName - путь, по которому ищутся директории.
*Пример:*
[code]
: PrintFileName
 .
;

@ PrintFileName 'w:\archi\source\projects\Archi\TestSet\' ProcessSubDirs
[code]
В результате будет создан файл с имя_скрипта.prn с именами директорий с полными путями.
*Примечание:* Если ни одна директория  не найдена, то функция не будет вызвана ни разу. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwProcessSubDirs
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3FileUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwProcessSubDirs

procedure TkwProcessSubDirs.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5091008A0389_var*
var
 l_V          : TtfwStackValue;
 l_Word      : TtfwWord;
 l_DirName   : AnsiString;
 l_SearchRec : TSearchRec;
 l_FindResult: Integer;
//#UC END# *4DAEEDE10285_5091008A0389_var*
begin
//#UC START# *4DAEEDE10285_5091008A0389_impl*
 if aCtx.rEngine.IsTopString then
 begin
  l_DirName := aCtx.rEngine.PopDelphiString;
  if not DirectoryExists(l_DirName) then
  begin
   Assert(False, Format('Директория %s не существует', [l_DirName]));
   Exit;
  end; // if not DirectoryExists(l_DirName) then
  l_FindResult := FindFirst(ConcatDirName(l_DirName, '*.*'),
                            faDirectory ,
                            l_SearchRec);
  l_V := aCtx.rEngine.Pop;
  l_Word := TtfwWord(l_V.AsObject);
  try
   while (l_FindResult = 0) do
   begin
    if ((l_SearchRec.Attr and faDirectory) <> 0) and (l_SearchRec.Name <> '.') and (l_SearchRec.Name <> '..') then
    begin
     aCtx.rEngine.PushString(ConcatDirName(l_DirName, l_SearchRec.Name));
     l_Word.DoIt(aCtx);
    end; // if (l_SearchRec.Attr and (faDirectory or faVolumeID or faSymLink)) = 0 then
    l_FindResult := FindNext(l_SearchRec);
   end; // while l_FindResult = 0 do
  finally
   SysUtils.FindClose(l_SearchRec);
  end;//try..finally
 end // if aCtx.rEngine.IsTopString then
 else
  Assert(False, 'Не задана директория для поиска!');
//#UC END# *4DAEEDE10285_5091008A0389_impl*
end;//TkwProcessSubDirs.DoDoIt

class function TkwProcessSubDirs.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ProcessSubDirs';
end;//TkwProcessSubDirs.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация ProcessSubDirs
 TkwProcessSubDirs.RegisterInEngine;
{$IfEnd} //not NoScripts

end.