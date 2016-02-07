{$IfNDef l3InterfacePtrListPrim_imp}


{$Define l3InterfacePtrListPrim_imp}
 _l3PtrListPrim_Parent_ = _l3InterfacePtrListPrim_Parent_;
 {$Include ..\L3\l3PtrListPrim.imp.pas}
 _l3InterfacePtrListPrim_ = {mixin} class(_l3PtrListPrim_)
 end;//_l3InterfacePtrListPrim_

{$Else l3InterfacePtrListPrim_imp}

// start class _l3InterfacePtrListPrim_

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B935AF0066_4A6FFCC00354_var*
//#UC END# *47B935AF0066_4A6FFCC00354_var*
begin
//#UC START# *47B935AF0066_4A6FFCC00354_impl*
 Pointer(aPlace) := Pointer(anItem);
//#UC END# *47B935AF0066_4A6FFCC00354_impl*
end;//FillItem


{$Include ..\L3\l3PtrListPrim.imp.pas}


{$EndIf l3InterfacePtrListPrim_imp}
