unit CompilationPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "CompilationPack.pas"
// Начат: 12.02.2012 16:13
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::Compilation::CompilationPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompilingWordSelf,
  kwNotImplemented,
  kwINHERITED,
  kwFORWARD,
  kwCtxPushCompiler,
  kwCtxPushFinder,
  kwPopCompilerSetToCtx,
  kwPopFinderSetToCtx
  ;

{$IfEnd} //not NoScripts
end.