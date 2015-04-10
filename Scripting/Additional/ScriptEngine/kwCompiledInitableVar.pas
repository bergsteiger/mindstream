unit kwCompiledInitableVar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledInitableVar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::VarProducing::TkwCompiledInitableVar
//
// Заготовочка для отложенной инициализации переменной, чтобы сразу инициализатор не дёргать, ну и
// поменьше VOID огребать при загрузке модели
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
  kwRuntimeWordWithCode,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _kwCompiledVar_Parent_ = TkwRuntimeWordWithCode;
 {$Include ..\ScriptEngine\kwCompiledVar.imp.pas}
 TkwCompiledInitableVar = class(_kwCompiledVar_)
  {* Заготовочка для отложенной инициализации переменной, чтобы сразу инициализатор не дёргать, ну и поменьше VOID огребать при загрузке модели }
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
end.