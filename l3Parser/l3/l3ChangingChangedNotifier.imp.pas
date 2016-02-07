{$IfNDef l3ChangingChangedNotifier_imp}
 
{$Define l3ChangingChangedNotifier_imp}
 _l3Notifier_Parent_ = _l3ChangingChangedNotifier_Parent_;
 {$Include ..\L3\l3Notifier.imp.pas}
 _l3ChangingChangedNotifier_ = {mixin} class(_l3Notifier_)
 protected
 // overridden protected methods
   procedure DoChanged; override;
     {* Сигнатура метода DoChanged }
   procedure DoChanging; override;
     {* Сигнатура метода DoChanging }
 end;//_l3ChangingChangedNotifier_

{$Else l3ChangingChangedNotifier_imp}

{$Include ..\L3\l3Notifier.imp.pas}

// start class _l3ChangingChangedNotifier_

procedure _l3ChangingChangedNotifier_.DoChanged;
//#UC START# *54D9E08D0212_48FCA1F20259_var*
var
 l_Index : Integer;
 l_Intf  : Il3ChangeRecipient;
 l_Item  : IUnknown;
 l_Expt  : Boolean;
//#UC END# *54D9E08D0212_48FCA1F20259_var*
begin
//#UC START# *54D9E08D0212_48FCA1F20259_impl*
 inherited;
 l_Expt := false;
 try
  if (NotifiedObjList <> nil) then
   for l_Index := NotifiedObjList.Hi downto 0 do
    try
     l_Item := IUnknown(f_NotifiedObjList[l_Index]);
     if Supports(l_Item, Il3ChangeRecipient, l_Intf) AND
        (l_Item = l_Intf) then
      try
       l_Intf.Changed;
      finally
       l_Intf := nil;
      end;//try..finaly
    except
     on EDoChangedAlreadyDone do
      l_Expt := True;
     on E: Exception do
     begin
      l3System.Exception2Log(E);
      // Гасим все прочие исключения.
     end;//on E : Exception
    end;//try..except
 finally
  if l_Expt then
   raise EDoChangedAlreadyDone.Create('');
 end;//try..finally
//#UC END# *54D9E08D0212_48FCA1F20259_impl*
end;//_l3ChangingChangedNotifier_.DoChanged

procedure _l3ChangingChangedNotifier_.DoChanging;
//#UC START# *54D9E09D018D_48FCA1F20259_var*
var
 l_Index : Integer;
 l_Intf  : Il3ChangeRecipient;
 l_Item  : IUnknown;
//#UC END# *54D9E09D018D_48FCA1F20259_var*
begin
//#UC START# *54D9E09D018D_48FCA1F20259_impl*
 inherited;
 if (NotifiedObjList <> nil) then
  for l_Index := NotifiedObjList.Hi downto 0 do
   try
    l_Item := IUnknown(f_NotifiedObjList[l_Index]);
    if Supports(l_Item, Il3ChangeRecipient, l_Intf) AND
       (l_Item = l_Intf) then
     try
      l_Intf.Changing;
     finally
      l_Intf := nil;
     end;//try..finaly
   except
    on E: Exception do
     l3System.Exception2Log(E);
   end;
//#UC END# *54D9E09D018D_48FCA1F20259_impl*
end;//_l3ChangingChangedNotifier_.DoChanging

{$EndIf l3ChangingChangedNotifier_imp}
