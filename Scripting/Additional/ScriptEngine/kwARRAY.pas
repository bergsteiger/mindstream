unit kwARRAY;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwARRAY.pas"
// Начат: 12.05.2011 21:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ARRAY
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwModifier,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwARRAY = {scriptword} class(TkwModifier)
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
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwARRAY
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

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
// Регистрация ARRAY
 TkwARRAY.RegisterInEngine;
{$IfEnd} //not NoScripts

end.