{$IfNDef l3VariantListPrim_imp}
 
{$Define l3VariantListPrim_imp}
 _ItemType_ = Tl3Variant;
 _l3RefList_Parent_ = _l3VariantListPrim_Parent_;
 {$Include l3RefList.imp.pas}
 _l3VariantListPrim_ = {mixin} class(_l3RefList_)
 end;//_l3VariantListPrim_

{$Else l3VariantListPrim_imp}

// start class _l3VariantListPrim_

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  ); forward;

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  ); forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_534515CD039A_var*
//#UC END# *47B07CF403D0_534515CD039A_var*
begin
//#UC START# *47B07CF403D0_534515CD039A_impl*
 if (A = nil) then
  Result := (B = nil) OR B.IsNull
 else
  Result := A.Box.IsSame(B.Box);
//#UC END# *47B07CF403D0_534515CD039A_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B935AF0066_534515CD039A_var*
//#UC END# *47B935AF0066_534515CD039A_var*
begin
//#UC START# *47B935AF0066_534515CD039A_impl*
 aPlace := anItem.Use;
//#UC END# *47B935AF0066_534515CD039A_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_534515CD039A_var*
//#UC END# *47B94A5C006E_534515CD039A_var*
begin
//#UC START# *47B94A5C006E_534515CD039A_impl*
 FreeAndNil(aPlace);
//#UC END# *47B94A5C006E_534515CD039A_impl*
end;//FreeItem


{$Include l3RefList.imp.pas}


{$EndIf l3VariantListPrim_imp}
