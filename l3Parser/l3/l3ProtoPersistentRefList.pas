unit l3ProtoPersistentRefList;

{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoPersistent,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

 {$Define l3Items_NoSort}

type
 _ItemType_ = Tl3ProtoPersistent;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3UncomparabeObjectRefList.imp.pas}
 Tl3ProtoPersistentRefList = class(_l3UncomparabeObjectRefList_)
 end;//Tl3ProtoPersistentRefList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3ProtoPersistentRefList

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4DD3E41502C0_var*
//#UC END# *47B2C42A0163_4DD3E41502C0_var*
begin
//#UC START# *47B2C42A0163_4DD3E41502C0_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4DD3E41502C0_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4DD3E41502C0_var*
//#UC END# *47B99D4503A2_4DD3E41502C0_var*
begin
//#UC START# *47B99D4503A2_4DD3E41502C0_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Integer(CI.rA^) - Integer(CI.rB^);
//#UC END# *47B99D4503A2_4DD3E41502C0_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3ProtoPersistentRefList;

{$Include ..\L3\l3UncomparabeObjectRefList.imp.pas}

end.