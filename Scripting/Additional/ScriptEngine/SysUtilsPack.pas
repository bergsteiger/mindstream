unit SysUtilsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/SysUtilsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::SysUtilsPack
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
  kwCFHTML,
  kwCFXML,
  kwClipboardGetFormattedText,
  kwSysutilsFileExists,
  kwSysutilsDirectoryExists,
  kwRGB2String,
  kwClipboardSetText,
  kwCFEVEREST,
  kwRandom,
  kwRandomize,
  kwSetRandSeed,
  kwStartTimer,
  kwStopTimer,
  kwStopTimerEx,
  kwApplicationActionIdle,
  kwApplicationCancelHint,
  kwApplicationIsHintVisible,
  kwApplicationGetLastHint,
  kwComputerName,
  kwEtalonNeedsComputerName,
  kwTimeToLog,
  kwIsUnder64,
  kwOSName,
  kwIsXE,
  kwCFRTF,
  kwEvdBin2EvdTxt,
  kwCFEVERESTBIN,
  kwApplicationExeName,
  kwSetAppPath2CurrentDir
  ;

{$IfEnd} //not NoScripts
end.