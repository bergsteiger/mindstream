{$IfNDef afwSettingChanged_imp}
 
{$Define afwSettingChanged_imp}
 _afwSettingChanged_ = {mixin} class(_afwSettingChanged_Parent_, IafwSettingListener)
  {* Примесь, реализующая IafwSettingListener. }
 protected
 // realized methods
   function SettingChanged(const aSettingId: TafwSettingId): Boolean;
     {* настройки изменились. }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 protected
 // protected methods
   function DoSettingChanged(const aSettingId: TafwSettingId): Boolean; virtual;
     {* Обработчик изменения указанной настройки }
 end;//_afwSettingChanged_

{$Else afwSettingChanged_imp}

// start class _afwSettingChanged_

function _afwSettingChanged_.DoSettingChanged(const aSettingId: TafwSettingId): Boolean;
//#UC START# *47EA863A035C_47EA85E7005B_var*
//#UC END# *47EA863A035C_47EA85E7005B_var*
begin
//#UC START# *47EA863A035C_47EA85E7005B_impl*
 Result := False;
//#UC END# *47EA863A035C_47EA85E7005B_impl*
end;//_afwSettingChanged_.DoSettingChanged

function _afwSettingChanged_.SettingChanged(const aSettingId: TafwSettingId): Boolean;
//#UC START# *475E8C33036C_47EA85E7005B_var*
//#UC END# *475E8C33036C_47EA85E7005B_var*
begin
//#UC START# *475E8C33036C_47EA85E7005B_impl*
 Result := DoSettingChanged(aSettingId);
//#UC END# *475E8C33036C_47EA85E7005B_impl*
end;//_afwSettingChanged_.SettingChanged

procedure _afwSettingChanged_.Cleanup;
//#UC START# *479731C50290_47EA85E7005B_var*
//#UC END# *479731C50290_47EA85E7005B_var*
begin
//#UC START# *479731C50290_47EA85E7005B_impl*
 if TafwSettingsChangePublisher.Exists then
  TafwSettingsChangePublisher.Instance.RemoveListener(IafwSettingListener(Self));
 inherited;
//#UC END# *479731C50290_47EA85E7005B_impl*
end;//_afwSettingChanged_.Cleanup

procedure _afwSettingChanged_.InitFields;
//#UC START# *47A042E100E2_47EA85E7005B_var*
//#UC END# *47A042E100E2_47EA85E7005B_var*
begin
//#UC START# *47A042E100E2_47EA85E7005B_impl*
 inherited;
 TafwSettingsChangePublisher.Instance.AddListener(IafwSettingListener(Self));
//#UC END# *47A042E100E2_47EA85E7005B_impl*
end;//_afwSettingChanged_.InitFields

{$EndIf afwSettingChanged_imp}
