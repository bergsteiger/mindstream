unit kwVTControlsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVTControlsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::kwVTControlsPack
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
  kwPopSpinEditGetValue,
  kwPopSpinEditSetValue,
  kwPopRadioButtonGetChecked,
  kwPopRadioButtonSetChecked,
  kwPopListerGetCurrent,
  kwPopListerSelectWithShift,
  kwPopListerFooterCaption
  {$If defined(Nemesis) AND not defined(NoScripts)}
  ,
  kwPopPageControlGetAllPageCaptions
  {$IfEnd} //Nemesis AND not NoScripts
  
  {$If defined(Nemesis) AND not defined(NoScripts)}
  ,
  kwPopPageControlPageCaptionByIndex
  {$IfEnd} //Nemesis AND not NoScripts
  
  {$If defined(Nemesis) AND not defined(NoScripts)}
  ,
  kwPopPageControlFindPageByCaption
  {$IfEnd} //Nemesis AND not NoScripts
  
  {$If defined(Nemesis) AND not defined(NoScripts)}
  ,
  kwPopPageControlPageByIndex
  {$IfEnd} //Nemesis AND not NoScripts
  ,
  kwPopListerGetSelected,
  kwPopCheckListBoxGetChecked,
  kwPopCheckListBoxSetCheked,
  kwPopCheckListBoxUncheckAll,
  kwDDSupportGetState,
  kwPopVtStatusBarGetPanel,
  kwPopVtStatusPanelGetText
  ;

{$IfEnd} //not NoScripts
end.