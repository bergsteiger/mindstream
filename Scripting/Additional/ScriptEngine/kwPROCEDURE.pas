unit kwPROCEDURE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwPROCEDURE.pas"
// Начат: 04.05.2011 12:24
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::WordsDefinition::PROCEDURE
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStandardProcedure,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwStandardProcedureWithStackChecking.imp.pas}
 TkwPROCEDURE = {scriptword} class(_tfwStandardProcedureWithStackChecking_)
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
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPROCEDURE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledProcedureWithStackChecking
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// Регистрация PROCEDURE
 TkwPROCEDURE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.