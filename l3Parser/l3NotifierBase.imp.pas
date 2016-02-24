{$IfNDef l3NotifierBase_imp}
 
{$Define l3NotifierBase_imp}
 _l3NotifierBase_ = {mixin} class(_l3NotifierBase_Parent_, Il3ChangeNotifier)
 private
 // private fields
   f_NotifiedObjList : Tl3NotifyPtrList;
    {* Поле для свойства NotifiedObjList}
 protected
 // property methods
   function pm_GetHasNotified: Boolean;
 protected
 // realized methods
   procedure Subscribe(const aRecipient: Il3Notify);
     {* подписка на извещения. }
   procedure Unsubscribe(const aRecipient: Il3Notify);
     {* "отписка" от извещений. }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected properties
   property HasNotified: Boolean
     read pm_GetHasNotified;
     {* наличие уведомляемых объектов. }
   property NotifiedObjList: Tl3NotifyPtrList
     read f_NotifiedObjList;
 end;//_l3NotifierBase_

{$Else l3NotifierBase_imp}

// start class _l3NotifierBase_

function _l3NotifierBase_.pm_GetHasNotified: Boolean;
//#UC START# *47F07CCE0379_47F07AE10156get_var*
//#UC END# *47F07CCE0379_47F07AE10156get_var*
begin
//#UC START# *47F07CCE0379_47F07AE10156get_impl*
 Result := (f_NotifiedObjList <> nil) and (f_NotifiedObjList.Count > 0);
//#UC END# *47F07CCE0379_47F07AE10156get_impl*
end;//_l3NotifierBase_.pm_GetHasNotified

procedure _l3NotifierBase_.Subscribe(const aRecipient: Il3Notify);
//#UC START# *46A44F6B035E_47F07AE10156_var*
//#UC END# *46A44F6B035E_47F07AE10156_var*
begin
//#UC START# *46A44F6B035E_47F07AE10156_impl*
 if (aRecipient = nil) then
  Exit;
 if (f_NotifiedObjList = nil) then
  f_NotifiedObjList := Tl3NotifyPtrList.MakeSorted; 
 f_NotifiedObjList.Add(aRecipient);
//#UC END# *46A44F6B035E_47F07AE10156_impl*
end;//_l3NotifierBase_.Subscribe

procedure _l3NotifierBase_.Unsubscribe(const aRecipient: Il3Notify);
//#UC START# *46A44FFE0143_47F07AE10156_var*
//#UC END# *46A44FFE0143_47F07AE10156_var*
begin
//#UC START# *46A44FFE0143_47F07AE10156_impl*
 if (aRecipient <> nil) AND (f_NotifiedObjList <> nil) then
  f_NotifiedObjList.Remove(aRecipient);
//#UC END# *46A44FFE0143_47F07AE10156_impl*
end;//_l3NotifierBase_.Unsubscribe

procedure _l3NotifierBase_.Cleanup;
//#UC START# *479731C50290_47F07AE10156_var*
//#UC END# *479731C50290_47F07AE10156_var*
begin
//#UC START# *479731C50290_47F07AE10156_impl*
 FreeAndNil(f_NotifiedObjList);
 inherited;
//#UC END# *479731C50290_47F07AE10156_impl*
end;//_l3NotifierBase_.Cleanup

{$EndIf l3NotifierBase_imp}
