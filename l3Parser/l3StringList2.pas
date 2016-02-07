unit l3StringList2;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3StringList1,
  l3Types
  ;

type
 _FindDataType_ = Tl3WString;
 _l3Searcher_Parent_ = Tl3StringList1;
 {$Include ..\L3\l3Searcher.imp.pas}
 Tl3StringList2 = class(_l3Searcher_)
 end;//Tl3StringList2

implementation

uses
  l3String,
  l3Memory,
  l3Variant
  ;

{$If not Declared(_DataType_)}type _DataType_ = Tl3Ptr;{$IfEnd}
{$If not Declared(_ItemType_)}type _ItemType_ = Tl3PrimString;{$IfEnd}

// start class Tl3StringList2

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_47B9CBCE029D_var*
//#UC END# *47B9BAFD01F4_47B9CBCE029D_var*
begin
//#UC START# *47B9BAFD01F4_47B9CBCE029D_impl*
 Result := l3Compare(anItem.AsWStr, aData, aSortIndex);
//#UC END# *47B9BAFD01F4_47B9CBCE029D_impl*
end;//CompareItemWithData

type _Instance_R_ = Tl3StringList2;

{$Include ..\L3\l3Searcher.imp.pas}

end.