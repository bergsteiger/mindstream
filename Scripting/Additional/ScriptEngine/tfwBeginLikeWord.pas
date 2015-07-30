unit tfwBeginLikeWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwBeginLikeWord.pas"
// Начат: 29.04.2011 21:02
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TtfwBeginLikeWord
//
// Поддержка слов-скобок.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwAnonimousWord,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwBeginLikeWord = {abstract} class(TtfwAnonimousWord)
  {* Поддержка слов-скобок. }
 protected
 // overridden protected methods
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//TtfwBeginLikeWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwBeginLikeCompiledCode
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwBeginLikeWord

procedure TtfwBeginLikeWord.AfterCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4DBAEF29031F_var*
//#UC END# *4DB6CE2302C9_4DBAEF29031F_var*
begin
//#UC START# *4DB6CE2302C9_4DBAEF29031F_impl*
 DoCompiledWord(aCompiled, aPrevContext);
 inherited;
//#UC END# *4DB6CE2302C9_4DBAEF29031F_impl*
end;//TtfwBeginLikeWord.AfterCompile

function TtfwBeginLikeWord.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4DBAEF29031F_var*
//#UC END# *4DBAEE0D028D_4DBAEF29031F_var*
begin
//#UC START# *4DBAEE0D028D_4DBAEF29031F_impl*
 Result := TkwBeginLikeCompiledCode;
//#UC END# *4DBAEE0D028D_4DBAEF29031F_impl*
end;//TtfwBeginLikeWord.CompiledWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwBeginLikeWord
 TtfwBeginLikeWord.RegisterClass;
{$IfEnd} //not NoScripts

end.