unit EtalonsWorkingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/EtalonsWorkingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::EtalonsWorking::EtalonsWorkingPack
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
  kwCheckOutputWithInput,
  kwCheckEtalon
  {$If defined(nsTest) AND not defined(NoScripts)}
  ,
  kwBeginWaitPrint
  {$IfEnd} //nsTest AND not NoScripts
  
  {$If defined(nsTest) AND not defined(NoScripts)}
  ,
  kwEndWaitPrint
  {$IfEnd} //nsTest AND not NoScripts
  ,
  kwTestResolveInputFilePath
  ;

{$IfEnd} //not NoScripts
end.