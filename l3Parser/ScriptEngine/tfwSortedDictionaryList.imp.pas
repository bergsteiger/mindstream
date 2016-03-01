{$IfNDef tfwSortedDictionaryList_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwSortedDictionaryList.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::tfwSortedDictionaryList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwSortedDictionaryList_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDictionaryListPrim.imp.pas}
 _tfwSortedDictionaryList_ = {abstract mixin} class(_tfwDictionaryListPrim_)
 protected
 // overridden protected methods
   procedure InitFields; override;
 end;//_tfwSortedDictionaryList_
{$Else}

 {$Include ..\ScriptEngine\tfwDictionaryListPrim.imp.pas}
 _tfwSortedDictionaryList_ = _tfwDictionaryListPrim_;

{$IfEnd} //not NoScripts

{$Else tfwSortedDictionaryList_imp}

{$If not defined(NoScripts)}

// start class _tfwSortedDictionaryList_

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_55B0E773009A_var*
//#UC END# *47B99D4503A2_55B0E773009A_var*
begin
//#UC START# *47B99D4503A2_55B0E773009A_impl*
 Result := l3Compare(l3PCharLen(CI.rA.FileName), l3PCharLen(CI.rB.FileName), l3_siCaseUnsensitive);
//#UC END# *47B99D4503A2_55B0E773009A_impl*
end;//CompareExistingItems


{$Include ..\ScriptEngine\tfwDictionaryListPrim.imp.pas}

// start class _tfwSortedDictionaryList_

procedure _tfwSortedDictionaryList_.InitFields;
//#UC START# *47A042E100E2_55B0E773009A_var*
//#UC END# *47A042E100E2_55B0E773009A_var*
begin
//#UC START# *47A042E100E2_55B0E773009A_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_55B0E773009A_impl*
end;//_tfwSortedDictionaryList_.InitFields

{$IfEnd} //not NoScripts

{$EndIf tfwSortedDictionaryList_imp}
