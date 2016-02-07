{$IfNDef l3PtrListPrim_imp}

{$Define l3PtrListPrim_imp}
 _l3StandardTypedList_Parent_ = _l3PtrListPrim_Parent_;
 {$Include ..\L3\l3StandardTypedList.imp.pas}
 _l3PtrListPrim_ = {abstract mixin} class(_l3StandardTypedList_)
  {* Примесь для списков указателей. Список НЕ УПРАВЛЯЕТ временем жизни элементов. }
 end;//_l3PtrListPrim_

{$Else l3PtrListPrim_imp}

// start class _l3PtrListPrim_

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_47B941FB0284_var*
//#UC END# *47B94A5C006E_47B941FB0284_var*
begin
//#UC START# *47B94A5C006E_47B941FB0284_impl*
 // - ничего освобождать не нужно
 Pointer(aPlace) := nil;
//#UC END# *47B94A5C006E_47B941FB0284_impl*
end;//FreeItem


{$Include ..\L3\l3StandardTypedList.imp.pas}


{$EndIf l3PtrListPrim_imp}
