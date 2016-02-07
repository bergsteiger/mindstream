{$IfNDef l3UntypedList_imp}
 
{$Define l3UntypedList_imp}
 VOID = record
  {* Специальный тип, заменяющий void в C++. }
   aLong : Integer;
   aByte : Integer;
 end;//VOID

 {$Define l3Items_FillItem_NeedsList}
 { Функции обработки элементов списка требуют знания о самом списке }

 {$Define l3Items_CompareItemsRec_NeedsRList}

 _ItemType_ = VOID;
 _l3Items_Parent_ = _l3UntypedList_Parent_;
 {$Include ..\L3\l3Items.imp.pas}
 _l3UntypedList_ = {abstract mixin} class(_l3Items_)
 protected
 // property methods
   function pm_GetItemSize: Integer; virtual; abstract;
 protected
 // realized methods
   procedure pm_SetCount(aValue: Integer); override;
 protected
 // protected methods
   function DoCompare(const A;
    const B;
    DataSize: Cardinal): Integer; virtual; abstract;
     {* Сравнивает элементы. }
   procedure DoInsert(anIndex: Integer;
    const aData); // can raise EListError
   function DoAdd(const aData): Integer; // can raise El3DuplicateItem
 public
 // public methods
   procedure Clear;
     {* Очищает список. }
   function Iterate(aLo: Tl3Index;
    aHi: Tl3Index;
    Action: Tl3IteratorAction): Integer;
     {* перебирает все элементы хранилища с aLo по aHi. }
   function IterateAll(Action: Tl3IteratorAction): Integer;
     {* перебирает все элементы хранилища. }
   function Add(const aData): Integer;
   function Find(const aData;
    out theIndex: Integer): Boolean;
     {* Находит данные, при помощи основной операции сравнения. }
   procedure Insert(anIndex: Integer;
    const aData);
 public
 // public properties
   property ItemSize: Integer
     read pm_GetItemSize;
 end;//_l3UntypedList_

{$Else l3UntypedList_imp}

// start class _l3UntypedList_

procedure ReAllocList(NewCapacity: Integer;
  aList: _l3Items_); forward;

function GetCapacity(aList: _l3Items_): Integer; forward;

procedure DoExchange(var A: _ItemType_;
  var B: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  ); forward;

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

function GetItemSlot(anIndex: Integer;
  aList: _l3Items_): PItemType; forward;

procedure MoveItems(Dst: Integer;
  Src: Integer;
  aSize: Cardinal;
  aList: _l3Items_);
//#UC START# *47B48A510176_47B433E500BC_var*
var
 l_Sz : Integer;
 l_S  : Integer;
 l_D  : Integer;
 l_IS : Integer;
 l_B  : PAnsiChar;
//#UC END# *47B48A510176_47B433E500BC_var*
begin
//#UC START# *47B48A510176_47B433E500BC_impl*
 if (aSize > 0) then
 begin
  l_B := aList.f_Data.AsPointer;
  l_IS := _l3UntypedList_(aList).ItemSize;
  Case l_IS of
   4:
   begin
    l_S := Src shl 2;
    l_D := Dst shl 2;
    if (aSize = 1) then
    begin
     PLong(l_B + l_D)^ := PLong(l_B + l_S)^;
     Exit;
    end//aSize = 1
    else
     l_Sz := aSize shl 2;
   end;//4
   else
   begin
    l_Sz := aSize * l_IS;
    l_S := Src * l_IS;
    l_D := Dst * l_IS;
   end;//else
  end;//Case l_IS
  l3Move((l_B + l_S)^, (l_B + l_D)^, l_Sz);
 end;//aSize > 0
//#UC END# *47B48A510176_47B433E500BC_impl*
end;//MoveItems

procedure ReAllocList(NewCapacity: Integer;
  aList: _l3Items_);
//#UC START# *47B5976F024E_47B433E500BC_var*
var
 l_Cap : Integer;
 l_Cnt : Integer;
 l_Sz  : Integer;
//#UC END# *47B5976F024E_47B433E500BC_var*
begin
//#UC START# *47B5976F024E_47B433E500BC_impl*
 l_Sz := _l3UntypedList_(aList).ItemSize;
 aList.f_Data.SetSize(NewCapacity * l_Sz);
 l_Cap := GetCapacity(aList);
 l_Cnt := aList.f_Count;
 if (l_Cap > l_Cnt) then
  l3ZeroMemory(aList.ItemSlot(l_Cnt), (l_Cap - l_Cnt) * l_Sz);
//#UC END# *47B5976F024E_47B433E500BC_impl*
end;//ReAllocList

function GetCapacity(aList: _l3Items_): Integer;
//#UC START# *47B5984B019D_47B433E500BC_var*
//#UC END# *47B5984B019D_47B433E500BC_var*
begin
//#UC START# *47B5984B019D_47B433E500BC_impl*
 Result := aList.f_Data.GetSize div _l3UntypedList_(aList).ItemSize;
