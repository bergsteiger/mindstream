unit kwEND;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwEND.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::END
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
 TkwEND = {final scriptword} class(TkwCloseBracket)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEND
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwEND

class function TkwEND.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'END';
end;//TkwEND.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация END
 TkwEND.RegisterInEngine;
{$IfEnd} //not NoScripts

end.