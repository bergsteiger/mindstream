{$IfNDef l3InterfaceRefListPrim_imp}

{$Define l3InterfaceRefListPrim_imp}
 _l3RefList_Parent_ = _l3InterfaceRefListPrim_Parent_;
 {$Include ..\L3\l3RefList.imp.pas}
 _l3InterfaceRefListPrim_ = {abstract mixin} class(_l3RefList_)
 end;//_l3InterfaceRefListPrim_

{$Else l3InterfaceRefListPrim_imp}

// start class _l3InterfaceRefListPrim_

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
//#UC START# *47B935AF0066_47B9AF6E0228_var*
//#UC END# *47B935AF0066_47B9AF6E0228_var*
begin
//#UC START# *47B935AF0066_47B9AF6E0228_impl*
 aPlace := anItem;
(* Pointer(aPlace) := Pointer(anItem);
 if (Pointer(anItem) <> nil) then
  IUnknown(anItem)._AddRef;*)
//#UC END# *47B935AF0066_47B9AF6E0228_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_47B9AF6E0228_var*
//#UC END# *47B94A5C006E_47B9AF6E0228_var*
begin
//#UC START# *47B94A5C006E_47B9AF6E0228_impl*
 //IUnknown(aPlace) := nil;
 aPlace := nil;
//#UC END# *47B94A5C006E_47B9AF6E0228_impl*
end;//FreeItem


{$Include ..\L3\l3RefList.imp.pas}


{$EndIf l3InterfaceRefListPrim_imp}
