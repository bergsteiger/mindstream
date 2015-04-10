unit kwTryFinally;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTryFinally.pas"
// Начат: 29.04.2011 18:04
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TryFinally
//
// Полный аналог try finally Delphi
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
  tfwScriptingInterfaces,
  kwDualCompiledWordContainer,
  kwCompiledWordPrim,
  l3Interfaces,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwDualWord.imp.pas}
 TkwTryFinally = class(_tfwDualWord_)
  {* Полный аналог try finally Delphi }
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
   function MedianBracket: RtfwWord; override;
   function MakeDualCompiled(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim;
     aCompiled2: TkwCompiledWordPrim): TkwDualCompiledWordContainer; override;
   function MedianBracket2: RtfwWord; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTryFinally
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledTryFinally,
  kwCompiledTryExcept,
  kwEND,
  kwFINALLY,
  kwEXCEPT,
  SysUtils,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwTryFinally;

{$Include ..\ScriptEngine\tfwDualWord.imp.pas}

// start class TkwTryFinally

function TkwTryFinally.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4DBAC542005F_var*
//#UC END# *4DB6C99F026E_4DBAC542005F_var*
begin
//#UC START# *4DB6C99F026E_4DBAC542005F_impl*
 Result := TkwEND;
//#UC END# *4DB6C99F026E_4DBAC542005F_impl*
end;//TkwTryFinally.EndBracket

function TkwTryFinally.MedianBracket: RtfwWord;
//#UC START# *4DBAC41301F2_4DBAC542005F_var*
//#UC END# *4DBAC41301F2_4DBAC542005F_var*
begin
//#UC START# *4DBAC41301F2_4DBAC542005F_impl*
 Result := TkwFINALLY;
//#UC END# *4DBAC41301F2_4DBAC542005F_impl*
end;//TkwTryFinally.MedianBracket

function TkwTryFinally.MakeDualCompiled(const aContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim;
  aCompiled2: TkwCompiledWordPrim): TkwDualCompiledWordContainer;
//#UC START# *4DBAC44D02CC_4DBAC542005F_var*
//#UC END# *4DBAC44D02CC_4DBAC542005F_var*
begin
//#UC START# *4DBAC44D02CC_4DBAC542005F_impl*
 CompilerAssert(aCompiled2 <> nil, 'Нет второй половины', aContext);
 CompilerAssert(aCompiled2.Key <> nil, 'Нет стереотипа второй половины', aContext);
 if (TtfwKeyWord(aCompiled2.Key).Word.ClassType = TkwFINALLY) then
  Result := TkwCompiledTryFinally.Create(aCompiled, aCompiled2)
 else
 if (TtfwKeyWord(aCompiled2.Key).Word.ClassType = TkwEXCEPT) then
  Result := TkwCompiledTryExcept.Create(aCompiled, aCompiled2)
 else
 begin
  Result := nil;
  CompilerAssert(false, 'Неизвестная средняя скобка', aContext);
 end;//else
(* Case aMedianNum of
  1:
   if aCompiled2.Key.Word.ClassType =
   Result := TkwCompiledTryFinally.Create(aCompiled, aCompiled2);
  2:
   Result := TkwCompiledTryExcept.Create(aCompiled, aCompiled2);
  else
  begin
   Result := nil;
   CompilerAssert(false, 'Неизвестная средняя скобка', aContext);
  end;//else
 end;//Case aMedianNum*)
//#UC END# *4DBAC44D02CC_4DBAC542005F_impl*
end;//TkwTryFinally.MakeDualCompiled

function TkwTryFinally.MedianBracket2: RtfwWord;
//#UC START# *4DBADF3E02CC_4DBAC542005F_var*
//#UC END# *4DBADF3E02CC_4DBAC542005F_var*
begin
//#UC START# *4DBADF3E02CC_4DBAC542005F_impl*
 Result := TkwEXCEPT;
//#UC END# *4DBADF3E02CC_4DBAC542005F_impl*
end;//TkwTryFinally.MedianBracket2

class function TkwTryFinally.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'TRY';
end;//TkwTryFinally.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualWord.imp.pas}
{$IfEnd} //not NoScripts

end.