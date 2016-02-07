{$IfNDef l3Items_imp}


{$Define l3Items_imp}
 PFindItemType = ^_ItemType_;

 CompareItemsRec = record
  {* Данные для сравнения элементов списка. }
   rA : PFindItemType;
   rB : PFindItemType;
   {$If defined(l3Items_HasCustomSort)}
   rSortIndex : Tl3SortIndex;
   {$IfEnd} //l3Items_HasCustomSort
   {$If defined(l3Items_CompareItemsRec_NeedsRList)}
   rList : TObject;
   {$IfEnd} //l3Items_CompareItemsRec_NeedsRList
 end;//CompareItemsRec


{$If defined(l3Items_IsProto) AND not defined(l3Items_HasChanging)}
 {$Define l3Items_NoChanging}
{$IfEnd} //l3Items_IsProto AND not l3Items_HasChanging


{$If defined(l3Items_IsProto)}
 {$Define l3Items_NoOwner}
{$IfEnd} //l3Items_IsProto

 _FindDataType_ = _ItemType_;
 _l3Sortable_Parent_ = _l3Items_Parent_;
 {$Include ..\L3\l3Sortable.imp.pas}
 _l3Searcher_Parent_ = _l3Sortable_;
 {$Include ..\L3\l3Searcher.imp.pas}
 _l3Items_ = {abstract mixin} class(_l3Searcher_)
  {* Список }
 private
 // private fields
   f_Count : Integer;
    {* Поле для свойства Count}
 protected
 // property methods
   function pm_GetCapacity: Integer;
   procedure pm_SetCapacity(aValue: Integer);
   function pm_GetLo: Integer;
   procedure pm_SetCount(aValue: Integer); virtual; abstract;
 protected
 // realized methods
   procedure Swap(var I1: _ItemType_;
    var I2: _ItemType_); override;
     {* Меняет элементы хранилища местами. Не проверяет валидность индексов. }
 protected
 // protected fields
   f_Data : _DataType_;
 protected
 // protected methods
   procedure DoDelete(Index: Integer); virtual;
     {* Удаляет элемент с индексом Index. Не проверяет валидность индекса. }
   procedure FillSlot(var aPlace: _ItemType_;
    const anItem: _ItemType_);
     {* Заполняет место элемента его значением. }
   procedure DirectInsert(anIndex: Integer;
    const aData: _ItemType_); virtual;
     {* Непосредственное удаление элемента. Без проверки валидности индекса. }
   procedure CheckSetItem(anIndex: Integer); virtual;
     {* Проверяет валидность индекса при вставке. }
   procedure BeforeAddToCache; override;
   procedure Release; override;
   procedure CheckIndex(Index: Integer); // can raise EListError
     {* проверяет валидность индекса и поднимает исключение, если он неправильный. }
   procedure FreeSlot(var aPlace: _ItemType_);
   function ExpandSize(aTargetSize: Integer): Integer; virtual;
   function GetEmpty: Boolean; override;
   {$If defined(l3Items_NeedsBeforeFreeItem)}
   procedure BeforeFreeItem(var aPlace: _ItemType_); virtual;
     {* Нотификация потомкам об освобождении элемента списка }
   {$IfEnd} //l3Items_NeedsBeforeFreeItem
 public
 // public methods
   procedure Delete(Index: Integer);
     {* удалить элемент с индексом Index. }
   function ItemSlot(anIndex: Integer): PItemType;
   procedure Exchange(I1: Integer;
    I2: Integer);
     {* Меняет элементы списка местами. Проверяет валидность индекса. }
   function IterateF(I1: Tl3Index;
    I2: Tl3Index;
    Action: Tl3IteratorAction): Integer;
   function IterateAllF(Action: Tl3IteratorAction): Integer;
 public
 // public properties
   property Capacity: Integer
     read pm_GetCapacity
     write pm_SetCapacity;
     {* мощность списка, может быть больше _Count. }
   property Lo: Integer
     read pm_GetLo;
   property Count: Integer
     read f_Count
     write pm_SetCount;
     {* Число элементов. }
 end;//_l3Items_

{$Else l3Items_imp}

// start class _l3Items_

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer; forward;

