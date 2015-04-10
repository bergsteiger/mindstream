unit tfwControlString;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwControlString.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::TtfwControlString
//
// Слово для регистрации контрола и его класса
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwString
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwControlString = class(TtfwString)
  {* Слово для регистрации контрола и его класса }
 public
 // public methods
   class procedure Register(const aName: AnsiString;
     aClass: TClass);
 end;//TtfwControlString
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  l3Except,
  tfwScriptEngine,
  tfwClassRef,
  SysUtils,
  StrUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwControlString

class procedure TtfwControlString.Register(const aName: AnsiString;
  aClass: TClass);
//#UC START# *508528490090_508527F30183_var*
//#UC END# *508528490090_508527F30183_var*
begin
//#UC START# *508528490090_508527F30183_impl*
 inherited Register(aName);
 TtfwClassRef.Register(aClass);
//#UC END# *508528490090_508527F30183_impl*
end;//TtfwControlString.Register

{$IfEnd} //not NoScripts

end.