{$IfNDef l3UncomparabeObjectRefList_imp}

{$Define l3UncomparabeObjectRefList_imp}
 _l3ObjectRefListPrim_Parent_ = _l3UncomparabeObjectRefList_Parent_;
 {$Include l3ObjectRefListPrim.imp.pas}
 _l3UncomparabeObjectRefList_ = {abstract mixin} class(_l3ObjectRefListPrim_)
 end;//_l3UncomparabeObjectRefList_

{$Else l3UncomparabeObjectRefList_imp}

// start class _l3UncomparabeObjectRefList_

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  ); forward;

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B935AF0066_47B99E920196_var*
//#UC END# *47B935AF0066_47B99E920196_var*
begin
//#UC START# *47B935AF0066_47B99E920196_impl*
 aPlace := anItem.Use;
//#UC END# *47B935AF0066_47B99E920196_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_47B99E920196_var*
//#UC END# *47B94A5C006E_47B99E920196_var*
begin
//#UC START# *47B94A5C006E_47B99E920196_impl*
 FreeAndNil(aPlace);
//#UC END# *47B94A5C006E_47B99E920196_impl*
end;//FreeItem


{$Include ..\L3\l3ObjectRefListPrim.imp.pas}


{$EndIf l3UncomparabeObjectRefList_imp}
