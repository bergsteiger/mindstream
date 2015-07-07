unit WinUtilsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/WinUtilsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::WinUtilsPack
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
  kwWindowFromPoint,
  kwGetForegroundWindow,
  kwWindowIsMine,
  kwFindWindowByCaption,
  kwAskWindowToCloseItself,
  kwCloseWindow,
  kwSetForegroundWindow,
  kwIterateWindows,
  kwGetWindowText,
  kwGetClassName,
  kwIterateChildWindows,
  kwDesktopHeight,
  kwScreenWidth,
  kwMainScreenWidth,
  kwDesktopWidth,
  kwScreenHeight,
  kwMainScreenHeight,
  kwScreenCount,
  kwWinTreeGetCurrentText,
  kwIsVisible,
  kwScreenShot2File,
  kwScreenShot2FileWithCheck,
  kwSetFuzzInPercent
  ;

{$IfEnd} //not NoScripts
end.