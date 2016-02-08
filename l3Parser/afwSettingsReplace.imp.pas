{$IfNDef afwSettingsReplace_imp}
 
{$Define afwSettingsReplace_imp}
 _afwSettingsReplace_ = {mixin} class(_afwSettingsReplace_Parent_, IafwSettingsReplaceListener)
  {* Примесь, реализующая IafwSettingsReplaceListener. }
 protected
 // realized methods
   procedure Start;
     {* перед заменой настроек. }
   procedure Finish;
     {* после замены настроек. }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 protected
 // protected methods
   procedure SettingsReplaceStart; virtual;
   procedure SettingsReplaceFinish; virtual;
 end;//_afwSettingsReplace_

{$Else afwSettingsReplace_imp}

// start class _afwSettingsReplace_

procedure _afwSettingsReplace_.SettingsReplaceStart;
//#UC START# *47EA8B8C03CB_47EA8AEF0077_var*
//#UC END# *47EA8B8C03CB_47EA8AEF0077_var*
begin
//#UC START# *47EA8B8C03CB_47EA8AEF0077_impl*
 // ничего не делаем
//#UC END# *47EA8B8C03CB_47EA8AEF0077_impl*
end;//_afwSettingsReplace_.SettingsReplaceStart

procedure _afwSettingsReplace_.SettingsReplaceFinish;
//#UC START# *47EA8B9601FE_47EA8AEF0077_var*
//#UC END# *47EA8B9601FE_47EA8AEF0077_var*
begin
//#UC START# *47EA8B9601FE_47EA8AEF0077_impl*
 // ничего не делаем
//#UC END# *47EA8B9601FE_47EA8AEF0077_impl*
end;//_afwSettingsReplace_.SettingsReplaceFinish

procedure _afwSettingsReplace_.Start;
//#UC START# *475E8D96021D_47EA8AEF0077_var*
//#UC END# *475E8D96021D_47EA8AEF0077_var*
begin
//#UC START# *475E8D96021D_47EA8AEF0077_impl*
 SettingsReplaceStart;
//#UC END# *475E8D96021D_47EA8AEF0077_impl*
end;//_afwSettingsReplace_.Start

procedure _afwSettingsReplace_.Finish;
//#UC START# *475E8DA60031_47EA8AEF0077_var*
//#UC END# *475E8DA60031_47EA8AEF0077_var*
begin
//#UC START# *475E8DA60031_47EA8AEF0077_impl*
 SettingsReplaceFinish;
//#UC END# *475E8DA60031_47EA8AEF0077_impl*
end;//_afwSettingsReplace_.Finish

procedure _afwSettingsReplace_.Cleanup;
//#UC START# *479731C50290_47EA8AEF0077_var*
//#UC END# *479731C50290_47EA8AEF0077_var*
begin
//#UC START# *479731C50290_47EA8AEF0077_impl*
 if TafwSettingsChangePublisher.Exists then
   TafwSettingsChangePublisher.Instance.RemoveListener(IafwSettingsReplaceListener(Self));
 inherited;
//#UC END# *479731C50290_47EA8AEF0077_impl*
end;//_afwSettingsReplace_.Cleanup

procedure _afwSettingsReplace_.InitFields;
//#UC START# *47A042E100E2_47EA8AEF0077_var*
//#UC END# *47A042E100E2_47EA8AEF0077_var*
begin
//#UC START# *47A042E100E2_47EA8AEF0077_impl*
 inherited;
 TafwSettingsChangePublisher.Instance.AddListener(IafwSettingsReplaceListener(Self));
//#UC END# *47A042E100E2_47EA8AEF0077_impl*
end;//_afwSettingsReplace_.InitFields

{$EndIf afwSettingsReplace_imp}
