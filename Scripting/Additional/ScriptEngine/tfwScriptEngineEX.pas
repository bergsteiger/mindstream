unit tfwScriptEngineEX;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwScriptEngineEX.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::ScriptEngine::TtfwScriptEngineEX
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
  EditorWordsPack,
  VCLSupportPack,
  StandartWordsPack,
  tfwStringWords,
  CodeFlowWordsPack,
  CompilationPack,
  StereotypingPack,
  ModifiersPack,
  BasicsPack,
  WordsDefinitionPack,
  VarProducingPack,
  IncludesAndUsesPack,
  MembersWorkingPack,
  TypeCheckingPack,
  EditorFromStackKeyWordsPack,
  FileProcessingPack,
  ArrayProcessingPack,
  ExtendedPrimitivesPack,
  SysUtilsPack,
  EtalonsWorkingPack,
  kwVTControlsPack,
  QueryCardProcessingPack
  {$If not defined(NoScripts) AND not defined(NoVCM)}
  ,
  VCMWordsPack
  {$IfEnd} //not NoScripts AND not NoVCM
  ,
  ControlsProcessingPack,
  CurrentEditorWordsPack,
  WinUtilsPack,
  MouseInputPack,
  EditorParaCoordsToScreenPack,
  MenuWordsPack,
  ModalDialogsKeywordsPack,
  RTTIPack,
  KeyboardInputPack,
  vtOutlinerWordsPack,
  kwFiltersAndGeneratorsPack
  {$If defined(Nemesis) AND not defined(NoScripts)}
  ,
  StatusBarWords
  {$IfEnd} //Nemesis AND not NoScripts
  ,
  FormsProcessingPack
  {$If not defined(NoScripts) AND not defined(NoVGScene)}
  ,
  VGSceneWordsPack
  {$IfEnd} //not NoScripts AND not NoVGScene
  ,
  ObjectFromstackWords,
  TreeViewWordsPack,
  FontWordsPack,
  CodeBranchingPack,
  VarWorkingPack,
  SubPanalWordsPack,
  ImageEnPack
  {$If not defined(NoScripts) AND not defined(NoVGScene)}
  ,
  ReminderWordsPack
  {$IfEnd} //not NoScripts AND not NoVGScene
  ,
  InterfacedNodeWords,
  ScriptsCompilingAndProcessingPack
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


{$IfEnd} //not NoScripts
end.