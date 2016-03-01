{$IfNDef tfwDictionaryListPrim_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryListPrim.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::tfwDictionaryListPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwDictionaryListPrim_imp}
{$If not defined(NoScripts)}
 {$Define l3Items_NoChanging}

 {$Undef l3Items_NeedsBeforeFreeItem}

 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UncomparabeObjectRefList.imp.pas}
 _tfwDictionaryListPrim_ = {abstract mixin} class(_l3UncomparabeObjectRefList_)
 end;//_tfwDictionaryListPrim_
{$Else}

 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UncomparabeObjectRefList.imp.pas}
 _tfwDictionaryListPrim_ = _l3UncomparabeObjectRefList_;

{$IfEnd} //not NoScripts

{$Else tfwDictionaryListPrim_imp}

{$If not defined(NoScripts)}

// start class _tfwDictionaryListPrim_

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_55B0E6F2013C_var*
//#UC END# *47B2C42A0163_55B0E6F2013C_var*
begin
//#UC START# *47B2C42A0163_55B0E6F2013C_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B2C42A0163_55B0E6F2013C_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


{$Include l3UncomparabeObjectRefList.imp.pas}


{$IfEnd} //not NoScripts

{$EndIf tfwDictionaryListPrim_imp}
