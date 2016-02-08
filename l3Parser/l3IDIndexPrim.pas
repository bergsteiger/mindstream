unit l3IDIndexPrim;

 
{$Include l3Define.inc}

interface

uses
  l3ProtoDataContainer,
  l3Variant,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Tl3PrimString;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UncomparabeObjectRefList.imp.pas}
 Tl3IDIndexPrim = class(_l3UncomparabeObjectRefList_)
  {* Индекс объектов по их Handle. }
 end;//Tl3IDIndexPrim

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3IDIndexPrim

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47B9AB6902AF_var*
//#UC END# *47B2C42A0163_47B9AB6902AF_var*
begin
//#UC START# *47B2C42A0163_47B9AB6902AF_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47B9AB6902AF_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47B9AB6902AF_var*
//#UC END# *47B99D4503A2_47B9AB6902AF_var*
begin
//#UC START# *47B99D4503A2_47B9AB6902AF_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := CI.rA^.StringID - CI.rB^.StringID;
//#UC END# *47B99D4503A2_47B9AB6902AF_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3IDIndexPrim;

{$Include l3UncomparabeObjectRefList.imp.pas}

end.