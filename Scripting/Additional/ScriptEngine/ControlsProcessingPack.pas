unit ControlsProcessingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/ControlsProcessingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::ControlsProcessingPack
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
  kwPopControlClick,
  kwPopTB97ButtonGetIsDown,
  kwPopControlUndock
  {$If not defined(NoScripts) AND not defined(NoVGScene)}
  ,
  kwPopControlFindVGControlByName
  {$IfEnd} //not NoScripts AND not NoVGScene
  ,
  kwPopControlCanFocus,
  kwPopControlGetControl,
  kwPopControlControlCount,
  kwPopControlGetHandle,
  kwPopControlFocused,
  kwPopControlSetFocus,
  kwPopControlFindControlByName,
  kwPopControlScreenToClient,
  kwPopControlSetWidth,
  kwPopControlGetWidth,
  kwPopControlGetLeft,
  kwPopControlGetHeight,
  kwPopControlGetHint,
  kwPopControlSetHeight,
  kwPopControlCaption,
  kwPopControlClientToScreen,
  kwPopControlGetTop,
  kwPopControlShow,
  kwPopControlHide,
  kwPopControlName,
  kwPopControlGetTopParentForm,
  kwPopControlGetAnotherParentForm,
  kwPopControlGetParentForm,
  kwPopControlVisible,
  kwPopControlGetMainForm,
  kwPopControlGetParent,
  kwPopControlGetPopupMenu,
  kwPopComboBoxGetItemIndex,
  kwPopComboBoxDropDown,
  kwPopComboBoxIndexOf,
  kwPopComboBoxSelectItem,
  kwPopComboBoxSetItemIndex,
  kwPopControlVScrollerVisible,
  kwPopControlHScrollerVisible,
  kwPopRadioGroupSetItemIndex,
  kwPopRadioGroupGetItemIdex,
  kwPopControlSetTop,
  kwPopControlSetLeft,
  kwPopComponentFindComponent,
  kwPopComponentGetComponent,
  kwPopComponentName,
  kwPopComponentComponentCount
  {$If not defined(NoFlash) AND not defined(NoScripts)}
  ,
  kwPopFlashGetFrame
  {$IfEnd} //not NoFlash AND not NoScripts
  ,
  kwFocusedControlPush,
  kwBynameControlPush,
  kwControlMouseLeftClick,
  kwControlMouseMiddleClick,
  kwControlMouseRightClick,
  kwByhandleControlPush,
  kwPopControlEnabled,
  kwPopControlMouseWheelUp,
  kwPopControlMouseWheelDown,
  kwPopControlInvalidate,
  kwPopControlRepaint,
  kwPopControlGetColor,
  kwPopControlSetColor,
  kwPopComboBoxSaveItems,
  RegisteringControlsClasses,
  kwPopControlScrollInfoPosition,
  kwPopControlScrollInfoPageSize,
  kwPopControlScrollInfoMax,
  kwPopControlScrollInfoMin,
  kwPopControlScrollInfo,
  kwControlMouseLeftDragAndDrop,
  kwPopControlGetShowHint,
  kwPopComponentOwner
  ;

{$IfEnd} //not NoScripts
end.