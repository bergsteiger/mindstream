unit kwStandardProcedureCloseBracket;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStandardProcedureCloseBracket.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::StandardProcedureCloseBracket
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCloseBracket
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStandardProcedureCloseBracket = {final scriptword} class(TkwCloseBracket)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStandardProcedureCloseBracket
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwStandardProcedureCloseBracket

class function TkwStandardProcedureCloseBracket.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := ';';
end;//TkwStandardProcedureCloseBracket.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StandardProcedureCloseBracket
 TkwStandardProcedureCloseBracket.RegisterInEngine;
{$IfEnd} //not NoScripts

end.