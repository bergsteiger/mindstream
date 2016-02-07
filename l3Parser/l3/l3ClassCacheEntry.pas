unit l3ClassCacheEntry;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

 {$Define l3Items_NoSort}
 { Сортировка в кеше нам не нужна }

type
 _ItemType_ = TObject;
 _l3ObjectRefListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3ObjectRefListPrim.imp.pas}
 Tl3ClassCacheEntry = class(_l3ObjectRefListPrim_)
 public
 // public methods
   constructor Create; reintroduce;
   function Add(Item: TObject): Integer;
   function DeleteTailWithoutFree: Pointer;
     {* удалить последний элемент, без его отпускания }
 end;//Tl3ClassCacheEntry

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3ClassCacheEntry

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  ); forward;

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  ); forward;

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47A9A53001F6_var*
//#UC END# *47B2C42A0163_47A9A53001F6_var*
begin
//#UC START# *47B2C42A0163_47A9A53001F6_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47A9A53001F6_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B935AF0066_47A9A53001F6_var*
//#UC END# *47B935AF0066_47A9A53001F6_var*
begin
//#UC START# *47B935AF0066_47A9A53001F6_impl*
 aPlace := anItem;
//#UC END# *47B935AF0066_47A9A53001F6_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_47A9A53001F6_var*
//#UC END# *47B94A5C006E_47A9A53001F6_var*
begin
//#UC START# *47B94A5C006E_47A9A53001F6_impl*
 FreeAndNil(aPlace);
//#UC END# *47B94A5C006E_47A9A53001F6_impl*
end;//FreeItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47A9A53001F6_var*
//#UC END# *47B99D4503A2_47A9A53001F6_var*
begin
//#UC START# *47B99D4503A2_47A9A53001F6_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Integer(CI.rA^) - Integer(CI.rB^);
//#UC END# *47B99D4503A2_47A9A53001F6_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3ClassCacheEntry;

{$Include ..\L3\l3ObjectRefListPrim.imp.pas}

// start class Tl3ClassCacheEntry

constructor Tl3ClassCacheEntry.Create;
//#UC START# *47B5A114039E_47A9A53001F6_var*
//#UC END# *47B5A114039E_47A9A53001F6_var*
begin
//#UC START# *47B5A114039E_47A9A53001F6_impl*
 inherited Create;
 {$If not defined(l3Items_NoSort)}
 Sorted := false;
 {$IfEnd} //not l3Items_NoSort
//#UC END# *47B5A114039E_47A9A53001F6_impl*
end;//Tl3ClassCacheEntry.Create

function Tl3ClassCacheEntry.Add(Item: TObject): Integer;
//#UC START# *47B5A13B0025_47A9A53001F6_var*
var
 l_Ptr : PPointer;
 l_Cap : Integer;
//#UC END# *47B5A13B0025_47A9A53001F6_var*
begin
//#UC START# *47B5A13B0025_47A9A53001F6_impl*
 Result := f_Count;
 l_Cap := Capacity;
 if (Result >= l_Cap) then
  ReAllocList(ExpandSize(l_Cap + 1), Self);
 { Make room for the inserted item. }
 PPointer(ItemSlot(Result))^ := Item;
 Inc(f_Count);
//#UC END# *47B5A13B0025_47A9A53001F6_impl*
end;//Tl3ClassCacheEntry.Add

function Tl3ClassCacheEntry.DeleteTailWithoutFree: Pointer;
//#UC START# *47B5A15003B3_47A9A53001F6_var*
var
 l_Pt : PItemType;
//#UC END# *47B5A15003B3_47A9A53001F6_var*
begin
//#UC START# *47B5A15003B3_47A9A53001F6_impl*
 if (f_Count = 0) then
  Result := nil
 else
 begin
  Dec(f_Count);
  l_Pt := ItemSlot(f_Count);
  Result := l_Pt^;
  l_Pt^ := nil;
 end;//f_Count = 0
//#UC END# *47B5A15003B3_47A9A53001F6_impl*
end;//Tl3ClassCacheEntry.DeleteTailWithoutFree

end.