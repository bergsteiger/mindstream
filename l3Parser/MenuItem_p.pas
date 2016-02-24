unit MenuItem_p;
 
{$Include w:\common\components\l3Define.inc}

interface

implementation

{$If not defined(XE)}
uses
  Menus,
  Variants {a},
  ActiveX {a},
  tc5OpenAppClasses {a},
  tc5PublicInfo {a},
  tc6OpenAppClasses {a},
  tc6PublicInfo {a}
  ;
{$IfEnd} //not XE

// start class TMenuItem

{$If not defined(XE)}
function TMenuItem_Get_Caption(Self: TMenuItem): AnsiString;
//#UC START# *49A3EA0603D1_499AF24802D2get_var*
//#UC END# *49A3EA0603D1_499AF24802D2get_var*
begin
 with Self do
 begin
//#UC START# *49A3EA0603D1_499AF24802D2get_impl*
  Result := Caption;
//#UC END# *49A3EA0603D1_499AF24802D2get_impl*
 end;//with Self
end;//TMenuItem_Get_Caption
{$IfEnd} //not XE

{$If not defined(XE)}
function TMenuItem_Get_Count(Self: TMenuItem): Integer;
//#UC START# *49A3EAB701E7_499AF24802D2get_var*
//#UC END# *49A3EAB701E7_499AF24802D2get_var*
begin
 with Self do
 begin
//#UC START# *49A3EAB701E7_499AF24802D2get_impl*
  Result := Count;
//#UC END# *49A3EAB701E7_499AF24802D2get_impl*
 end;//with Self
end;//TMenuItem_Get_Count
{$IfEnd} //not XE

{$If not defined(XE)}
function TMenuItem_Get_MenuIndex(Self: TMenuItem): Integer;
//#UC START# *49A3EB07006A_499AF24802D2get_var*
//#UC END# *49A3EB07006A_499AF24802D2get_var*
begin
 with Self do
 begin
//#UC START# *49A3EB07006A_499AF24802D2get_impl*
  Result := MenuIndex;
//#UC END# *49A3EB07006A_499AF24802D2get_impl*
 end;//with Self
end;//TMenuItem_Get_MenuIndex
{$IfEnd} //not XE

{$If not defined(XE)}
function TMenuItem_Get_Visible(Self: TMenuItem): Boolean;
//#UC START# *49A3EB180091_499AF24802D2get_var*
//#UC END# *49A3EB180091_499AF24802D2get_var*
begin
 with Self do
 begin
//#UC START# *49A3EB180091_499AF24802D2get_impl*
  Result := Visible;
//#UC END# *49A3EB180091_499AF24802D2get_impl*
 end;//with Self
end;//TMenuItem_Get_Visible
{$IfEnd} //not XE

{$If not defined(XE)}
function TMenuItem_Get_Enabled(Self: TMenuItem): Boolean;
//#UC START# *49A3EB1F0087_499AF24802D2get_var*
//#UC END# *49A3EB1F0087_499AF24802D2get_var*
begin
 with Self do
 begin
//#UC START# *49A3EB1F0087_499AF24802D2get_impl*
  Result := Enabled;
//#UC END# *49A3EB1F0087_499AF24802D2get_impl*
 end;//with Self
end;//TMenuItem_Get_Enabled
{$IfEnd} //not XE

{$If not defined(XE)}
function TMenuItem_Get_Checked(Self: TMenuItem): Boolean;
//#UC START# *49A3EB2702F0_499AF24802D2get_var*
//#UC END# *49A3EB2702F0_499AF24802D2get_var*
begin
 with Self do
 begin
//#UC START# *49A3EB2702F0_499AF24802D2get_impl*
  Result := Checked;
//#UC END# *49A3EB2702F0_499AF24802D2get_impl*
 end;//with Self
end;//TMenuItem_Get_Checked
{$IfEnd} //not XE

{$If not defined(XE)}
function TMenuItem_Get_Items(Self: TMenuItem; Index: Integer): TMenuItem;
//#UC START# *49A3EA8000B8_499AF24802D2get_var*
//#UC END# *49A3EA8000B8_499AF24802D2get_var*
begin
 with Self do
 begin
//#UC START# *49A3EA8000B8_499AF24802D2get_impl*
  Result := Items[Index];
//#UC END# *49A3EA8000B8_499AF24802D2get_impl*
 end;//with Self
end;//TMenuItem_Get_Items
{$IfEnd} //not XE

{$If not defined(XE)}
function TMenuItem_Get_Parent(Self: TMenuItem): TMenuItem;
//#UC START# *49A3EAE00085_499AF24802D2get_var*
//#UC END# *49A3EAE00085_499AF24802D2get_var*
begin
 with Self do
 begin
//#UC START# *49A3EAE00085_499AF24802D2get_impl*
  Result := Parent;
