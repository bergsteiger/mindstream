unit kwWordWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWordWorkerWord.pas"
// Начат: 26.01.2012 22:09
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WordsDefinition::WordWorkerWord
//
// Определяет слово, которое может работать со словом записанным за ним непосредственно в коде.
// Например как @
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
  kwCompiledWordWorkerWord,
  kwCompiledWordPrim,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwWordWorkerWord.imp.pas}
 TkwWordWorkerWord = class(_kwWordWorkerWord_)
  {* Определяет слово, которое может работать со словом записанным за ним непосредственно в коде. Например как @ }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWordWorkerWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledPopToVar,
  kwCompiledVar,
  kwLeftParam,
  l3Base,
  kwCompiledFunction,
  kwCompiledProcedureWithStackChecking,
  kwCompiledImmediateWordWorkerWord,
  kwInlinedWord,
  kwStandardProcedureCloseBracket,
  kwCompiledProcedure,
  SysUtils,
  l3String,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  TypInfo,
  kwIntegerFactory,
  kwStringFactory,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWordWorkerWord;

{$Include ..\ScriptEngine\kwWordWorkerWord.imp.pas}

// start class TkwWordWorkerWord

class function TkwWordWorkerWord.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WORDWORKER';
end;//TkwWordWorkerWord.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWordWorkerWord.imp.pas}
{$IfEnd} //not NoScripts

end.