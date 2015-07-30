unit kwVAR;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "kwVAR.pas"
// Начат: 29.04.2011 22:36
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::VAR
//
// Объявление переменной.
// Пример:
// {code}
// VAR l_Text
// 'Text' >>> l_Text
// l_Text .
// {code}
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwVar
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwVAR = {scriptword} class(TtfwVar)
  {* Объявление переменной. 
Пример: 
[code]
 VAR l_Text 
 'Text' >>> l_Text
 l_Text .
[code] }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVAR
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledVar
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwVAR

class function TkwVAR.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'VAR';
end;//TkwVAR.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация VAR
 TkwVAR.RegisterInEngine;
{$IfEnd} //not NoScripts

end.