unit kwCompiledMembersPath;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwCompiledMembersPath.pas"
// Начат: 15.02.2012 19:27
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::MembersWorking::TkwCompiledMembersPath
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
 TkwCompiledMembersPath = class(TkwRuntimeWordWithCode)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledMembersPath
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledMembersPath

procedure TkwCompiledMembersPath.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F3BCEC00027_var*
//#UC END# *4DAEEDE10285_4F3BCEC00027_var*
begin
//#UC START# *4DAEEDE10285_4F3BCEC00027_impl*
 RunnerError('Нельзя выполнять. Слово служит лишь контейнером для транспортировки дркугис слов', aCtx);
//#UC END# *4DAEEDE10285_4F3BCEC00027_impl*
end;//TkwCompiledMembersPath.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledMembersPath
 TkwCompiledMembersPath.RegisterClass;
{$IfEnd} //not NoScripts

end.