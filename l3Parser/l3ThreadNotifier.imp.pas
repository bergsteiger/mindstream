{$IfNDef l3ThreadNotifier.imp}
{$Define l3ThreadNotifier.imp}
 _ThreadNotifierParent_ = _l3ThreadNotifier_Parent_;
 {$Include l3ThreadNotifier.int.pas}
 _l3ThreadNotifier_ = _ThreadNotifier_;

{$Else l3ThreadNotifier.imp}

{$Include l3ThreadNotifier.int.pas}

{$EndIf l3ThreadNotifier.imp}
