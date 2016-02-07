{$IfNDef l3AtomicList_imp}
 
{$Define l3AtomicList_imp}
 _l3AtomicListPrim_Parent_ = _l3AtomicList_Parent_;
 {$Include ..\L3\l3AtomicListPrim.imp.pas}
 _l3AtomicList_ = {mixin} class(_l3AtomicListPrim_)
  {* Список АТОМАРНЫХ элементов, без всякого подсчёта ссылок и управления временем жизни }
 end;//_l3AtomicList_

{$Else l3AtomicList_imp}

// start class _l3AtomicList_

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47A1B04702C2_var*
//#UC END# *47B99D4503A2_47A1B04702C2_var*
begin
//#UC START# *47B99D4503A2_47A1B04702C2_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 if CI.rA^ > CI.rB^ then
   Result := 1
 else
   if CI.rA^ < CI.rB^ then
     Result := -1
   else
     Result := 0;
//#UC END# *47B99D4503A2_47A1B04702C2_impl*
end;//CompareExistingItems


{$Include ..\L3\l3AtomicListPrim.imp.pas}


{$EndIf l3AtomicList_imp}
