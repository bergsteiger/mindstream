{$IfNDef l3Notifier_imp}
 
{$Define l3Notifier_imp}
 _l3NotifierBase_Parent_ = _l3Notifier_Parent_;
 {$Include ..\L3\l3NotifierBase.imp.pas}
 _l3Notifier_ = {mixin} class(_l3NotifierBase_)
 protected
 // protected methods
   procedure CallNotify(aOperation: Integer;
    aIndex: Integer);
 end;//_l3Notifier_

{$Else l3Notifier_imp}

{$Include ..\L3\l3NotifierBase.imp.pas}

// start class _l3Notifier_

procedure _l3Notifier_.CallNotify(aOperation: Integer;
  aIndex: Integer);
//#UC START# *47F08013024E_47F07B3E02E4_var*
var
 l_Index : Integer;
 l_Tree  : Il3ItemNotifyRecipient;
 l_Item  : Il3Notify; 
//#UC END# *47F08013024E_47F07B3E02E4_var*
begin
//#UC START# *47F08013024E_47F07B3E02E4_impl*
 if (f_NotifiedObjList <> nil) then
  for l_Index := f_NotifiedObjList.Hi downto 0 do
  begin
   try // - зачем ??!!
    l_Item := f_NotifiedObjList[l_Index];
    if Supports(l_Item, Il3ItemNotifyRecipient, l_Tree) AND
       (l_Item = l_Tree) then
     try
      l_Tree.Notify(Self, aOperation, aIndex);
     finally
      l_Tree := nil;
     end;//try..finally
   except
    on E: Exception do
     l3System.Exception2Log(E);
   end;//try..except
  end;//for l_Index
//#UC END# *47F08013024E_47F07B3E02E4_impl*
end;//_l3Notifier_.CallNotify

{$EndIf l3Notifier_imp}
