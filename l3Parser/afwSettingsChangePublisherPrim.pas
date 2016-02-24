unit afwSettingsChangePublisherPrim;
 
{$Include afwDefine.inc}

interface

uses
  afwInterfaces,
  IafwSettingListenerPtrList,
  IafwSettingsReplaceListenerPtrList,
  l3ProtoObject
  ;

type
 TafwSettingsChangePublisherPrim = class(Tl3ProtoObject)
 private
 // private fields
   f_SettingListeners : TIafwSettingListenerPtrList;
   f_ReplaceListeners : TIafwSettingsReplaceListenerPtrList;
 public
 // realized methods
   procedure AddListener(const aListener: IafwSettingListener); overload; 
   procedure RemoveListener(const aListener: IafwSettingListener); overload; 
   procedure AddListener(const aListener: IafwSettingsReplaceListener); overload; 
   procedure RemoveListener(const aListener: IafwSettingsReplaceListener); overload; 
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   procedure NotifySettingChanged(const aSettingID: TafwSettingId);
   procedure NotifyReplace(aStart: Boolean);
 end;//TafwSettingsChangePublisherPrim

implementation

uses
  SysUtils
  ;

// start class TafwSettingsChangePublisherPrim

procedure TafwSettingsChangePublisherPrim.NotifySettingChanged(const aSettingID: TafwSettingId);
//#UC START# *524303770307_5242FDD303DF_var*
var
 l_Index : Integer;
//#UC END# *524303770307_5242FDD303DF_var*
begin
//#UC START# *524303770307_5242FDD303DF_impl*
 if (f_SettingListeners <> nil) then
  for l_Index := 0 to Pred(f_SettingListeners.Count) do
   f_SettingListeners[l_Index].SettingChanged(aSettingId);
//#UC END# *524303770307_5242FDD303DF_impl*
end;//TafwSettingsChangePublisherPrim.NotifySettingChanged

procedure TafwSettingsChangePublisherPrim.NotifyReplace(aStart: Boolean);
//#UC START# *524304C002EE_5242FDD303DF_var*
var
 l_Index : Integer;
//#UC END# *524304C002EE_5242FDD303DF_var*
begin
//#UC START# *524304C002EE_5242FDD303DF_impl*
 if (f_ReplaceListeners <> nil) then
 begin
  if aStart then
  begin
   for l_Index := Pred(f_ReplaceListeners.Count) downto 0 do
    f_ReplaceListeners[l_Index].Start;
  end//aStart
  else
  begin
   for l_Index := Pred(f_ReplaceListeners.Count) downto 0 do
    f_ReplaceListeners[l_Index].Finish;
  end;//aStart
 end;//f_ReplaceListeners <> nil
//#UC END# *524304C002EE_5242FDD303DF_impl*
end;//TafwSettingsChangePublisherPrim.NotifyReplace

procedure TafwSettingsChangePublisherPrim.AddListener(const aListener: IafwSettingListener);
//#UC START# *475E8E410197_5242FDD303DF_var*
//#UC END# *475E8E410197_5242FDD303DF_var*
begin
//#UC START# *475E8E410197_5242FDD303DF_impl*
 if (f_SettingListeners = nil) then
  f_SettingListeners := TIafwSettingListenerPtrList.Make;
 if (f_SettingListeners.IndexOf(aListener) = -1) then
  f_SettingListeners.Add(aListener);
//#UC END# *475E8E410197_5242FDD303DF_impl*
end;//TafwSettingsChangePublisherPrim.AddListener

procedure TafwSettingsChangePublisherPrim.RemoveListener(const aListener: IafwSettingListener);
//#UC START# *475E8E4D03E4_5242FDD303DF_var*
//#UC END# *475E8E4D03E4_5242FDD303DF_var*
begin
//#UC START# *475E8E4D03E4_5242FDD303DF_impl*
 if (f_SettingListeners <> nil) then
  f_SettingListeners.Remove(aListener);
//#UC END# *475E8E4D03E4_5242FDD303DF_impl*
end;//TafwSettingsChangePublisherPrim.RemoveListener

procedure TafwSettingsChangePublisherPrim.AddListener(const aListener: IafwSettingsReplaceListener);
//#UC START# *475E8E5E0286_5242FDD303DF_var*
//#UC END# *475E8E5E0286_5242FDD303DF_var*
begin
//#UC START# *475E8E5E0286_5242FDD303DF_impl*
 if (f_ReplaceListeners = nil) then
  f_ReplaceListeners := TIafwSettingsReplaceListenerPtrList.Make;
 if (f_ReplaceListeners.IndexOf(aListener) = -1) then
  f_ReplaceListeners.Add(aListener);
//#UC END# *475E8E5E0286_5242FDD303DF_impl*
end;//TafwSettingsChangePublisherPrim.AddListener

procedure TafwSettingsChangePublisherPrim.RemoveListener(const aListener: IafwSettingsReplaceListener);
//#UC START# *475E8E7900A3_5242FDD303DF_var*
//#UC END# *475E8E7900A3_5242FDD303DF_var*
begin
//#UC START# *475E8E7900A3_5242FDD303DF_impl*
 if f_ReplaceListeners <> nil then
  f_ReplaceListeners.Remove(aListener);
//#UC END# *475E8E7900A3_5242FDD303DF_impl*
end;//TafwSettingsChangePublisherPrim.RemoveListener

procedure TafwSettingsChangePublisherPrim.Cleanup;
//#UC START# *479731C50290_5242FDD303DF_var*
//#UC END# *479731C50290_5242FDD303DF_var*
begin
//#UC START# *479731C50290_5242FDD303DF_impl*
 FreeAndNil(f_SettingListeners);
 FreeAndNil(f_ReplaceListeners);
 inherited;
//#UC END# *479731C50290_5242FDD303DF_impl*
end;//TafwSettingsChangePublisherPrim.Cleanup

end.