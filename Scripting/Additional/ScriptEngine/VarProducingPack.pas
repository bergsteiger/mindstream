unit VarProducingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "VarProducingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::VarProducing::VarProducingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordProducer,
  kwInitedVarProducerPrim,
  kwInitedVarProducer,
  kwVarProducer,
  kwNamedInitedVarProducer,
  kwAutolinkProducer,
  kwNamedAutolinkProducer
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledInitedVarProducer,
  SysUtils,
  kwCompiledVarProducer,
  kwCompiledNamedInitedVarProducer,
  kwCompiledAutolinkProducer,
  kwCompiledNamedAutolinkProducer
  ;

{$IfEnd} //not NoScripts
end.