function DoCompareItems(const A: _ItemType_;
  const B: _ItemType_;
  aSortIndex: Tl3SortIndex
  {$If defined(l3Items_CompareItemsRec_NeedsRList)}
  ;
  aList: _l3Sortable_
  {$IfEnd} //l3Items_CompareItemsRec_NeedsRList
  ): Integer;
//#UC START# *47B5B5F1038E_47B45152003F_var*
var
 l_CI : CompareItemsRec;
//#UC END# *47B5B5F1038E_47B45152003F_var*
begin
//#UC START# *47B5B5F1038E_47B45152003F_impl*
 {$IfDef l3Items_CompareItemsRec_NeedsRList}
 Assert(aList Is _l3Items_);
 {$EndIf l3Items_CompareItemsRec_NeedsRList}
 l_CI.rA := @A;
 l_CI.rB := @B;
 {$IfDef l3Items_HasCustomSort}
 l_CI.rSortIndex := aSortIndex;
 {$EndIf l3Items_HasCustomSort}
 {$IfDef l3Items_CompareItemsRec_NeedsRList}
 l_CI.rList := aList;
 {$EndIf l3Items_CompareItemsRec_NeedsRList}
 Result := CompareExistingItems(l_CI);
//#UC END# *47B5B5F1038E_47B45152003F_impl*
end;//DoCompareItems

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_47B45152003F_var*
var
 l_CI : CompareItemsRec;
//#UC END# *47B9BAFD01F4_47B45152003F_var*
begin
//#UC START# *47B9BAFD01F4_47B45152003F_impl*
 Assert(aList Is _l3Items_);
 l_CI.rA := @anItem;
 l_CI.rB := @aData;
 {$IfDef l3Items_HasCustomSort}
 l_CI.rSortIndex := aSortIndex;
 {$EndIf l3Items_HasCustomSort}
 {$IfDef l3Items_CompareItemsRec_NeedsRList}
 l_CI.rList := aList;
 {$EndIf l3Items_CompareItemsRec_NeedsRList}
 Result := CompareExistingItems(l_CI);
//#UC END# *47B9BAFD01F4_47B45152003F_impl*
end;//CompareItemWithData


{$Include ..\L3\l3Sortable.imp.pas}


{$Include ..\L3\l3Searcher.imp.pas}

// start class _l3Items_

function _l3Items_.pm_GetCapacity: Integer;
//#UC START# *47B5982200F8_47B45152003Fget_var*
//#UC END# *47B5982200F8_47B45152003Fget_var*
begin
//#UC START# *47B5982200F8_47B45152003Fget_impl*
 Result := GetCapacity(Self);
//#UC END# *47B5982200F8_47B45152003Fget_impl*
end;//_l3Items_.pm_GetCapacity

procedure _l3Items_.pm_SetCapacity(aValue: Integer);
//#UC START# *47B5982200F8_47B45152003Fset_var*

 procedure SayBadCap(NewCapacity: LongInt);
 begin
  raise EListError.CreateFmt(sListIndexError, [NewCapacity]);
 end;

//#UC END# *47B5982200F8_47B45152003Fset_var*
begin
//#UC START# *47B5982200F8_47B45152003Fset_impl*
 if (aValue < 0) then
  SayBadCap(aValue);
 if (GetCapacity(Self) <> aValue) then
 begin
  { If the list is shrinking, then update _Count for the smaller size. }
  if (aValue < f_Count) then
   Count := aValue;
  ReAllocList(aValue, Self);
 end;//GetCapacity(Self) <> aValue
//#UC END# *47B5982200F8_47B45152003Fset_impl*
end;//_l3Items_.pm_SetCapacity

function _l3Items_.pm_GetLo: Integer;
//#UC START# *47B97BE20318_47B45152003Fget_var*
//#UC END# *47B97BE20318_47B45152003Fget_var*
begin
//#UC START# *47B97BE20318_47B45152003Fget_impl*
 Result := 0;
//#UC END# *47B97BE20318_47B45152003Fget_impl*
end;//_l3Items_.pm_GetLo

