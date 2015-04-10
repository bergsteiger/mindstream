{$IfNDef tfwModuleOperationWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwModuleOperationWord.imp.pas"
// Начат: 21.04.2011 20:52
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::tfwModuleOperationWord
//
// Слово для выполнения операции модуля
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwModuleOperationWord_imp}
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _tfwModuleOperationWord_ = {mixin} class(_tfwAutoregisteringWord_)
  {* Слово для выполнения операции модуля }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class procedure RegisterInEngine; override;
 protected
 // protected methods
   class function GetModuleOperationCode: TvcmMOPID; virtual;
 end;//_tfwModuleOperationWord_
{$IfEnd} //not NoScripts AND not NoVCM

{$Else tfwModuleOperationWord_imp}

{$IfNDef tfwModuleOperationWord_imp_impl}
{$Define tfwModuleOperationWord_imp_impl}

{$If not defined(NoScripts) AND not defined(NoVCM)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _tfwModuleOperationWord_

class function _tfwModuleOperationWord_.GetModuleOperationCode: TvcmMOPID;
//#UC START# *4DB079E00084_4DB060930263_var*
//#UC END# *4DB079E00084_4DB060930263_var*
begin
//#UC START# *4DB079E00084_4DB060930263_impl*
 FillChar(Result, SizeOf(Result), $FF);
 Assert(false);
//#UC END# *4DB079E00084_4DB060930263_impl*
end;//_tfwModuleOperationWord_.GetModuleOperationCode

procedure _tfwModuleOperationWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB060930263_var*
//#UC END# *4DAEEDE10285_4DB060930263_var*
begin
//#UC START# *4DAEEDE10285_4DB060930263_impl*
 aCtx.rCaller.Check(vcmDispatcher.ModuleOperation(GetModuleOperationCode));
//#UC END# *4DAEEDE10285_4DB060930263_impl*
end;//_tfwModuleOperationWord_.DoDoIt

class procedure _tfwModuleOperationWord_.RegisterInEngine;
//#UC START# *52A086150180_4DB060930263_var*
var
 l_ToolbarControl : TkwString;
 l_ToolbarControlName : String;
 //l_Mod : TvcmModulesCollectionItem;
 //l_Op : TvcmBaseOperationsCollectionItem;
 //l_ID : TvcmMOPID;
//#UC END# *52A086150180_4DB060930263_var*
begin
//#UC START# *52A086150180_4DB060930263_impl*
 inherited;
 l_ToolbarControlName := Copy(ClassName, 5, Length(ClassName) - 4);
 l_ToolbarControlName := 'bt_' + 'mo_' + l_ToolbarControlName;
 //l_ID := GetModuleOperationCode;
 //l_Mod := g_MenuManager.Modules.FindItemByID(l_ID.rMoID) As TvcmModulesCollectionItem;
 //l_Op := l_Mod.Operations.FindItemByID(l_ID.rOpID) As TvcmBaseOperationsCollectionItem;
 //l_ToolbarControlName := 'bt_' + l_Mod.Name + '_' + l_Op.Name;
 l_ToolbarControl := TkwString.Create(TtfwCStringFactory.C(l_ToolbarControlName));
 try
  try
   l_ToolbarControl.RegisterInstance('контрол::' + l_ToolbarControlName);
  except
   on El3DuplicateItem do
    ;
  end;//try..except
 finally
  FreeAndNil(l_ToolbarControl);
 end;//try..finally
//#UC END# *52A086150180_4DB060930263_impl*
end;//_tfwModuleOperationWord_.RegisterInEngine

{$IfEnd} //not NoScripts AND not NoVCM

{$Else  tfwModuleOperationWord_imp_impl}
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

{$EndIf tfwModuleOperationWord_imp_impl}
{$EndIf tfwModuleOperationWord_imp}
