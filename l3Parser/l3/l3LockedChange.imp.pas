{$IfNDef l3LockedChange_imp}
 
{$Define l3LockedChange_imp}
 _l3LockedChangePrim_Parent_ = _l3LockedChange_Parent_;
 {$Include ..\L3\l3LockedChangePrim.imp.pas}
 _l3LockedChange_ = {mixin} class(_l3LockedChangePrim_)
  {* Нотификатор об изменениях со счётчиком ссылок изменений }
 end;//_l3LockedChange_

{$Else l3LockedChange_imp}

{$Include ..\L3\l3LockedChangePrim.imp.pas}


{$EndIf l3LockedChange_imp}
