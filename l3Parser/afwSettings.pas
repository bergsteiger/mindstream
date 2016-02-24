unit afwSettings;
 
{$Include afwDefine.inc}

interface

uses
  afwInterfaces,
  afwSettingsPrimPrim,
  afwSettingsImplPrimPrim
  ;

type
 TafwSettings = class(TafwSettingsPrimPrim, IafwSettings)
 private
 // private fields
   f_State : TafwSettingsState;
 protected
 // realized methods
   function pm_GetState: TafwSettingsState;
   procedure pm_SetState(aValue: TafwSettingsState);
   function LoadDouble(const aSettingId: TafwSettingId;
    aDefault: Double = 0;
    aRestoreDefault: Boolean = False): Double;
   procedure SaveDouble(const aSettingId: TafwSettingId;
    aValue: Double;
    aDefault: Double = 0;
    aSetAsDefault: Boolean = False);
 protected
 // overridden protected methods
   procedure InitFields; override;
   procedure NotifySettingChanged(const aSettingID: TafwSettingId); override;
 public
 // public methods
   class function Make(const aSettingsImpl: IafwSettingsImpl): IafwSettings; reintroduce;
     {* Сигнатура фабрики TafwSettings.Make }
 end;//TafwSettings

implementation

uses
  SysUtils,
  afwSettingsChangePublisher
  ;

// start class TafwSettings

class function TafwSettings.Make(const aSettingsImpl: IafwSettingsImpl): IafwSettings;
var
 l_Inst : TafwSettings;
begin
 l_Inst := Create(aSettingsImpl);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TafwSettings.pm_GetState: TafwSettingsState;
//#UC START# *48896A7B0311_4F6C957F01E7get_var*
//#UC END# *48896A7B0311_4F6C957F01E7get_var*
begin
//#UC START# *48896A7B0311_4F6C957F01E7get_impl*
 Result := f_State;
//#UC END# *48896A7B0311_4F6C957F01E7get_impl*
end;//TafwSettings.pm_GetState

procedure TafwSettings.pm_SetState(aValue: TafwSettingsState);
//#UC START# *48896A7B0311_4F6C957F01E7set_var*
//#UC END# *48896A7B0311_4F6C957F01E7set_var*
begin
//#UC START# *48896A7B0311_4F6C957F01E7set_impl*
 f_State := aValue;
//#UC END# *48896A7B0311_4F6C957F01E7set_impl*
end;//TafwSettings.pm_SetState

function TafwSettings.LoadDouble(const aSettingId: TafwSettingId;
  aDefault: Double = 0;
  aRestoreDefault: Boolean = False): Double;
//#UC START# *4AB729980069_4F6C957F01E7_var*
//#UC END# *4AB729980069_4F6C957F01E7_var*
begin
//#UC START# *4AB729980069_4F6C957F01E7_impl*
 LoadParam(aSettingId, vtExtended, Result, aDefault, aRestoreDefault);
//#UC END# *4AB729980069_4F6C957F01E7_impl*
end;//TafwSettings.LoadDouble

procedure TafwSettings.SaveDouble(const aSettingId: TafwSettingId;
  aValue: Double;
  aDefault: Double = 0;
  aSetAsDefault: Boolean = False);
//#UC START# *4AB729A702A2_4F6C957F01E7_var*
//#UC END# *4AB729A702A2_4F6C957F01E7_var*
begin
//#UC START# *4AB729A702A2_4F6C957F01E7_impl*
 SaveParam(aSettingId, vtExtended, aValue, aDefault, aSetAsDefault);
//#UC END# *4AB729A702A2_4F6C957F01E7_impl*
end;//TafwSettings.SaveDouble

procedure TafwSettings.InitFields;
//#UC START# *47A042E100E2_4F6C957F01E7_var*
//#UC END# *47A042E100E2_4F6C957F01E7_var*
begin
//#UC START# *47A042E100E2_4F6C957F01E7_impl*
 inherited;
 f_State := afw_ssNone;
//#UC END# *47A042E100E2_4F6C957F01E7_impl*
end;//TafwSettings.InitFields

procedure TafwSettings.NotifySettingChanged(const aSettingID: TafwSettingId);
//#UC START# *4AD5979E01BB_4F6C957F01E7_var*
//#UC END# *4AD5979E01BB_4F6C957F01E7_var*
begin
//#UC START# *4AD5979E01BB_4F6C957F01E7_impl*
 inherited;
 if TafwSettingsChangePublisher.Exists then
  TafwSettingsChangePublisher.Instance.NotifySettingChanged(aSettingID);
//#UC END# *4AD5979E01BB_4F6C957F01E7_impl*
end;//TafwSettings.NotifySettingChanged

end.