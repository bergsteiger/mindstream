unit RegisteringStatusbarClasses;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/RegisteringStatusbarClasses.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Scripting::ScriptEngine::StatusBarWords::RegisteringStatusbarClasses
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(Nemesis) AND not defined(NoScripts)}
{$IfEnd} //Nemesis AND not NoScripts

implementation

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  nscSizeGripPanel,
  nscStatusBar,
  nscStatusBarButton,
  nscStatusBarPanel,
  nscStatusBarSep,
  tfwClassRef
  ;

{$IfEnd} //Nemesis AND not NoScripts

initialization
{$If defined(Nemesis) AND not defined(NoScripts)}
//#UC START# *513DDEE9038D*
 TtfwClassRef.Register(TnscSizeGripPanel);
 TtfwClassRef.Register(TnscStatusBar);
 TtfwClassRef.Register(TnscStatusBarButton);
 TtfwClassRef.Register(TnscStatusBarPanel);
 TtfwClassRef.Register(TnscStatusBarSep);
//#UC END# *513DDEE9038D*
{$IfEnd} //Nemesis AND not NoScripts

end.