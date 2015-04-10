unit kwFiltersAndGeneratorsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFiltersAndGeneratorsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::FiltersAndGenerators::kwFiltersAndGeneratorsPack
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
  Classes
  {$If defined(Archi) AND not defined(NoScripts)}
  ,
  kwFilterAutolinkFilter
  {$IfEnd} //Archi AND not NoScripts
  ,
  kwGeneratorsLink,
  kwGeneratorsExecute
  {$If defined(Archi) AND not defined(NoScripts)}
  ,
  kwFilterCleanAutolinkFilter
  {$IfEnd} //Archi AND not NoScripts
  ,
  kwEnabledSaveRTFPictures,
  kwGeneratePDFForEtalon
  ;

{$IfEnd} //not NoScripts
end.