{$IfNDef l3DataPtrList_imp}
 
{$Define l3DataPtrList_imp}
 _l3PtrList_Parent_ = _l3DataPtrList_Parent_;
 {$Include l3PtrList.imp.pas}
 _l3DataPtrList_ = {mixin} class(_l3PtrList_)
  {* —писок указателей на данные. Ќе управл€ет жизненным циклом данных. }
 end;//_l3DataPtrList_

{$Else l3DataPtrList_imp}

// start class _l3DataPtrList_

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_47B587AA00C9_var*
//#UC END# *47B07CF403D0_47B587AA00C9_var*
begin
//#UC START# *47B07CF403D0_47B587AA00C9_impl*
 Result := (A = B);
//#UC END# *47B07CF403D0_47B587AA00C9_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47B587AA00C9_var*
//#UC END# *47B2C42A0163_47B587AA00C9_var*
begin
//#UC START# *47B2C42A0163_47B587AA00C9_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47B587AA00C9_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47B587AA00C9_var*
//#UC END# *47B99D4503A2_47B587AA00C9_var*
begin
//#UC START# *47B99D4503A2_47B587AA00C9_impl*
 Assert(false, 'Ќа самом деле непон€тно - каков критерий сравнени€ нетипизированных указателей');
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Integer(CI.rA^) - Integer(CI.rB^);
//#UC END# *47B99D4503A2_47B587AA00C9_impl*
end;//CompareExistingItems


{$Include l3PtrList.imp.pas}


{$EndIf l3DataPtrList_imp}
