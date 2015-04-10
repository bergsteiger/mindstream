unit kwStringSplit;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStringSplit.pas"
// Начат: 21.12.2011 20:39
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::TkwStringSplit
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
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
 TkwStringSplit = class(_tfwDualStrWord_)
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
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringSplit
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwStringSplit;

{$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwDualStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.