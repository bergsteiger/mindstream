unit kwFINALLY;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwFINALLY.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::FINALLY
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwMedianBacket
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwFINALLY = {final scriptword} class(TkwMedianBacket)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFINALLY
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFINALLY

class function TkwFINALLY.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FINALLY';
end;//TkwFINALLY.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация FINALLY
 TkwFINALLY.RegisterInEngine;
{$IfEnd} //not NoScripts

end.