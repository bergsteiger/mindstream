{$IfNDef l3DataRefList_imp}
 
{$Define l3DataRefList_imp}
 _l3RefList_Parent_ = _l3DataRefList_Parent_;
 {$Include ..\L3\l3RefList.imp.pas}
 _l3DataRefList_ = {mixin} class(_l3RefList_)
  {* —писок ссылок на данные. ”правл€ет жизненным циклом указателей. }
 end;//_l3DataRefList_

{$Else l3DataRefList_imp}

// start class _l3DataRefList_

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


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

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_47B5877A02EE_var*
//#UC END# *47B07CF403D0_47B5877A02EE_var*
begin
//#UC START# *47B07CF403D0_47B5877A02EE_impl*
 Result := (A = B);
//#UC END# *47B07CF403D0_47B5877A02EE_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47B5877A02EE_var*
//#UC END# *47B2C42A0163_47B5877A02EE_var*
begin
//#UC START# *47B2C42A0163_47B5877A02EE_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47B5877A02EE_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B935AF0066_47B5877A02EE_var*
//#UC END# *47B935AF0066_47B5877A02EE_var*
begin
//#UC START# *47B935AF0066_47B5877A02EE_impl*
 aPlace := anItem;
//#UC END# *47B935AF0066_47B5877A02EE_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_47B5877A02EE_var*
//#UC END# *47B94A5C006E_47B5877A02EE_var*
begin
//#UC START# *47B94A5C006E_47B5877A02EE_impl*
 l3System.FreeLocalMem(aPlace);
//#UC END# *47B94A5C006E_47B5877A02EE_impl*
end;//FreeItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47B5877A02EE_var*
//#UC END# *47B99D4503A2_47B5877A02EE_var*
begin
//#UC START# *47B99D4503A2_47B5877A02EE_impl*
 Assert(false, 'Ќепон€тно как сравнивать нетипизированные указатели');
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Integer(CI.rA^) - Integer(CI.rB^);
//#UC END# *47B99D4503A2_47B5877A02EE_impl*
end;//CompareExistingItems


{$Include ..\L3\l3RefList.imp.pas}


{$EndIf l3DataRefList_imp}
