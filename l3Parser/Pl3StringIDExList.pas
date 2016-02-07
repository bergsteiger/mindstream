unit Pl3StringIDExList;
 
{$Include l3Define.inc}

interface

uses
  l3ProtoDataContainer,
  l3StringIDEx,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Pl3StringIDEx;
 _l3AtomicListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3AtomicListPrim.imp.pas}
 TPl3StringIDExList = class(_l3AtomicListPrim_)
 end;//TPl3StringIDExList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class TPl3StringIDExList

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4F9BD2A103C7_var*
//#UC END# *47B99D4503A2_4F9BD2A103C7_var*
begin
//#UC START# *47B99D4503A2_4F9BD2A103C7_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_4F9BD2A103C7_impl*
end;//CompareExistingItems

type _Instance_R_ = TPl3StringIDExList;

{$Include l3AtomicListPrim.imp.pas}

end.