unit kwCompiledInitParam;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwCompiledInitParam.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwCompiledInitParam
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwCompiledPopToVar
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledInitParam = class(TkwCompiledPopToVar)
 public
 // public methods
   constructor Create(aWordToPush: TtfwWord); reintroduce;
 end;//TkwCompiledInitParam
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledInitParam

constructor TkwCompiledInitParam.Create(aWordToPush: TtfwWord);
//#UC START# *55129B7C0319_53DB6E6F0063_var*
//#UC END# *55129B7C0319_53DB6E6F0063_var*
begin
//#UC START# *55129B7C0319_53DB6E6F0063_impl*
 inherited Create(aWordToPush, nil);
//#UC END# *55129B7C0319_53DB6E6F0063_impl*
end;//TkwCompiledInitParam.Create

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledInitParam
 TkwCompiledInitParam.RegisterClass;
{$IfEnd} //not NoScripts

end.