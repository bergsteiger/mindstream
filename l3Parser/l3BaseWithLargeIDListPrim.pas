unit l3BaseWithLargeIDListPrim;
 
{$Include l3Define.inc}

interface

uses
  l3SimpleDataContainer,
  l3BaseWithID,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Tl3BaseWithID;
 _l3UncomparabeObjectRefList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UncomparabeObjectRefList.imp.pas}
 Tl3BaseWithLargeIDListPrim = class(_l3UncomparabeObjectRefList_)
 end;//Tl3BaseWithLargeIDListPrim

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3BaseWithLargeIDListPrim

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47BDA7D70208_var*
//#UC END# *47B2C42A0163_47BDA7D70208_var*
begin
//#UC START# *47B2C42A0163_47BDA7D70208_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47BDA7D70208_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47BDA7D70208_var*
var
 l_H1 : Integer;
 l_H2 : Integer;
//#UC END# *47B99D4503A2_47BDA7D70208_var*
begin
//#UC START# *47B99D4503A2_47BDA7D70208_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 l_H1 := CI.rA.ID;
 l_H2 := CI.rB.ID;
 if (l_H1 > l_H2) then
  Result := +1
 else
 if (l_H1 < l_H2) then
  Result := -1
 else
  Result := 0;
//#UC END# *47B99D4503A2_47BDA7D70208_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3BaseWithLargeIDListPrim;

{$Include l3UncomparabeObjectRefList.imp.pas}

end.