unit WinControl_p;

 
{$Include w:\common\components\l3Define.inc}

interface

implementation

{$If not defined(XE)}
uses
  Controls,
  Variants {a},
  ActiveX {a},
  tc5OpenAppClasses {a},
  tc5PublicInfo {a},
  tc6OpenAppClasses {a},
  tc6PublicInfo {a}
  ;
{$IfEnd} //not XE

// start class TWinControl

{$If not defined(XE)}
function TWinControl_Get_ControlCount(Self: TWinControl): Integer;
//#UC START# *53D12BB30380_53D12ADE0303get_var*
//#UC END# *53D12BB30380_53D12ADE0303get_var*
begin
 with Self do
 begin
//#UC START# *53D12BB30380_53D12ADE0303get_impl*
  Result := ControlCount;
//#UC END# *53D12BB30380_53D12ADE0303get_impl*
 end;//with Self
end;//TWinControl_Get_ControlCount
{$IfEnd} //not XE

{$If not defined(XE)}
function TWinControl_Get_Controls(Self: TWinControl; Index: Integer): TControl;
//#UC START# *53D12B6E016C_53D12ADE0303get_var*
//#UC END# *53D12B6E016C_53D12ADE0303get_var*
begin
 with Self do
 begin
//#UC START# *53D12B6E016C_53D12ADE0303get_impl*
  Result := Controls[Index];
//#UC END# *53D12B6E016C_53D12ADE0303get_impl*
 end;//with Self
end;//TWinControl_Get_Controls
{$IfEnd} //not XE

procedure TWinControl_Get_ControlCount_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TWinControl);
 try
  Value := (TWinControl_Get_ControlCount(TWinControl(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TWinControl_Get_ControlCount_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TWinControl);
 try
  Value := (TWinControl_Get_ControlCount(TWinControl(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TWinControl_Get_Controls_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TWinControl);
 try
  Value := tc5PublicInfo.VarFromObject(TWinControl_Get_Controls(TWinControl(Instance), OleVariant(Args^[0])));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TWinControl_Get_Controls_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TWinControl);
 try
  Value := tc6PublicInfo.VarFromObject(TWinControl_Get_Controls(TWinControl(Instance), OleVariant(Args^[0])));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure _RegisterPublicInformation5;
begin
 tc5PublicInfo._RegisterMethod(TWinControl, tc5OpenAppClasses.mtGet, 'ControlCount', TypeInfo(Integer), [], [], TWinControl_Get_ControlCount_Pub5);
 tc5PublicInfo._RegisterMethod(TWinControl, tc5OpenAppClasses.mtGet, 'Controls', TypeInfo(TControl), [TypeInfo(Integer)], ['Index'], TWinControl_Get_Controls_Pub5);
end;

procedure _RegisterPublicInformation6;
begin
 tc6PublicInfo._RegisterMethod(TWinControl, tc6OpenAppClasses.mtGet, 'ControlCount', TypeInfo(Integer), [], [], TWinControl_Get_ControlCount_Pub6);
 tc6PublicInfo._RegisterMethod(TWinControl, tc6OpenAppClasses.mtGet, 'Controls', TypeInfo(TControl), [TypeInfo(Integer)], ['Index'], TWinControl_Get_Controls_Pub6);
end;

initialization
  _RegisterPublicInformation5;
  _RegisterPublicInformation6;

end.