{$IfNDef l3StandardTypedList_imp}
 
{$Define l3StandardTypedList_imp}
 _DataType_ = Tl3Ptr;
 _l3FourByteItemList_Parent_ = _l3StandardTypedList_Parent_;
 {$Include ..\L3\l3FourByteItemList.imp.pas}
 _l3StandardTypedList_ = {abstract mixin} class(_l3FourByteItemList_)
  {* Стандартный типизированный список с размером элемента в 4 байта }
 public
 // public methods
   {$If not defined(l3Items_NoSort)}
   constructor MakeSorted(aDuplicates: Tl3Duplicates = l3_dupIgnore;
    aSortIndex: Tl3SortIndex = l3_siNative);
     {* Создает сортированный список }
   {$IfEnd} //not l3Items_NoSort
   constructor Make;
 end;//_l3StandardTypedList_

{$Else l3StandardTypedList_imp}


{$Include ..\L3\l3FourByteItemList.imp.pas}

// start class _l3StandardTypedList_

{$If not defined(l3Items_NoSort)}
constructor _l3StandardTypedList_.MakeSorted(aDuplicates: Tl3Duplicates = l3_dupIgnore;
  aSortIndex: Tl3SortIndex = l3_siNative);
//#UC START# *47B5B269032B_47B594B50330_var*
//#UC END# *47B5B269032B_47B594B50330_var*
begin
//#UC START# *47B5B269032B_47B594B50330_impl*
 Make;
 Duplicates := aDuplicates;
 SortIndex := aSortIndex;
//#UC END# *47B5B269032B_47B594B50330_impl*
end;//_l3StandardTypedList_.MakeSorted
{$IfEnd} //not l3Items_NoSort

constructor _l3StandardTypedList_.Make;
//#UC START# *47B9868C0046_47B594B50330_var*
//#UC END# *47B9868C0046_47B594B50330_var*
begin
//#UC START# *47B9868C0046_47B594B50330_impl*
 Create;
//#UC END# *47B9868C0046_47B594B50330_impl*
end;//_l3StandardTypedList_.Make

{$EndIf l3StandardTypedList_imp}
