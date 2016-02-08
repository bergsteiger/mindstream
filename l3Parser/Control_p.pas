unit Control_p;
 
{$Include w:\common\components\l3Define.inc}

interface

implementation

{$If not defined(XE)}
uses
  Controls,
  Menus,
  Variants {a},
  ActiveX {a},
  tc5OpenAppClasses {a},
  tc5PublicInfo {a},
  tc6OpenAppClasses {a},
  tc6PublicInfo {a}
  ;
{$IfEnd} //not XE

type
 TControlFriend = class(TControl)
 end;//TControlFriend

// start class TControl

{$If not defined(XE)}
function TControl_Get_QCPopupMenu(Self: TControlFriend): TPopupMenu;
//#UC START# *49A575600252_49A572510280get_var*
//#UC END# *49A575600252_49A572510280get_var*
begin
 with Self do
 begin
//#UC START# *49A575600252_49A572510280get_impl*
  Result := PopupMenu;
//#UC END# *49A575600252_49A572510280get_impl*
 end;//with Self
end;//TControl_Get_QCPopupMenu
{$IfEnd} //not XE

procedure TControl_Get_QCPopupMenu_Pub5(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TControl);
 try
  Value := tc5PublicInfo.VarFromObject(TControl_Get_QCPopupMenu(TControlFriend(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure TControl_Get_QCPopupMenu_Pub6(Instance: TObject; Args: PVariantArgList; out Value: OleVariant; Cookie: Cardinal); stdcall;
begin
 Assert(Instance is TControl);
 try
  Value := tc6PublicInfo.VarFromObject(TControl_Get_QCPopupMenu(TControlFriend(Instance)));
 except
  // - гасим исключения
  Value := Unassigned;
 end;//try..except
end;

procedure _RegisterPublicInformation5;
begin
 tc5PublicInfo._RegisterMethod(TControl, tc5OpenAppClasses.mtGet, 'QCPopupMenu', TypeInfo(TPopupMenu), [], [], TControl_Get_QCPopupMenu_Pub5);
end;

procedure _RegisterPublicInformation6;
begin
 tc6PublicInfo._RegisterMethod(TControl, tc6OpenAppClasses.mtGet, 'QCPopupMenu', TypeInfo(TPopupMenu), [], [], TControl_Get_QCPopupMenu_Pub6);
end;

initialization
  _RegisterPublicInformation5;
  _RegisterPublicInformation6;

end.