unit kwUses;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwUses.pas"
// Начат: 06.05.2011 11:26
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::IncludesAndUses::IncludesAndUsesPack::Uses
//
// Подлючение внешних модулей в скрипт:
// Пример:
// {code}
// USES
// DocumentNumbers.script
// ;
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
  kwIncluded,
  l3Interfaces,
  l3ParserInterfaces,
  kwCompiledWordPrim,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwUsesLike.imp.pas}
 TkwUses = class(_kwUsesLike_)
  {* Подлючение внешних модулей в скрипт:
Пример:
[code]
USES
 DocumentNumbers.script
;
[code] }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwUses
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwStandardProcedureCloseBracket,
  l3String,
  SysUtils,
  l3Types,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwUses;

{$Include ..\ScriptEngine\kwUsesLike.imp.pas}

// start class TkwUses

class function TkwUses.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'USES';
end;//TkwUses.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwUsesLike.imp.pas}
{$IfEnd} //not NoScripts

end.