{$IfNDef l3RevertedAtomicList_imp}
 
{$Define l3RevertedAtomicList_imp}
 _l3AtomicListPrim_Parent_ = _l3RevertedAtomicList_Parent_;
 {$Include l3AtomicListPrim.imp.pas}
 _l3RevertedAtomicList_ = {mixin} class(_l3AtomicListPrim_)
 end;//_l3RevertedAtomicList_

{$Else l3RevertedAtomicList_imp}

// start class _l3RevertedAtomicList_

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_5423BE6002AA_var*
//#UC END# *47B99D4503A2_5423BE6002AA_var*
begin
//#UC START# *47B99D4503A2_5423BE6002AA_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 if CI.rA^ > CI.rB^ then
   Result := -1
 else
   if CI.rA^ < CI.rB^ then
     Result := 1
   else
     Result := 0;
//#UC END# *47B99D4503A2_5423BE6002AA_impl*
end;//CompareExistingItems


{$Include l3AtomicListPrim.imp.pas}


{$EndIf l3RevertedAtomicList_imp}
