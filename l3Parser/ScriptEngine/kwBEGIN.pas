unit kwBEGIN;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwBEGIN.pas"
// Начат: 28.04.2011 23:10
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::CodeBranchingWords::BEGIN
//
// Поддержка скобок BEGIN END в стиле Паскаля.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwBeginLikeWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwBEGIN = {scriptword} class(TtfwBeginLikeWord)
  {* Поддержка скобок BEGIN END в стиле Паскаля. }
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBEGIN
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwEND
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwBEGIN

function TkwBEGIN.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4DB9BB8D0388_var*
//#UC END# *4DB6C99F026E_4DB9BB8D0388_var*
begin
//#UC START# *4DB6C99F026E_4DB9BB8D0388_impl*
 Result := TkwEND;
//#UC END# *4DB6C99F026E_4DB9BB8D0388_impl*
end;//TkwBEGIN.EndBracket

class function TkwBEGIN.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'BEGIN';
end;//TkwBEGIN.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация BEGIN
 TkwBEGIN.RegisterInEngine;
{$IfEnd} //not NoScripts

end.