procedure _l3Items_.Delete(Index: Integer);
//#UC START# *47B486CB037A_47B45152003F_var*
//#UC END# *47B486CB037A_47B45152003F_var*
begin
//#UC START# *47B486CB037A_47B45152003F_impl*
 CheckIndex(Index);
 DoDelete(Index);
//#UC END# *47B486CB037A_47B45152003F_impl*
end;//_l3Items_.Delete

procedure _l3Items_.DoDelete(Index: Integer);
//#UC START# *47B4895F01BE_47B45152003F_var*
var
 l_P : PItemType;
//#UC END# *47B4895F01BE_47B45152003F_var*
begin
//#UC START# *47B4895F01BE_47B45152003F_impl*
 {$IfNDef l3Items_NoChanging}
 Changing;
 try
 {$EndIf l3Items_NoChanging}
  l_P := ItemSlot(Index);
  Dec(f_Count);
  FreeSlot(l_P^);
  if (Index <> f_Count) then
   MoveItems(Index, Succ(Index), f_Count-Index, Self);
  {$If not defined(l3Items_IsAtomic)}
   l3FillChar(Pointer(ItemSlot(f_Count))^,
              {$If Declared(cItemSize)}
              cItemSize
              {$Else}
              _Instance_R_(Self).ItemSize
              {$IfEnd}
              );
   // - это для того, чтобы не оказалось лишней ссылки на строки и/или интерфейсы
  {$IfEnd}
 {$IfNDef l3Items_NoChanging}
 finally
  Changed;
 end;//try..finally
 {$EndIf  l3Items_NoChanging}
//#UC END# *47B4895F01BE_47B45152003F_impl*
end;//_l3Items_.DoDelete

procedure _l3Items_.FillSlot(var aPlace: _ItemType_;
  const anItem: _ItemType_);
//#UC START# *47B49B1D033E_47B45152003F_var*
//#UC END# *47B49B1D033E_47B45152003F_var*
begin
//#UC START# *47B49B1D033E_47B45152003F_impl*
 {$IfNDef l3Items_NoChanging}
 Changing;
 {$EndIf  l3Items_NoChanging}
 FillItem(aPlace, anItem{$IfDef l3Items_FillItem_NeedsList}, Self{$EndIf});
 {$IfNDef l3Items_NoChanging}
 Changed;
 {$EndIf  l3Items_NoChanging}
//#UC END# *47B49B1D033E_47B45152003F_impl*
end;//_l3Items_.FillSlot

procedure _l3Items_.DirectInsert(anIndex: Integer;
  const aData: _ItemType_);
//#UC START# *47B49EC50034_47B45152003F_var*
var
 l_Cap   : Integer;
 l_Count : Integer;
//#UC END# *47B49EC50034_47B45152003F_var*
begin
//#UC START# *47B49EC50034_47B45152003F_impl*
 {$IfNDef l3Items_NoChanging}
 Changing;
 try
 {$EndIf  l3Items_NoChanging}
  l_Count := f_Count;
  l_Cap := GetCapacity(Self);
  if (l_Count >= l_Cap) then
   ReAllocList(ExpandSize(l_Cap + 1), Self);
  { Make room for the inserted item. }
  Dec(l_Count, anIndex);
  if (l_Count > 0) then
  begin
   MoveItems(anIndex + 1, anIndex + 0, l_Count, Self);
   {$If not defined(l3Items_IsAtomic)}
   l3FillChar(Pointer(ItemSlot(anIndex))^,
              {$If Declared(cItemSize)}
              cItemSize
              {$Else}
              _Instance_R_(Self).ItemSize
              {$IfEnd}
              );
   // - это для того, чтобы не оказалось лишней ссылки на строки и/или интерфейсы
   {$IfEnd}
  end;//l_Count > 0
  FillItem(ItemSlot(anIndex)^, aData{$IfDef l3Items_FillItem_NeedsList}, Self{$EndIf});
  Inc(f_Count);
  {$IfDef l3Items_IsAtomic}
  Assert(ItemSlot(anIndex)^ = aData);
  {$Else  l3Items_IsAtomic}
  {$If (SizeOf(_ItemType_) <= 4) AND not Defined(l3Items_Uncomparable)}
  Assert(ItemSlot(anIndex)^ = aData);
  {$IfEnd}
  {$EndIf l3Items_IsAtomic}
 {$IfNDef l3Items_NoChanging}
 finally
  Changed;
 end;//try..finally
 {$EndIf  l3Items_NoChanging}