//#UC END# *47B5984B019D_47B433E500BC_impl*
end;//GetCapacity

procedure DoExchange(var A: _ItemType_;
  var B: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B5C4080270_47B433E500BC_var*
//#UC END# *47B5C4080270_47B433E500BC_var*
begin
//#UC START# *47B5C4080270_47B433E500BC_impl*
 l3Swap(A, B, _l3UntypedList_(anItems).ItemSize);
//#UC END# *47B5C4080270_47B433E500BC_impl*
end;//DoExchange

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B935AF0066_47B433E500BC_var*
//#UC END# *47B935AF0066_47B433E500BC_var*
begin
//#UC START# *47B935AF0066_47B433E500BC_impl*
 l3Move(anItem, aPlace, _l3UntypedList_(anItems).ItemSize);
//#UC END# *47B935AF0066_47B433E500BC_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_47B433E500BC_var*
//#UC END# *47B94A5C006E_47B433E500BC_var*
begin
//#UC START# *47B94A5C006E_47B433E500BC_impl*
 // - ничего освобождать не нужно
//#UC END# *47B94A5C006E_47B433E500BC_impl*
end;//FreeItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47B433E500BC_var*
//#UC END# *47B99D4503A2_47B433E500BC_var*
begin
//#UC START# *47B99D4503A2_47B433E500BC_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := _l3UntypedList_(CI.rList).DoCompare(CI.rA^, CI.rB^, 0);
//#UC END# *47B99D4503A2_47B433E500BC_impl*
end;//CompareExistingItems

function GetItemSlot(anIndex: Integer;
  aList: _l3Items_): PItemType;
//#UC START# *47BEDF2A02EA_47B433E500BC_var*
//#UC END# *47BEDF2A02EA_47B433E500BC_var*
begin
//#UC START# *47BEDF2A02EA_47B433E500BC_impl*
 Result := Pointer(aList.f_Data.AsPointer + anIndex * _l3UntypedList_(aList).ItemSize);
//#UC END# *47BEDF2A02EA_47B433E500BC_impl*
end;//GetItemSlot


{$Include ..\L3\l3Items.imp.pas}

// start class _l3UntypedList_

procedure _l3UntypedList_.Clear;
//#UC START# *47BC108C03C9_47B433E500BC_var*
//#UC END# *47BC108C03C9_47B433E500BC_var*
begin
//#UC START# *47BC108C03C9_47B433E500BC_impl*
 Count := 0;
//#UC END# *47BC108C03C9_47B433E500BC_impl*
end;//_l3UntypedList_.Clear

function _l3UntypedList_.Iterate(aLo: Tl3Index;
  aHi: Tl3Index;
  Action: Tl3IteratorAction): Integer;
//#UC START# *47BEEBE602B1_47B433E500BC_var*
var
 i, j, k   : Long;
 l_Current : PAnsiChar;
 l_ElSize  : Long;
//#UC END# *47BEEBE602B1_47B433E500BC_var*
begin
//#UC START# *47BEEBE602B1_47B433E500BC_impl*
 Result := -1;
 l_Current := f_Data.AsPointer;
 if (l_Current <> nil) then begin
  j := Max(0, aLo);
  k := Min(Pred(Count), aHi);
  l_ElSize := ItemSize;
  Inc(l_Current, j * l_ElSize);
  for i := j to k do begin
   Result := i;
   if not Action(@l_Current, i) then break;
   Inc(l_Current, l_ElSize);
  end//for i
 end;{l_Current <> nil}
//#UC END# *47BEEBE602B1_47B433E500BC_impl*
end;//_l3UntypedList_.Iterate

function _l3UntypedList_.IterateAll(Action: Tl3IteratorAction): Integer;
//#UC START# *47BEEC10022E_47B433E500BC_var*
//#UC END# *47BEEC10022E_47B433E500BC_var*
begin
//#UC START# *47BEEC10022E_47B433E500BC_impl*
 Result := Iterate(Low(Tl3Index), High(Tl3Index), Action);
//#UC END# *47BEEC10022E_47B433E500BC_impl*
end;//_l3UntypedList_.IterateAll

procedure _l3UntypedList_.DoInsert(anIndex: Integer;
  const aData); // can raise EListError
//#UC START# *47BEF05C0032_47B433E500BC_var*

 procedure _Error;
 begin
  raise EListError.CreateFmt(SListIndexError, [anIndex]);
 end;

//#UC END# *47BEF05C0032_47B433E500BC_var*
begin
//#UC START# *47BEF05C0032_47B433E500BC_impl*
 if (anIndex < 0) or (anIndex > f_Count) then
  _Error;
 DirectInsert(anIndex, PItemType(@aData)^) 
//#UC END# *47BEF05C0032_47B433E500BC_impl*
end;//_l3UntypedList_.DoInsert

function _l3UntypedList_.DoAdd(const aData): Integer; // can raise El3DuplicateItem
//#UC START# *47BEF3910285_47B433E500BC_var*

 procedure SayDup(anIndex: Integer);
 begin
  raise El3DuplicateItem.Create(Format('Duplicate Item №%d in %s', [anIndex, ClassName]));
 end;

//#UC END# *47BEF3910285_47B433E500BC_var*
begin
//#UC START# *47BEF3910285_47B433E500BC_impl*
 if (SortIndex <> l3_siUnsorted) then
 begin
  if (f_Count > 0) then
  begin
   if DoFindInsertionPlace(PItemType(@aData)^, Result) then
   begin
    case Duplicates of
     l3_dupIgnore :
      Result := -1;
     l3_dupAccept :
      DirectInsert(Succ(Result), PItemType(@aData)^);
     l3_dupError  :
      SayDup(Result);
     l3_dupAssign :
     begin
      //AssignItem(ItemSlot(Result, l_FD.rItemSize)^, aData);
      Assert(false);
     end;//l3_dupAssign
     l3_dupChange :
     begin
      //DoSetItem(Result, aData);
      Assert(false);
     end;//l3_dupChange
    end;//case Duplicates
   end//DoFindInsertionPlace
   else
    DirectInsert(Result, PItemType(@aData)^);
  end//f_Count > 0
  else
  begin
   Result := 0;
   DirectInsert(Result, PItemType(@aData)^);
  end;//f_Count > 0
 end//SortIndex <> l3_siUnsorted
 else
 begin
  Result := f_Count;
  DirectInsert(Result, PItemType(@aData)^);
 end;//SortIndex <> l3_siUnsorted
//#UC END# *47BEF3910285_47B433E500BC_impl*
end;//_l3UntypedList_.DoAdd

function _l3UntypedList_.Add(const aData): Integer;
//#UC START# *47BEF5130164_47B433E500BC_var*
//#UC END# *47BEF5130164_47B433E500BC_var*
begin
//#UC START# *47BEF5130164_47B433E500BC_impl*
 Result := DoAdd(aData);
//#UC END# *47BEF5130164_47B433E500BC_impl*
end;//_l3UntypedList_.Add

function _l3UntypedList_.Find(const aData;
  out theIndex: Integer): Boolean;
//#UC START# *47BF0A3100F6_47B433E500BC_var*
//#UC END# *47BF0A3100F6_47B433E500BC_var*
begin
//#UC START# *47BF0A3100F6_47B433E500BC_impl*
 Result := FindData(PItemType(@aData)^, theIndex);
//#UC END# *47BF0A3100F6_47B433E500BC_impl*
end;//_l3UntypedList_.Find

procedure _l3UntypedList_.Insert(anIndex: Integer;
  const aData);
//#UC START# *47BF0C7C01D6_47B433E500BC_var*
//#UC END# *47BF0C7C01D6_47B433E500BC_var*
begin
//#UC START# *47BF0C7C01D6_47B433E500BC_impl*
 DoInsert(anIndex, aData);
//#UC END# *47BF0C7C01D6_47B433E500BC_impl*
end;//_l3UntypedList_.Insert

procedure _l3UntypedList_.pm_SetCount(aValue: Integer);
//#UC START# *47BEE088001A_47B433E500BCset_var*

 procedure SayBadCount(aNewCount: LongInt);
 begin
  raise EListError.CreateFmt(sListIndexError, [aNewCount]);
 end;

var
 l_Ptr   : PItemType;
 l_Index : Integer;
 l_Sz    : Integer;
//#UC END# *47BEE088001A_47B433E500BCset_var*
begin
//#UC START# *47BEE088001A_47B433E500BCset_impl*
 if (aValue < 0) then
  SayBadCount(aValue);
 l_Sz := ItemSize;
 if (aValue < f_Count) then
 begin
  l_Ptr := ItemSlot(aValue);
  for l_Index := aValue to Hi do
  begin
   FreeSlot(l_Ptr^);
   Inc(PAnsiChar(l_Ptr), l_Sz);
  end;//for i
 end//aValue < f_Count
 else
 if (aValue > GetCapacity(Self)) then
  ReAllocList(ExpandSize(aValue), Self);
 if (f_Count < aValue) then
  l3ZeroMemory(ItemSlot(f_Count), (aValue - f_Count) * l_Sz);
 f_Count := aValue;
//#UC END# *47BEE088001A_47B433E500BCset_impl*
end;//_l3UntypedList_.pm_SetCount

{$EndIf l3UntypedList_imp}
