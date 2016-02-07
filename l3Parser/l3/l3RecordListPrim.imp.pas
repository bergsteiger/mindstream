{$IfNDef l3RecordListPrim_imp}

 
{$Define l3RecordListPrim_imp}
 _l3RecordListPrimPrim_Parent_ = _l3RecordListPrim_Parent_;
 {$Include ..\L3\l3RecordListPrimPrim.imp.pas}
 _l3RecordListPrim_ = {mixin} class(_l3RecordListPrimPrim_)
  {* Список записей }
 end;//_l3RecordListPrim_

{$Else l3RecordListPrim_imp}

// start class _l3RecordListPrim_

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_4B223ADC02BF_var*
//#UC END# *47B94A5C006E_4B223ADC02BF_var*
begin
//#UC START# *47B94A5C006E_4B223ADC02BF_impl*
 Finalize(aPlace);
//#UC END# *47B94A5C006E_4B223ADC02BF_impl*
end;//FreeItem


{$Include ..\L3\l3RecordListPrimPrim.imp.pas}


{$EndIf l3RecordListPrim_imp}