//#UC END# *47B49EC50034_47B45152003F_impl*
end;//_l3Items_.DirectInsert

procedure _l3Items_.CheckSetItem(anIndex: Integer);
//#UC START# *47B49FF70034_47B45152003F_var*
//#UC END# *47B49FF70034_47B45152003F_var*
begin
//#UC START# *47B49FF70034_47B45152003F_impl*
 CheckIndex(anIndex);
//#UC END# *47B49FF70034_47B45152003F_impl*
end;//_l3Items_.CheckSetItem

procedure _l3Items_.BeforeAddToCache;
//#UC START# *47B5A5B00230_47B45152003F_var*
//#UC END# *47B5A5B00230_47B45152003F_var*
begin
//#UC START# *47B5A5B00230_47B45152003F_impl*
 {$If not defined(l3Items_NoSort)}
 Sorted := false;
 {$IfEnd} //not l3Items_NoSort
 Count := 0;
 if (f_Data.GetSize > 4 * 1024) then
  f_Data.SetSize(0);
  // - это видимо, чтобы в кеш не попадали большие куски памяти
 inherited;
//#UC END# *47B5A5B00230_47B45152003F_impl*
end;//_l3Items_.BeforeAddToCache

procedure _l3Items_.Release;
//#UC START# *47B5A5BF00D1_47B45152003F_var*
//#UC END# *47B5A5BF00D1_47B45152003F_var*
begin
//#UC START# *47B5A5BF00D1_47B45152003F_impl*
 Count := 0;
 f_Data.SetSize(0);
 inherited;
//#UC END# *47B5A5BF00D1_47B45152003F_impl*
end;//_l3Items_.Release

procedure _l3Items_.CheckIndex(Index: Integer); // can raise EListError
//#UC START# *47B5B7B6011A_47B45152003F_var*

 procedure _Error;
 begin
  raise EListError.CreateFmt(SListIndexError + ' from (%d)', [Index, f_Count])
 end;

//#UC END# *47B5B7B6011A_47B45152003F_var*
begin
//#UC START# *47B5B7B6011A_47B45152003F_impl*
 if (Index < 0) or (Index >= f_Count) then
  _Error;
//#UC END# *47B5B7B6011A_47B45152003F_impl*
end;//_l3Items_.CheckIndex

function _l3Items_.ItemSlot(anIndex: Integer): PItemType;
//#UC START# *47B5BDCD035D_47B45152003F_var*
//#UC END# *47B5BDCD035D_47B45152003F_var*
begin
//#UC START# *47B5BDCD035D_47B45152003F_impl*
 Result := GetItemSlot(anIndex, Self);
//#UC END# *47B5BDCD035D_47B45152003F_impl*
end;//_l3Items_.ItemSlot

procedure _l3Items_.FreeSlot(var aPlace: _ItemType_);
//#UC START# *47B947FD009A_47B45152003F_var*
//#UC END# *47B947FD009A_47B45152003F_var*
begin
//#UC START# *47B947FD009A_47B45152003F_impl*
 {$IfDef l3Items_NeedsBeforeFreeItem}
 BeforeFreeItem(aPlace);
 {$EndIf l3Items_NeedsBeforeFreeItem}
 FreeItem(aPlace{$IfDef l3Items_FreeItem_NeedsList}, Self{$EndIf});
//#UC END# *47B947FD009A_47B45152003F_impl*
end;//_l3Items_.FreeSlot

function _l3Items_.ExpandSize(aTargetSize: Integer): Integer;
//#UC START# *47B975AF02ED_47B45152003F_var*
const
 cIncrArray : array [0..3] of Integer = (64 * 1024, 1024, 128, 4);
 cMaxForTwice : Integer = 1 * 1024 * 1024;
var
 I : Integer;
