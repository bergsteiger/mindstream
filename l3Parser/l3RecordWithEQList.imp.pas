{$IfNDef l3RecordWithEQList_imp}
 
{$Define l3RecordWithEQList_imp}
 _l3RecordListPrim_Parent_ = _l3RecordWithEQList_Parent_;
 {$Include l3RecordListPrim.imp.pas}
 _l3RecordWithEQList_ = {mixin} class(_l3RecordListPrim_)
  {* Список записей с операцией EQ }
 end;//_l3RecordWithEQList_

{$Else l3RecordWithEQList_imp}

// start class _l3RecordWithEQList_

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_4B223DB5024B_var*
//#UC END# *47B07CF403D0_4B223DB5024B_var*
begin
//#UC START# *47B07CF403D0_4B223DB5024B_impl*
 Result := A.EQ(B);
//#UC END# *47B07CF403D0_4B223DB5024B_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic


{$Include l3RecordListPrim.imp.pas}


{$EndIf l3RecordWithEQList_imp}
