unit l3ClassList;
 
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

type
 _ItemType_ = TClass;
 _l3UnrefcountedList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3UnrefcountedList.imp.pas}
 Tl3ClassList = class(_l3UnrefcountedList_)
 end;//Tl3ClassList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3ClassList

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4773DC1E01B4_var*
//#UC END# *47B99D4503A2_4773DC1E01B4_var*
begin
//#UC START# *47B99D4503A2_4773DC1E01B4_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Integer(CI.rA^) - Integer(CI.rB^);
//#UC END# *47B99D4503A2_4773DC1E01B4_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3ClassList;

{$Include ..\L3\l3UnrefcountedList.imp.pas}

end.