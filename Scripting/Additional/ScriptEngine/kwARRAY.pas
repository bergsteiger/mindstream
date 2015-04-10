unit kwARRAY;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwARRAY.pas"
// Начат: 12.05.2011 21:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ARRAY
//
// Определяет поддержку массивов в скриптах.
// *Пример:*
// {code}
// ARRAY L
// 10 LOOP (
// ++
// DUP
// >>>[] L
// )
// DROP
// @ . L ITERATE
// // - печатает числа от 1 до 10
// '' .
// 0 @ + L ITERATE .
// // - суммирует числа от 1 до 10 и печатает результат
// {code}
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
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
 TkwARRAY = class(_kwModifier_)
  {* Определяет поддержку массивов в скриптах.
 *Пример:*
[code]
 ARRAY L
 10 LOOP (
  ++
  DUP
  >>>[] L
 )
 DROP
 @ . L ITERATE
 // - печатает числа от 1 до 10
 '' .
 0 @ + L ITERATE .
 // - суммирует числа от 1 до 10 и печатает результат
[code] }
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwARRAY
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwARRAY;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwARRAY

function TkwARRAY.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4DCC157102A8get_var*
//#UC END# *4DCACED80361_4DCC157102A8get_var*
begin
//#UC START# *4DCACED80361_4DCC157102A8get_impl*
 Result := tfw_wmList;
//#UC END# *4DCACED80361_4DCC157102A8get_impl*
end;//TkwARRAY.pm_GetModifier

class function TkwARRAY.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ARRAY';
end;//TkwARRAY.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.