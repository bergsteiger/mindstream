unit kwConstLikeCompiled;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwConstLikeCompiled.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwConstLikeCompiled
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwRuntimeWordWithCodeExecution,
  TypInfo,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwConstLikeCompiled = class(TkwRuntimeWordWithCodeExecution)
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwConstLikeCompiled
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwConstLikeCompiled

function TkwConstLikeCompiled.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_551E87F00212_var*
//#UC END# *551544E2001A_551E87F00212_var*
begin
//#UC START# *551544E2001A_551E87F00212_impl*
 Result := GetCode(aCtx)[0].GetResultTypeInfo(aCtx);
//#UC END# *551544E2001A_551E87F00212_impl*
end;//TkwConstLikeCompiled.GetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwConstLikeCompiled
 TkwConstLikeCompiled.RegisterClass;
{$IfEnd} //not NoScripts

end.