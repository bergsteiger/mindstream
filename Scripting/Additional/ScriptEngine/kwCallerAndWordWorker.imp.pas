{$IfNDef kwCallerAndWordWorker_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCallerAndWordWorker.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::kwCallerAndWordWorker
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwCallerAndWordWorker_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWordWorkerWord.imp.pas}
 _kwCallerAndWordWorker_ = {mixin} class(_kwWordWorkerWord_)
 protected
 // overridden protected methods
   function AddedParameters: Tl3CStringArray; override;
   function ParamModifiers(aParamIndex: Integer): TtfwWordModifiers; override;
 end;//_kwCallerAndWordWorker_
{$IfEnd} //not NoScripts

{$Else kwCallerAndWordWorker_imp}

{$IfNDef kwCallerAndWordWorker_imp_impl}
{$Define kwCallerAndWordWorker_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwWordWorkerWord.imp.pas}

// start class _kwCallerAndWordWorker_

function _kwCallerAndWordWorker_.AddedParameters: Tl3CStringArray;
//#UC START# *4F3FF55403AB_4F413AC400C9_var*
//#UC END# *4F3FF55403AB_4F413AC400C9_var*
begin
//#UC START# *4F3FF55403AB_4F413AC400C9_impl*
 Result := l3CStringArrayFromS(['Caller']);
//#UC END# *4F3FF55403AB_4F413AC400C9_impl*
end;//_kwCallerAndWordWorker_.AddedParameters

function _kwCallerAndWordWorker_.ParamModifiers(aParamIndex: Integer): TtfwWordModifiers;
//#UC START# *4F4186D50048_4F413AC400C9_var*
//#UC END# *4F4186D50048_4F413AC400C9_var*
begin
//#UC START# *4F4186D50048_4F413AC400C9_impl*
 Result := [tfw_wmObj];
//#UC END# *4F4186D50048_4F413AC400C9_impl*
end;//_kwCallerAndWordWorker_.ParamModifiers

{$IfEnd} //not NoScripts

{$Else  kwCallerAndWordWorker_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWordWorkerWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwCallerAndWordWorker_imp_impl}
{$EndIf kwCallerAndWordWorker_imp}
