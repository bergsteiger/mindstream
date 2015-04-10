unit ExtendedPrimitivesPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/ExtendedPrimitivesPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::ExtendedPrimitives::ExtendedPrimitivesPack
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
  kwSmartEquals,
  kwSmartNotEquals,
  kwRULES
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Chars,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  kwCompiledRules,
  kwStandardProcedureCloseBracket,
  kwBeginLikeCompiledCode,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  SysUtils,
  TypInfo,
  l3Base,
  l3ParserInterfaces,
  kwIntegerFactory,
  kwStringFactory,
  StrUtils
  ;

{$IfEnd} //not NoScripts
end.