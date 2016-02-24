unit l3RecListWithPartialFind;
 
{$Include l3Define.inc}

interface

uses
  l3ProtoPtrRecListPrim,
  l3Types
  ;

type
 Tl3DataAndSize = record
   rData : Pointer;
   rSize : Cardinal;
 end;//Tl3DataAndSize

 _FindDataType_ = Tl3DataAndSize;
 _l3Searcher_Parent_ = Tl3ProtoPtrRecListPrim;
 {$Include l3Searcher.imp.pas}
 Tl3RecListWithPartialFind = class(_l3Searcher_)
 public
 // public methods
   function FindPart(const aData;
    aDataSize: Cardinal;
    out theIndex: Integer): Boolean;
     {* поиск по началу записи, размер сравниваемых данных в aDataSize }
 end;//Tl3RecListWithPartialFind

implementation

// start class Tl3RecListWithPartialFind

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_47BC6C30022F_var*
//#UC END# *47B9BAFD01F4_47BC6C30022F_var*
begin
//#UC START# *47B9BAFD01F4_47BC6C30022F_impl*
 Assert(aSortIndex = l3_siNative);
 Result := Tl3RecListWithPartialFind(aList).DoCompare(anItem, aData.rData^, aData.rSize);
//#UC END# *47B9BAFD01F4_47BC6C30022F_impl*
end;//CompareItemWithData

type _Instance_R_ = Tl3RecListWithPartialFind;

{$Include l3Searcher.imp.pas}

// start class Tl3RecListWithPartialFind

function Tl3RecListWithPartialFind.FindPart(const aData;
  aDataSize: Cardinal;
  out theIndex: Integer): Boolean;
//#UC START# *47BF0AB902EB_47BC6C30022F_var*
var
 l_DS : Tl3DataAndSize;                                       
//#UC END# *47BF0AB902EB_47BC6C30022F_var*
begin
//#UC START# *47BF0AB902EB_47BC6C30022F_impl*
 l_DS.rData := @aData;
 l_DS.rSize := aDataSize;
 Result := FindData(l_DS, theIndex);
//#UC END# *47BF0AB902EB_47BC6C30022F_impl*
end;//Tl3RecListWithPartialFind.FindPart

end.