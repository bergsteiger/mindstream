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
{$ENDIF} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwScriptEngineEX = class(TtfwScriptEngine)
 end;//TtfwScriptEngineEX
{$ENDIF} //not NoScripts

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
  {$ENDIF} //not NoScripts AND not NoVCL
  ,
  RTTIPack
  {$If not defined(NoScripts) AND not defined(NoVCL)}
  ,
  KeyboardInputPack
  {$ENDIF} //not NoScripts AND not NoVCL
  ,
  ObjectFromstackWords,
  CodeBranchingPack,
  ScriptsCompilingAndProcessingPack
  {$If not defined(NoScripts) AND not defined(NoWindows)}
  ,
  WinUtilsPack
  {$ENDIF} //not NoScripts AND not NoWindows
  
  ;
{$ENDIF} //not NoScripts

{$If not defined(NoScripts)}


{$ENDIF} //not NoScripts
end.