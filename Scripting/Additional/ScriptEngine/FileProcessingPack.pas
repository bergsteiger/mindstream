unit FileProcessingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "FileProcessingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::FileProcessingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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