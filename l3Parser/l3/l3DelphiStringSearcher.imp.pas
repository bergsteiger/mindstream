{$IfNDef l3DelphiStringSearcher_imp}

 
{$Define l3DelphiStringSearcher_imp}
 _l3DelphiStringSearcherPrim_Parent_ = _l3DelphiStringSearcher_Parent_;
 {$Include ..\L3\l3DelphiStringSearcherPrim.imp.pas}
 _l3DelphiStringSearcher_ = {abstract mixin} class(_l3DelphiStringSearcherPrim_)
 end;//_l3DelphiStringSearcher_

{$Else l3DelphiStringSearcher_imp}

// start class _l3DelphiStringSearcher_

function ItemToWStr(const anItem: _ItemType_): Tl3WString;
//#UC START# *5304D6C5002B_5304D68D03B2_var*
//#UC END# *5304D6C5002B_5304D68D03B2_var*
begin
//#UC START# *5304D6C5002B_5304D68D03B2_impl*
 Result := anItem.AsWStr;
//#UC END# *5304D6C5002B_5304D68D03B2_impl*
end;//ItemToWStr


{$Include ..\L3\l3DelphiStringSearcherPrim.imp.pas}


{$EndIf l3DelphiStringSearcher_imp}
