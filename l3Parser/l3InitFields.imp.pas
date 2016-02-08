{$IfNDef l3InitFields.imp}


{$Define l3InitFields.imp}
 _l3InitFields_ = {mixin} class(_l3InitFields_Parent_)
  {* ֿנטלוסü ס לועמהמל InitFields }
 protected
 // overridden protected methods
   procedure AfterConstruction; override;
     {* AfterConstruction is called automatically after the object’s last constructor has executed. Do not call it explicitly in your applications.  The AfterConstruction method implemented in TObject does nothing. Override this method when creating a class that takes some action after the object is created. For example, TCustomForm overrides AfterConstruction to generate an OnCreate event. }
 end;//_l3InitFields_

{$Else l3InitFields.imp}

// start class _l3InitFields_

procedure _l3InitFields_.AfterConstruction;
//#UC START# *49F04ADD0302_49F04C0D0174_var*
//#UC END# *49F04ADD0302_49F04C0D0174_var*
begin
//#UC START# *49F04ADD0302_49F04C0D0174_impl*
 !!! Needs to be implemented !!!
//#UC END# *49F04ADD0302_49F04C0D0174_impl*
end;//_l3InitFields_.AfterConstruction

{$EndIf l3InitFields.imp}
