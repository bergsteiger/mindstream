unit l3RectList;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Units,
  l3ProtoDataContainer,
  l3Memory,
  l3Interfaces,
  l3Types,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Tl3Rect;
 _l3RecordListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3RecordListPrim.imp.pas}
 Tl3RectList = class(_l3RecordListPrim_)
  {* Список Tl3Rect }
 end;//Tl3RectList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3RectList

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_4E26F5230116_var*
//#UC END# *47B07CF403D0_4E26F5230116_var*
begin
//#UC START# *47B07CF403D0_4E26F5230116_impl*
 Result := false;
 Assert(false);
//#UC END# *47B07CF403D0_4E26F5230116_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4E26F5230116_var*
//#UC END# *47B2C42A0163_4E26F5230116_var*
begin
//#UC START# *47B2C42A0163_4E26F5230116_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4E26F5230116_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4E26F5230116_var*
//#UC END# *47B99D4503A2_4E26F5230116_var*
begin
//#UC START# *47B99D4503A2_4E26F5230116_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_4E26F5230116_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3RectList;

{$Include ..\L3\l3RecordListPrim.imp.pas}

end.