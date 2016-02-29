unit tfwScriptEngineEX;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwScriptEngineEX.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::ScriptEngine::TtfwScriptEngineEX
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwScriptEngineEX = class(TtfwScriptEngine)
 end;//TtfwScriptEngineEX
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwStringWords,
  CodeFlowWordsPack,
  CompilationPack,
  WordsDefinitionPack,
  IncludesAndUsesPack,
  EtalonsWorkingPack,
  MouseInputPack
  {$If not defined(NoScripts) AND not defined(NoVCL)}
  ,
  ModalDialogsKeywordsPack
  {$IfEnd} //not NoScripts AND not NoVCL
  ,
  RTTIPack
  {$If not defined(NoScripts) AND not defined(NoVCL)}
  ,
  KeyboardInputPack
  {$IfEnd} //not NoScripts AND not NoVCL
  ,
  ObjectFromstackWords,
  CodeBranchingPack,
  ScriptsCompilingAndProcessingPack
  {$If not defined(NoScripts) AND not defined(NoWindows)}
  ,
  WinUtilsPack
  {$IfEnd} //not NoScripts AND not NoWindows
  
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


{$IfEnd} //not NoScripts
end.