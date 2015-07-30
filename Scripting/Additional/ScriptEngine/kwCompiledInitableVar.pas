unit kwCompiledInitableVar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Ѕиблиотека "ScriptEngine"
// ћодуль: "kwCompiledInitableVar.pas"
// –одные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::VarProducing::TkwCompiledInitableVar
//
// «аготовочка дл€ отложенной инициализации переменной, чтобы сразу инициализатор не дЄргать, ну и
// поменьше VOID огребать при загрузке модели
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwRuntimeWordWithCode,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _kwCompiledVar_Parent_ = TkwRuntimeWordWithCode;
 {$Include ..\ScriptEngine\kwCompiledVar.imp.pas}
 TkwCompiledInitableVar = class(_kwCompiledVar_)
  {* «аготовочка дл€ отложенной инициализации переменной, чтобы сразу инициализатор не дЄргать, ну и поменьше VOID огребать при загрузке модели }
 end;//TkwCompiledInitableVar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwCompiledVar.imp.pas}


{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// –егистраци€ TkwCompiledInitableVar
 TkwCompiledInitableVar.RegisterClass;
{$IfEnd} //not NoScripts

end.