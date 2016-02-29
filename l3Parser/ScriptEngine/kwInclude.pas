unit kwInclude;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwInclude.pas"
// Начат: 04.05.2011 22:02
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::IncludesAndUses::IncludesAndUsesPack::Include
//
// Зарезервированное слово: INCLUDE
// Пример:
// {code}
// INCLUDE 'Included.script'
// {code}
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwIncludeLike,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwInclude = {scriptword} class(TtfwIncludeLike)
  {* Зарезервированное слово: INCLUDE
Пример:
[code]
 INCLUDE 'Included.script'
[code] }
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Integer; override;
 end;//TkwInclude
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwIncluded,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwInclude

function TkwInclude.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4DC1949F00E1_var*
//#UC END# *4DB6C99F026E_4DC1949F00E1_var*
begin
//#UC START# *4DB6C99F026E_4DC1949F00E1_impl*
 Result := DisabledEndBracket(aContext, aSilent);
//#UC END# *4DB6C99F026E_4DC1949F00E1_impl*
end;//TkwInclude.EndBracket

class function TkwInclude.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'INCLUDE';
end;//TkwInclude.GetWordNameForRegister

function TkwInclude.AfterWordMaxCount(const aCtx: TtfwContext): Integer;
//#UC START# *4DB9B446039A_4DC1949F00E1_var*
//#UC END# *4DB9B446039A_4DC1949F00E1_var*
begin
//#UC START# *4DB9B446039A_4DC1949F00E1_impl*
 Result := -1;
//#UC END# *4DB9B446039A_4DC1949F00E1_impl*
end;//TkwInclude.AfterWordMaxCount

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Include
 TkwInclude.RegisterInEngine;
{$IfEnd} //not NoScripts

end.