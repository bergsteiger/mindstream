unit CompilationPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/CompilationPack.pas"
// Начат: 12.02.2012 16:13
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeywordsPack::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::CompilationPack
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompilingWordSelf,
  kwPopWordParent,
  kwPopWordProducer,
  kwPopWordName,
  kwNotImplemented,
  kwPopWordPublicateInMainDictionary,
  kwINHERITED,
  kwFORWARD,
  kwCtxPushCompiler,
  kwCtxPushFinder,
  kwPopCompilerSetToCtx,
  kwPopFinderSetToCtx,
  kwPopWordGetParam,
  kwPopWordEndBracket,
  kwPopWordDirectives,
  kwPopWordLeftWordRefValuesCount,
  kwPopWordGetLeftWordRefValue
  ;

{$IfEnd} //not NoScripts
end.