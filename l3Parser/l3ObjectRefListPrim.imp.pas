{$IfNDef l3ObjectRefListPrim_imp}

{$Define l3ObjectRefListPrim_imp}
 _l3RefList_Parent_ = _l3ObjectRefListPrim_Parent_;
 {$Include l3RefList.imp.pas}
 _l3ObjectRefListPrim_ = {abstract mixin} class(_l3RefList_)
 end;//_l3ObjectRefListPrim_

{$Else l3ObjectRefListPrim_imp}

// start class _l3ObjectRefListPrim_

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_47B5A0AE03CC_var*
//#UC END# *47B07CF403D0_47B5A0AE03CC_var*
begin
//#UC START# *47B07CF403D0_47B5A0AE03CC_impl*
 Result := (A = B);
//#UC END# *47B07CF403D0_47B5A0AE03CC_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic


{$Include l3RefList.imp.pas}


{$EndIf l3ObjectRefListPrim_imp}
