unit SysUtilsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "SysUtilsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::SysUtils::SysUtilsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwIntToStr,
  kwSysUtilsExtractFileName,
  kwWinExec,
  kwSysUtilsChangeFileExt,
  kwScriptFileName,
  kwSysutilsExtractFilePath,
  kwSysutilsExtractFileDrive,
  kwSysutilsForceDirectories,
  kwClipboardClear,
  kwGetLocalTime,
  kwSetLocalTime,
  kwGetLocalDate,
  kwSetLocalDate,
  kwGetLocalDateTime,
  kwSetLocalDateTime,
  kwGetTickCount,
  kwShiftTime,
  kwShiftDate,
  kwClipboardGetFormattedText,
  kwSysutilsFileExists,
  kwSysutilsDirectoryExists,
  kwRGB2String,
  kwClipboardSetText,
  kwRandom,
  kwRandomize,
  kwSetRandSeed,
  kwStartTimer,
  kwStopTimer,
  kwStopTimerEx,
  kwApplicationActionIdle,
  kwComputerName,
  kwEtalonNeedsComputerName,
  kwTimeToLog,
  kwIsUnder64,
  kwOSName,
  kwIsXE,
  kwApplicationExeName,
  kwSetAppPath2CurrentDir
  ;

{$IfEnd} //not NoScripts
end.