//#UC END# *49A3EAE00085_499AF24802D2get_impl*
 end;//with Self
end;//TMenuItem_Get_Parent
{$IfEnd} //not XE

procedure TMenuItem_Get_Caption_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Caption(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Caption_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Caption(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Count_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Count(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Count_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Count(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_MenuIndex_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_MenuIndex(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_MenuIndex_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_MenuIndex(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Visible_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Visible(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Visible_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Visible(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Enabled_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Enabled(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Enabled_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Enabled(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Checked_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Checked(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Checked_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := (TMenuItem_Get_Checked(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Items_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := tc5PublicInfo.VarFromObject(TMenuItem_Get_Items(TMenuItem(Instance), OleVariant(Args^[0])));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Items_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := tc6PublicInfo.VarFromObject(TMenuItem_Get_Items(TMenuItem(Instance), OleVariant(Args^[0])));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Parent_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := tc5PublicInfo.VarFromObject(TMenuItem_Get_Parent(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenuItem_Get_Parent_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenuItem);
 try
  Value := tc6PublicInfo.VarFromObject(TMenuItem_Get_Parent(TMenuItem(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure _RegisterPublicInformation5;
begin
 tc5PublicInfo._RegisterMethod(TMenuItem, tc5OpenAppClasses.mtGet, 'Caption', TypeInfo(AnsiString), [], [], TMenuItem_Get_Caption_Pub5);
 tc5PublicInfo._RegisterMethod(TMenuItem, tc5OpenAppClasses.mtGet, 'Count', TypeInfo(Integer), [], [], TMenuItem_Get_Count_Pub5);
 tc5PublicInfo._RegisterMethod(TMenuItem, tc5OpenAppClasses.mtGet, 'MenuIndex', TypeInfo(Integer), [], [], TMenuItem_Get_MenuIndex_Pub5);
 tc5PublicInfo._RegisterMethod(TMenuItem, tc5OpenAppClasses.mtGet, 'Visible', TypeInfo(Boolean), [], [], TMenuItem_Get_Visible_Pub5);
 tc5PublicInfo._RegisterMethod(TMenuItem, tc5OpenAppClasses.mtGet, 'Enabled', TypeInfo(Boolean), [], [], TMenuItem_Get_Enabled_Pub5);
 tc5PublicInfo._RegisterMethod(TMenuItem, tc5OpenAppClasses.mtGet, 'Checked', TypeInfo(Boolean), [], [], TMenuItem_Get_Checked_Pub5);
 tc5PublicInfo._RegisterMethod(TMenuItem, tc5OpenAppClasses.mtGet, 'Items', TypeInfo(TMenuItem), [TypeInfo(Integer)], ['Index'], TMenuItem_Get_Items_Pub5);
 tc5PublicInfo._RegisterMethod(TMenuItem, tc5OpenAppClasses.mtGet, 'Parent', TypeInfo(TMenuItem), [], [], TMenuItem_Get_Parent_Pub5);
end;

procedure _RegisterPublicInformation6;
begin
 tc6PublicInfo._RegisterMethod(TMenuItem, tc6OpenAppClasses.mtGet, 'Caption', TypeInfo(AnsiString), [], [], TMenuItem_Get_Caption_Pub6);
 tc6PublicInfo._RegisterMethod(TMenuItem, tc6OpenAppClasses.mtGet, 'Count', TypeInfo(Integer), [], [], TMenuItem_Get_Count_Pub6);
 tc6PublicInfo._RegisterMethod(TMenuItem, tc6OpenAppClasses.mtGet, 'MenuIndex', TypeInfo(Integer), [], [], TMenuItem_Get_MenuIndex_Pub6);
 tc6PublicInfo._RegisterMethod(TMenuItem, tc6OpenAppClasses.mtGet, 'Visible', TypeInfo(Boolean), [], [], TMenuItem_Get_Visible_Pub6);
 tc6PublicInfo._RegisterMethod(TMenuItem, tc6OpenAppClasses.mtGet, 'Enabled', TypeInfo(Boolean), [], [], TMenuItem_Get_Enabled_Pub6);
 tc6PublicInfo._RegisterMethod(TMenuItem, tc6OpenAppClasses.mtGet, 'Checked', TypeInfo(Boolean), [], [], TMenuItem_Get_Checked_Pub6);
 tc6PublicInfo._RegisterMethod(TMenuItem, tc6OpenAppClasses.mtGet, 'Items', TypeInfo(TMenuItem), [TypeInfo(Integer)], ['Index'], TMenuItem_Get_Items_Pub6);
 tc6PublicInfo._RegisterMethod(TMenuItem, tc6OpenAppClasses.mtGet, 'Parent', TypeInfo(TMenuItem), [], [], TMenuItem_Get_Parent_Pub6);
end;

initialization
  _RegisterPublicInformation5;
  _RegisterPublicInformation6;

end.