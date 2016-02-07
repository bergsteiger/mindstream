{$IfNDef l3ObjectPtrList_imp}
 
{$Define l3ObjectPtrList_imp}
 _l3PtrList_Parent_ = _l3ObjectPtrList_Parent_;
 {$Include ..\L3\l3PtrList.imp.pas}
 _l3ObjectPtrList_ = {mixin} class(_l3PtrList_)
  {* Список указателей на объекты. }
 end;//_l3ObjectPtrList_

{$Else l3ObjectPtrList_imp}

// start class _l3ObjectPtrList_

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_47B57B7800A7_var*
//#UC END# *47B07CF403D0_47B57B7800A7_var*
begin
//#UC START# *47B07CF403D0_47B57B7800A7_impl*
 Result := (A = B);
//#UC END# *47B07CF403D0_47B57B7800A7_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47B57B7800A7_var*
//#UC END# *47B2C42A0163_47B57B7800A7_var*
begin
//#UC START# *47B2C42A0163_47B57B7800A7_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47B57B7800A7_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47B57B7800A7_var*
//#UC END# *47B99D4503A2_47B57B7800A7_var*
begin
//#UC START# *47B99D4503A2_47B57B7800A7_impl*
 Assert(false, 'Критерий сравнения двух нетипизированных объектов на самом деле непонятен');
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Integer(CI.rA^) - Integer(CI.rB^);
//#UC END# *47B99D4503A2_47B57B7800A7_impl*
end;//CompareExistingItems


{$Include ..\L3\l3PtrList.imp.pas}


{$EndIf l3ObjectPtrList_imp}
