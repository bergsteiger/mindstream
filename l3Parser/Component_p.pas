unit Component_p;
 
{$Include w:\common\components\l3Define.inc}

interface

implementation

{$If not defined(XE)}
uses
  Classes,
  Variants {a},
  ActiveX {a},
  tc5OpenAppClasses {a},
  tc5PublicInfo {a},
  tc6OpenAppClasses {a},
  tc6PublicInfo {a}
  ;
{$IfEnd} //not XE

// start class TComponent

{$If not defined(XE)}
function TComponent_Get_OwnerName(Self: TComponent): AnsiString;
//#UC START# *53723DFA005B_53723A470044get_var*
//#UC END# *53723DFA005B_53723A470044get_var*
begin
 with Self do
 begin
//#UC START# *53723DFA005B_53723A470044get_impl*
  if Owner <> nil then
    Result := Owner.Name
  else
    Result := '';
//#UC END# *53723DFA005B_53723A470044get_impl*
 end;//with Self
end;//TComponent_Get_OwnerName
{$IfEnd} //not XE

{$If not defined(XE)}
function TComponent_Get_Owner(Self: TComponent): TComponent;
//#UC START# *53723A65014D_53723A470044get_var*
//#UC END# *53723A65014D_53723A470044get_var*
begin
 with Self do
 begin
//#UC START# *53723A65014D_53723A470044get_impl*
  Result := Owner;
//#UC END# *53723A65014D_53723A470044get_impl*
 end;//with Self
end;//TComponent_Get_Owner
{$IfEnd} //not XE

procedure TComponent_Get_OwnerName_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TComponent);
 try
  Value := (TComponent_Get_OwnerName(TComponent(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TComponent_Get_OwnerName_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TComponent);
 try
  Value := (TComponent_Get_OwnerName(TComponent(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TComponent_Get_Owner_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TComponent);
 try
  Value := tc5PublicInfo.VarFromObject(TComponent_Get_Owner(TComponent(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TComponent_Get_Owner_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TComponent);
 try
  Value := tc6PublicInfo.VarFromObject(TComponent_Get_Owner(TComponent(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure _RegisterPublicInformation5;
begin
 tc5PublicInfo._RegisterMethod(TComponent, tc5OpenAppClasses.mtGet, 'OwnerName', TypeInfo(AnsiString), [], [], TComponent_Get_OwnerName_Pub5);
 tc5PublicInfo._RegisterMethod(TComponent, tc5OpenAppClasses.mtGet, 'Owner', TypeInfo(TComponent), [], [], TComponent_Get_Owner_Pub5);
end;

procedure _RegisterPublicInformation6;
begin
 tc6PublicInfo._RegisterMethod(TComponent, tc6OpenAppClasses.mtGet, 'OwnerName', TypeInfo(AnsiString), [], [], TComponent_Get_OwnerName_Pub6);
 tc6PublicInfo._RegisterMethod(TComponent, tc6OpenAppClasses.mtGet, 'Owner', TypeInfo(TComponent), [], [], TComponent_Get_Owner_Pub6);
end;

initialization
  _RegisterPublicInformation5;
  _RegisterPublicInformation6;

end.