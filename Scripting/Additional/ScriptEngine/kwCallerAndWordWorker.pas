unit kwCallerAndWordWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCallerAndWordWorker.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCallerAndWordWorker
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwWordWorkerWordBase,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCallerAndWordWorker = {abstract} class(TkwWordWorkerWordBase)
 protected
 // overridden protected methods
   function AddedParameters: Tl3CStringArray; override;
   function ParamModifiers(aParamIndex: Integer): TtfwWordModifiers; override;
 end;//TkwCallerAndWordWorker
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCallerAndWordWorker

function TkwCallerAndWordWorker.AddedParameters: Tl3CStringArray;
//#UC START# *4F3FF55403AB_4F413AC400C9_var*
//#UC END# *4F3FF55403AB_4F413AC400C9_var*
begin
//#UC START# *4F3FF55403AB_4F413AC400C9_impl*
 Result := l3CStringArrayFromS(['Caller']);
//#UC END# *4F3FF55403AB_4F413AC400C9_impl*
end;//TkwCallerAndWordWorker.AddedParameters

function TkwCallerAndWordWorker.ParamModifiers(aParamIndex: Integer): TtfwWordModifiers;
//#UC START# *4F4186D50048_4F413AC400C9_var*
//#UC END# *4F4186D50048_4F413AC400C9_var*
begin
//#UC START# *4F4186D50048_4F413AC400C9_impl*
 Result := [tfw_wmObj];
//#UC END# *4F4186D50048_4F413AC400C9_impl*
end;//TkwCallerAndWordWorker.ParamModifiers

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCallerAndWordWorker
 TkwCallerAndWordWorker.RegisterClass;
{$IfEnd} //not NoScripts

end.