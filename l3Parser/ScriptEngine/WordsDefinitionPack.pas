unit WordsDefinitionPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "WordsDefinitionPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::WordsDefinition::WordsDefinitionPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwProcedure
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledFunction,
  SysUtils,
  l3Base,
  tfwScriptingInterfaces,
  kwCompiledWordPrim,
  l3Interfaces,
  tfwScriptingTypes
  ;

type
 TkwFUNCTION = {final scriptword} class(TtfwProcedure)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//TkwFUNCTION

// start class TkwFUNCTION

class function TkwFUNCTION.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FUNCTION';
end;//TkwFUNCTION.GetWordNameForRegister

function TkwFUNCTION.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F3BEDEB009F_var*
//#UC END# *4DBAEE0D028D_4F3BEDEB009F_var*
begin
//#UC START# *4DBAEE0D028D_4F3BEDEB009F_impl*
 Result := TkwCompiledFunction;
//#UC END# *4DBAEE0D028D_4F3BEDEB009F_impl*
end;//TkwFUNCTION.CompiledWordClass

type
 TkwNewWord = {final scriptword} class(TtfwProcedure)
  {* Определение новых слов. Пример: 
[code]
: Hello
 3 FOR
  'Hello' .
 NEXT
;
[code] }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNewWord

// start class TkwNewWord

class function TkwNewWord.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := ':';
end;//TkwNewWord.GetWordNameForRegister

type
 TkwOPERATOR = {final scriptword} class(TtfwProcedure)
  {* Определяет операторы, которые могут принимать слова как слева, так и справа }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function AddedParameters: Tl3CStringArray; override;
 end;//TkwOPERATOR

// start class TkwOPERATOR

class function TkwOPERATOR.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'OPERATOR';
end;//TkwOPERATOR.GetWordNameForRegister

function TkwOPERATOR.AddedParameters: Tl3CStringArray;
//#UC START# *4F3FF55403AB_53E466AC0341_var*
//#UC END# *4F3FF55403AB_53E466AC0341_var*
begin
//#UC START# *4F3FF55403AB_53E466AC0341_impl*
 Result := nil;
//#UC END# *4F3FF55403AB_53E466AC0341_impl*
end;//TkwOPERATOR.AddedParameters

type
 TkwWordWorker = {final scriptword} class(TtfwProcedure)
  {* Определяет слово, которое может работать со словом записанным за ним непосредственно в коде. Например как @ }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function AddedParameters: Tl3CStringArray; override;
 end;//TkwWordWorker

// start class TkwWordWorker

class function TkwWordWorker.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WORDWORKER';
end;//TkwWordWorker.GetWordNameForRegister

function TkwWordWorker.AddedParameters: Tl3CStringArray;
//#UC START# *4F3FF55403AB_4F2196CA01FE_var*
//#UC END# *4F3FF55403AB_4F2196CA01FE_var*
begin
//#UC START# *4F3FF55403AB_4F2196CA01FE_impl*
 Result := l3CStringArrayFromS(['WordToWork']);
//#UC END# *4F3FF55403AB_4F2196CA01FE_impl*
end;//TkwWordWorker.AddedParameters
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация FUNCTION
 TkwFUNCTION.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация NewWord
 TkwNewWord.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация OPERATOR
 TkwOPERATOR.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация WordWorker
 TkwWordWorker.RegisterInEngine;
{$IfEnd} //not NoScripts

end.