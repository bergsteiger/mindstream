unit FileProcessingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/FileProcessingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::FileProcessingPack
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwFileOpenRead,
  kwFileOpenWrite,
  kwFileReadLn,
  kwFileWriteLn,
  kwFileWriteChar,
  kwFileReadWStrLn,
  kwFileWriteWStrLn,
  kwFileWriteWStr,
  kwFileEOF,
  kwFileReadLines,
  kwFileWriteStr,
  kwProcessFilesWithMask,
  kwProcessSubDirs,
  kwRenameFile,
  kwDeleteFile,
  kwPureDir,
  kwDeleteFilesByMask,
  kwCopyFile,
  kwCopyFilesByMask
  ;

{$IfEnd} //not NoScripts
end.