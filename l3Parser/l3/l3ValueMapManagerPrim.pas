unit l3ValueMapManagerPrim;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3SimpleDataContainer,
  l3Types,
  l3Memory,
  l3Core,
  l3Except,
  Classes
  ;

 {$Define l3Items_HasCustomSort}

type
 _ItemType_ = Il3ValueMap;
 _l3InterfaceRefListPrim_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3InterfaceRefListPrim.imp.pas}
 Tl3ValueMapManagerPrim = class(_l3InterfaceRefListPrim_)
 end;//Tl3ValueMapManagerPrim

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3ValueMapManagerPrim

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_47B9E6DF01DC_var*
//#UC END# *47B07CF403D0_47B9E6DF01DC_var*
begin
//#UC START# *47B07CF403D0_47B9E6DF01DC_impl*
 Result := (A = B);
//#UC END# *47B07CF403D0_47B9E6DF01DC_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47B9E6DF01DC_var*
//#UC END# *47B2C42A0163_47B9E6DF01DC_var*
begin
//#UC START# *47B2C42A0163_47B9E6DF01DC_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47B9E6DF01DC_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47B9E6DF01DC_var*
//#UC END# *47B99D4503A2_47B9E6DF01DC_var*
begin
//#UC START# *47B99D4503A2_47B9E6DF01DC_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Integer(CI.rA^) - Integer(CI.rB^); 
//#UC END# *47B99D4503A2_47B9E6DF01DC_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3ValueMapManagerPrim;

{$Include ..\L3\l3InterfaceRefListPrim.imp.pas}

end.