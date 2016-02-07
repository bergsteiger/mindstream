{$IfNDef l3RefList_imp}
 
{$Define l3RefList_imp}
 _l3StandardTypedList_Parent_ = _l3RefList_Parent_;
 {$Include ..\L3\l3StandardTypedList.imp.pas}
 _l3RefList_ = {abstract mixin} class(_l3StandardTypedList_)
  {* Примесь для списка ссылок. Список ВЛАДЕЕТ элементами и управляет их временем жизни. }
 end;//_l3RefList_

{$Else l3RefList_imp}


{$Include ..\L3\l3StandardTypedList.imp.pas}


{$EndIf l3RefList_imp}
