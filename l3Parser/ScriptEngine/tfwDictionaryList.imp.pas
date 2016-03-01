{$IfNDef tfwDictionaryList_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryList.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::tfwDictionaryList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwDictionaryList_imp}
{$If not defined(NoScripts)}
 {$Define l3Items_NoSort}

 {$Include ..\ScriptEngine\tfwDictionaryListPrim.imp.pas}
 _tfwDictionaryList_ = {abstract mixin} class(_tfwDictionaryListPrim_)
 end;//_tfwDictionaryList_
{$Else}

 {$Include ..\ScriptEngine\tfwDictionaryListPrim.imp.pas}
 _tfwDictionaryList_ = _tfwDictionaryListPrim_;

{$IfEnd} //not NoScripts

{$Else tfwDictionaryList_imp}

{$If not defined(NoScripts)}

// start class _tfwDictionaryList_

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_55A63D8C00F0_var*
//#UC END# *47B99D4503A2_55A63D8C00F0_var*
begin
//#UC START# *47B99D4503A2_55A63D8C00F0_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_55A63D8C00F0_impl*
end;//CompareExistingItems


{$Include ..\ScriptEngine\tfwDictionaryListPrim.imp.pas}


{$IfEnd} //not NoScripts

{$EndIf tfwDictionaryList_imp}
