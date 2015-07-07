unit kwRULES;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwRULES.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ExtendedPrimitives::ExtendedPrimitivesPack::RULES
//
// Аналог CASE и трансформаторов в MDP. Если условие выполняется, то выполняется следующий за ним
// оператор и осуществляется выход
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
  l3Interfaces,
  l3ParserInterfaces,
  kwCompiledWordPrim,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwBeginLikeWord.imp.pas}
 TkwRULES = {final} class(_tfwBeginLikeWord_)
  {* Аналог CASE и трансформаторов в MDP. Если условие выполняется, то выполняется следующий за ним оператор и осуществляется выход }
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwRULES
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledRules,
  kwStandardProcedureCloseBracket,
  kwBeginLikeCompiledCode,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  SysUtils,
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

type _Instance_R_ = TkwRULES;

{$Include ..\ScriptEngine\tfwBeginLikeWord.imp.pas}

// start class TkwRULES

function TkwRULES.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F51EC180118_var*
//#UC END# *4DB6C99F026E_4F51EC180118_var*
begin
//#UC START# *4DB6C99F026E_4F51EC180118_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F51EC180118_impl*
end;//TkwRULES.EndBracket

class function TkwRULES.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'RULES';
end;//TkwRULES.GetWordNameForRegister

function TkwRULES.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F51EC180118_var*
//#UC END# *4DBAEE0D028D_4F51EC180118_var*
begin
//#UC START# *4DBAEE0D028D_4F51EC180118_impl*
 Result := TkwCompiledRules;
//#UC END# *4DBAEE0D028D_4F51EC180118_impl*
end;//TkwRULES.CompiledWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwBeginLikeWord.imp.pas}
{$IfEnd} //not NoScripts

end.