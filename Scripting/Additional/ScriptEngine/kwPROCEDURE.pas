unit kwPROCEDURE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPROCEDURE.pas"
// Начат: 04.05.2011 12:24
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WordsDefinition::PROCEDURE
//
// Поддержка определения процедуры в стиле Паскаля:
// {code}
// PROCEDURE Choice
// 
// BEGIN
// CASE
// 1 ( 1 . )
// 2 ( 2 . )
// DEFAULT ( 'else' . )
// ENDCASE
// END
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
  l3Interfaces,
  tfwScriptingInterfaces,
  kwCompiledWordPrim,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwStandardProcedureWithStackChecking.imp.pas}
 TkwPROCEDURE = class(_tfwStandardProcedureWithStackChecking_)
  {* Поддержка определения процедуры в стиле Паскаля:
[code]
PROCEDURE Choice

BEGIN
 CASE
  1 ( 1 . )
  2 ( 2 . )
  DEFAULT ( 'else' . )
 ENDCASE
END
;
[code] }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPROCEDURE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledProcedureWithStackChecking,
  kwStandardProcedureCloseBracket,
  kwCompiledProcedure,
  SysUtils,
  l3String,
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

type _Instance_R_ = TkwPROCEDURE;

{$Include ..\ScriptEngine\tfwStandardProcedureWithStackChecking.imp.pas}

// start class TkwPROCEDURE

class function TkwPROCEDURE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'PROCEDURE';
end;//TkwPROCEDURE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStandardProcedureWithStackChecking.imp.pas}
{$IfEnd} //not NoScripts

end.