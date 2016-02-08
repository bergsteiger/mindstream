unit Menu_p;

 
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

// start class TMenu

{$If not defined(XE)}
function TMenu_Get_Items(Self: TMenu): TMenuItem;
//#UC START# *49A3ED2A0248_49A3ECCB0366get_var*
//#UC END# *49A3ED2A0248_49A3ECCB0366get_var*
begin
 with Self do
 begin
//#UC START# *49A3ED2A0248_49A3ECCB0366get_impl*
  Result := Items;
//#UC END# *49A3ED2A0248_49A3ECCB0366get_impl*
 end;//with Self
end;//TMenu_Get_Items
{$IfEnd} //not XE

procedure TMenu_Get_Items_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenu);
 try
  Value := tc5PublicInfo.VarFromObject(TMenu_Get_Items(TMenu(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TMenu_Get_Items_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TMenu);
 try
  Value := tc6PublicInfo.VarFromObject(TMenu_Get_Items(TMenu(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure _RegisterPublicInformation5;
begin
 tc5PublicInfo._RegisterMethod(TMenu, tc5OpenAppClasses.mtGet, 'Items', TypeInfo(TMenuItem), [], [], TMenu_Get_Items_Pub5);
end;

procedure _RegisterPublicInformation6;
begin
 tc6PublicInfo._RegisterMethod(TMenu, tc6OpenAppClasses.mtGet, 'Items', TypeInfo(TMenuItem), [], [], TMenu_Get_Items_Pub6);
end;

initialization
  _RegisterPublicInformation5;
  _RegisterPublicInformation6;

end.