//#UC END# *47B975AF02ED_47B45152003F_var*
begin
//#UC START# *47B975AF02ED_47B45152003F_impl*
 Assert(aTargetSize > 0);

 Result := aTargetSize;
 if Result > cMaxForTwice then
 // большие массивы не удваиваем а подравниваем под 64мб
  Result := (aTargetSize div cMaxForTwice + 1) * cMaxForTwice
 else
 for I := 0 to High(cIncrArray) do
  if (aTargetSize > cIncrArray[I]) then
  begin
   Result := (aTargetSize div cIncrArray[I]) * cIncrArray[I] * 2;
   Break;
  end;//aTargetSize > cIncrArray[I]
//#UC END# *47B975AF02ED_47B45152003F_impl*
end;//_l3Items_.ExpandSize

function _l3Items_.GetEmpty: Boolean;
//#UC START# *47B97B0A0268_47B45152003F_var*
//#UC END# *47B97B0A0268_47B45152003F_var*
begin
//#UC START# *47B97B0A0268_47B45152003F_impl*
 Result := (Count <= 0);
//#UC END# *47B97B0A0268_47B45152003F_impl*
end;//_l3Items_.GetEmpty

procedure _l3Items_.Exchange(I1: Integer;
  I2: Integer);
//#UC START# *47BB01F000D3_47B45152003F_var*
//#UC END# *47BB01F000D3_47B45152003F_var*
begin
//#UC START# *47BB01F000D3_47B45152003F_impl*
 CheckIndex(I1);
 CheckIndex(I2);
 Swap(ItemSlot(I1)^, ItemSlot(I2)^);
//#UC END# *47BB01F000D3_47B45152003F_impl*
end;//_l3Items_.Exchange

function _l3Items_.IterateF(I1: Tl3Index;
  I2: Tl3Index;
  Action: Tl3IteratorAction): Integer;
//#UC START# *47BEED100067_47B45152003F_var*
//#UC END# *47BEED100067_47B45152003F_var*
begin
//#UC START# *47BEED100067_47B45152003F_impl*
 try
  Result := _Instance_R_{_l3Items_R_}(Self).Iterate(I1, I2, Action);
 finally
  l3FreeIA(Action);
 end;//try..finally
//#UC END# *47BEED100067_47B45152003F_impl*
end;//_l3Items_.IterateF

function _l3Items_.IterateAllF(Action: Tl3IteratorAction): Integer;
//#UC START# *47BEED3D038B_47B45152003F_var*
//#UC END# *47BEED3D038B_47B45152003F_var*
begin
//#UC START# *47BEED3D038B_47B45152003F_impl*
 try
  Result := _Instance_R_{_l3Items_R_}(Self).IterateAll(Action);
 finally
  l3FreeIA(Action);
 end;//try..finally
//#UC END# *47BEED3D038B_47B45152003F_impl*
end;//_l3Items_.IterateAllF

{$If defined(l3Items_NeedsBeforeFreeItem)}
procedure _l3Items_.BeforeFreeItem(var aPlace: _ItemType_);
//#UC START# *4B87FCF8038B_47B45152003F_var*
//#UC END# *4B87FCF8038B_47B45152003F_var*
begin
//#UC START# *4B87FCF8038B_47B45152003F_impl*
 // - ничего не делаем
//#UC END# *4B87FCF8038B_47B45152003F_impl*
end;//_l3Items_.BeforeFreeItem
{$IfEnd} //l3Items_NeedsBeforeFreeItem

procedure _l3Items_.Swap(var I1: _ItemType_;
  var I2: _ItemType_);
//#UC START# *47B5B88203A7_47B45152003F_var*
//#UC END# *47B5B88203A7_47B45152003F_var*
begin
//#UC START# *47B5B88203A7_47B45152003F_impl*
 if (@I1 = @I2) then
  Exit;
 {$IfNDef l3Items_NoChanging}
 Changing;
 try
 {$EndIf  l3Items_NoChanging}
  DoExchange(I1, I2{$IfDef l3Items_FillItem_NeedsList}, Self{$EndIf});
 {$IfNDef l3Items_NoChanging}
 finally
  Changed;
 end;//try..finally
 {$EndIf l3Items_NoChanging}
//#UC END# *47B5B88203A7_47B45152003F_impl*
end;//_l3Items_.Swap

{$EndIf l3Items_imp}
