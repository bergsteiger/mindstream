unit tfwConstLike;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwConstLike.pas"
// Начат: 15.02.2012 18:29
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TtfwConstLike
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwNewWord,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwConstLike = {abstract} class(TtfwNewWord)
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//TtfwConstLike
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwRuntimeWordWithCodeExecution,
  kwConstLikeCompiled
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwConstLike

function TtfwConstLike.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F3BC124004D_var*
//#UC END# *4DB6C99F026E_4F3BC124004D_var*
begin
//#UC START# *4DB6C99F026E_4F3BC124004D_impl*
 Result := DisabledEndBracket(aContext, aSilent);
//#UC END# *4DB6C99F026E_4F3BC124004D_impl*
end;//TtfwConstLike.EndBracket

function TtfwConstLike.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4F3BC124004D_var*
//#UC END# *4DB9B446039A_4F3BC124004D_var*
begin
//#UC START# *4DB9B446039A_4F3BC124004D_impl*
 Result := 1;
//#UC END# *4DB9B446039A_4F3BC124004D_impl*
end;//TtfwConstLike.AfterWordMaxCount

function TtfwConstLike.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F3BC124004D_var*
//#UC END# *4DBAEE0D028D_4F3BC124004D_var*
begin
//#UC START# *4DBAEE0D028D_4F3BC124004D_impl*
 Result := TkwConstLikeCompiled;
//#UC END# *4DBAEE0D028D_4F3BC124004D_impl*
end;//TtfwConstLike.CompiledWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwConstLike
 TtfwConstLike.RegisterClass;
{$IfEnd} //not NoScripts

end.