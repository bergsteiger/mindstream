{$IfNDef l3StandardMemTypedList_imp}
 
{$Define l3StandardMemTypedList_imp}
 _DataType_ = Tl3Ptr;
 _l3TypedList_Parent_ = _l3StandardMemTypedList_Parent_;
 {$Include ..\L3\l3TypedList.imp.pas}
 _l3StandardMemTypedList_ = {mixin} class(_l3TypedList_)
  {* Типизированный список со стандартной функцией распределения памяти }
 end;//_l3StandardMemTypedList_

{$Else l3StandardMemTypedList_imp}


{$Include ..\L3\l3TypedList.imp.pas}


{$EndIf l3StandardMemTypedList_imp}
