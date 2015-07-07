unit RegisteringControlsClasses;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/RegisteringControlsClasses.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::RegisteringControlsClasses
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
  StdCtrls,
  tfwClassRef,
  ExtCtrls
  ;

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *513DDE8B0169*
 TtfwClassRef.Register(TComboBox);
 TtfwClassRef.Register(TPanel);
//#UC END# *513DDE8B0169*
{$IfEnd} //not NoScripts

end.