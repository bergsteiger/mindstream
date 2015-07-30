unit kwStringSplit;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwStringSplit.pas"
// Начат: 21.12.2011 20:39
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwStringSplit
//
// Разделяет строку на две по заданному разделителю.
// 
// Пример:
// {code}
// 'ABC:DEF' ':' string:Split
// {code}
// Получаем на стеке:
// 'ABC' ':DEF'
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDualStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStringSplit = class(TtfwDualStrWord)
  {* Разделяет строку на две по заданному разделителю.

Пример:
[code]
'ABC:DEF' ':' string:Split
[code]
Получаем на стеке:
'ABC' ':DEF' }
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Il3CString;
     const aStr2: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringSplit
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStringSplit

procedure TkwStringSplit.DoStrings(const aCtx: TtfwContext;
  const aStr1: Il3CString;
  const aStr2: Il3CString);
//#UC START# *4DD0D021034C_4EF20B8800E7_var*
var
 l_P : Il3CString;
 l_S : Il3CString;
 l_Len : Integer;
//#UC END# *4DD0D021034C_4EF20B8800E7_var*
begin
//#UC START# *4DD0D021034C_4EF20B8800E7_impl*
 l_Len := l3Len(aStr2);
 if (l_Len = 1) then
  l3Split(aStr1, l3Char(aStr2, 0), l_P, l_S)
 else
  l3Split(aStr1, aStr2, l_P, l_S);
 aCtx.rEngine.PushString(l_P);
 aCtx.rEngine.PushString(l_S);
//#UC END# *4DD0D021034C_4EF20B8800E7_impl*
end;//TkwStringSplit.DoStrings

class function TkwStringSplit.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EF20B8800E7_var*
//#UC END# *4DB0614603C8_4EF20B8800E7_var*
begin
//#UC START# *4DB0614603C8_4EF20B8800E7_impl*
 Result := 'string:Split';
//#UC END# *4DB0614603C8_4EF20B8800E7_impl*
end;//TkwStringSplit.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwStringSplit
 TkwStringSplit.RegisterInEngine;
{$IfEnd} //not NoScripts

end.