unit VarWorkingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "VarWorkingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Basics::VarWorkingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwConst,
  tfwTypeInfo
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwScriptingTypes
  ;

type
 TkwCONST = {final scriptword} class(TtfwConst)
  {* Определяет константу.
Пример:
[code]
 CONST cFake1 5
[code] }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCONST

// start class TkwCONST

class function TkwCONST.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CONST';
end;//TkwCONST.GetWordNameForRegister
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CONST
 TkwCONST.RegisterInEngine;
{$IfEnd} //not NoScripts

end.