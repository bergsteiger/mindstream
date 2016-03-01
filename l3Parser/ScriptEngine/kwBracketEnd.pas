unit kwBracketEnd;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwBracketEnd.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::CodeBranchingWords::BracketEnd
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
 TkwBracketEnd = {final scriptword} class(TkwCloseBracket)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBracketEnd
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwBracketEnd

class function TkwBracketEnd.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := ')';
end;//TkwBracketEnd.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация BracketEnd
 TkwBracketEnd.RegisterInEngine;
{$IfEnd} //not NoScripts

end.