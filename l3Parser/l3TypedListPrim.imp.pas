{$IfNDef l3TypedListPrim_imp}

{$Define l3TypedListPrim_imp}
const
  { Sizes }
 cItemSize = SizeOf(_ItemType_);

type
 _l3Items_Parent_ = _l3TypedListPrim_Parent_;
 {$Include l3Items.imp.pas}
 _l3TypedListPrim_ = {abstract mixin} class(_l3Items_)
 private
 // private fields
  {$If defined(l3Items_HasCustomSort) AND not defined(l3Items_NoSort)}
   f_SortIndex : Tl3SortIndex;
  {$IfEnd} //l3Items_HasCustomSort AND not l3Items_NoSort
  {$If not defined(l3Items_HasCustomSort) AND not defined(l3Items_NoSort)}
   f_Sorted : Boolean;
  {$IfEnd} //not l3Items_HasCustomSort AND not l3Items_NoSort
 protected
 // property methods
   function pm_GetLast: _ItemType_;
   procedure pm_SetLast(const aValue: _ItemType_);
   function pm_GetFirst: _ItemType_;
 protected
 // realized methods
   procedure pm_SetCount(aValue: Integer); override;
 protected
 // overridden protected methods
   function DoGetSortIndex: Tl3SortIndex; override;
   procedure DoSetSortIndex(Value: Tl3SortIndex); override;
 protected
 // protected methods
   function GetItem(Index: Integer): _ItemType_; virtual;
   function DoAdd(const aData: _ItemType_): Integer; // can raise El3DuplicateItem
     {* Добавляет элемент в список. }
   procedure DoInsert(anIndex: Integer;
    const aData: _ItemType_); // can raise EListError
   procedure DoSetItem(anIndex: Integer;
    const anItem: _ItemType_); virtual;
 public
 // public methods
    {$If defined(l3Items_IsProto)}
   function Clone: Pointer; overload; 
    {$IfEnd} //l3Items_IsProto
    {$If defined(l3Items_IsProto)}
   procedure Assign(anOther: _l3TypedListPrim_); overload; 
    {$IfEnd} //l3Items_IsProto
   procedure Insert(anIndex: Integer;
    const anItem: _ItemType_);
     {* Вставляет элемент в список. }
   function IndexOf(const anItem: _ItemType_): Integer; virtual;
     {* Возвращает индекс элемента списка или -1, если элемента в списке нет. }
   function Remove(const anItem: _ItemType_): Integer;
     {* Удаляет элемент из списка и возвращает его индекс. }
   function Add(const anItem: _ItemType_): Integer; virtual;
     {* Добавляет элемент списка. }
   procedure Move(CurIndex: Integer;
    NewIndex: Integer);
     {* передвигает элементы списка. }
   function IterateBackF(aHi: Tl3Index;
    aLo: Tl3Index;
    anAction: Tl3IteratorAction): Integer;
     {* перебирает элементы списка в обратном порядке и освобождает заглушку для anAction. }
   function IterateBack(aHi: Tl3Index;
    aLo: Tl3Index;
    anAction: Tl3IteratorAction): Integer;
     {* перебирает элементы списка в обратном порядке. }
   {$If not defined(l3Items_IsProto)}
   procedure Assign(Source: TPersistent); overload;  override;
   {$IfEnd} //not l3Items_IsProto
   function JoinWith(aList: _l3TypedListPrim_): Integer; overload;  virtual;
     {* Объединяет один список с другим. }
   function Iterate(aLo: Tl3Index;
    aHi: Tl3Index;
    Action: Tl3IteratorAction): Integer;
     {* перебирает все элементы хранилища с aLo по aHi. }
   function IterateAll(Action: Tl3IteratorAction): Integer;
     {* перебирает все элементы хранилища. }
   procedure Clear; virtual;
   procedure DeleteLast;
     {* Удаляет последний элемент списка. }
   constructor Create; reintroduce; virtual;
   {$If not defined(l3Items_IsProto)}
   function Clone: Pointer; overload; 
     {* функция для получения копии объекта. }
   {$IfEnd} //not l3Items_IsProto
 public
 // public properties
   property Last: _ItemType_
     read pm_GetLast
     write pm_SetLast;
   property First: _ItemType_
     read pm_GetFirst;
 end;//_l3TypedListPrim_

{$Else l3TypedListPrim_imp}

// start class _l3TypedListPrim_

function GetCapacity(aList: _l3Items_): Integer; forward;

function GetItemSlot(anIndex: Integer;
  aList: _l3Items_): PItemType; forward;

procedure ReAllocList(NewCapacity: Integer;
  aList: _l3Items_);
//#UC START# *47B5976F024E_47A74A5F0123_var*
var
 l_Cap : Integer;
 l_Cnt : Integer;
//#UC END# *47B5976F024E_47A74A5F0123_var*
begin
//#UC START# *47B5976F024E_47A74A5F0123_impl*
 aList.f_Data.SetSize(NewCapacity * cItemSize);
 l_Cap := GetCapacity(aList);
 Assert(l_Cap >= NewCapacity);
 l_Cnt := aList.f_Count;
 if (l_Cap > l_Cnt) then
  l3ZeroMemory(aList.ItemSlot(l_Cnt), (l_Cap - l_Cnt) * cItemSize);
//#UC END# *47B5976F024E_47A74A5F0123_impl*
end;//ReAllocList

function GetCapacity(aList: _l3Items_): Integer;
//#UC START# *47B5984B019D_47A74A5F0123_var*
//#UC END# *47B5984B019D_47A74A5F0123_var*
begin
//#UC START# *47B5984B019D_47A74A5F0123_impl*
 Result := aList.f_Data.GetSize div cItemSize;
//#UC END# *47B5984B019D_47A74A5F0123_impl*
end;//GetCapacity

function GetItemSlot(anIndex: Integer;
  aList: _l3Items_): PItemType;
//#UC START# *47BEDF2A02EA_47A74A5F0123_var*
//#UC END# *47BEDF2A02EA_47A74A5F0123_var*
begin
//#UC START# *47BEDF2A02EA_47A74A5F0123_impl*
 Result := Pointer(aList.f_Data.AsPointer + anIndex * cItemSize);
 assert(Result <> nil);
//#UC END# *47BEDF2A02EA_47A74A5F0123_impl*
end;//GetItemSlot


{$Include l3Items.imp.pas}

type
  PLong = ^Integer;
   {* Указатель на целое. }

// start class _l3TypedListPrim_

{$If defined(l3Items_IsProto)}
function _l3TypedListPrim_.Clone: Pointer;
//#UC START# *4DD3D80A01FD_47A74A5F0123_var*
type
 R_l3TypedListPrim_ = class of _l3TypedListPrim_;
//#UC END# *4DD3D80A01FD_47A74A5F0123_var*
begin
//#UC START# *4DD3D80A01FD_47A74A5F0123_impl*
 Result := R_l3TypedListPrim_(ClassType).Create;
 _l3TypedListPrim_(Result).JoinWith(Self);
//#UC END# *4DD3D80A01FD_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Clone
{$IfEnd} //l3Items_IsProto

{$If defined(l3Items_IsProto)}
procedure _l3TypedListPrim_.Assign(anOther: _l3TypedListPrim_);
//#UC START# *4DD3E9CC0301_47A74A5F0123_var*
//#UC END# *4DD3E9CC0301_47A74A5F0123_var*
begin
//#UC START# *4DD3E9CC0301_47A74A5F0123_impl*
 {$If not defined(l3Items_NoSort)}
 if (Duplicates <> l3_dupAssign) then
 {$IfEnd} 
  Clear;
 JoinWith(anOther);
//#UC END# *4DD3E9CC0301_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Assign
{$IfEnd} //l3Items_IsProto

function _l3TypedListPrim_.pm_GetLast: _ItemType_;
//#UC START# *47AAC9AF02F5_47A74A5F0123get_var*
//#UC END# *47AAC9AF02F5_47A74A5F0123get_var*
begin
//#UC START# *47AAC9AF02F5_47A74A5F0123get_impl*
 Result := GetItem(Hi);
//#UC END# *47AAC9AF02F5_47A74A5F0123get_impl*
end;//_l3TypedListPrim_.pm_GetLast

procedure _l3TypedListPrim_.pm_SetLast(const aValue: _ItemType_);
//#UC START# *47AAC9AF02F5_47A74A5F0123set_var*
//#UC END# *47AAC9AF02F5_47A74A5F0123set_var*
begin
//#UC START# *47AAC9AF02F5_47A74A5F0123set_impl*
 DoSetItem(Hi, aValue);
//#UC END# *47AAC9AF02F5_47A74A5F0123set_impl*
end;//_l3TypedListPrim_.pm_SetLast

function _l3TypedListPrim_.pm_GetFirst: _ItemType_;
//#UC START# *47AB36DA024C_47A74A5F0123get_var*
//#UC END# *47AB36DA024C_47A74A5F0123get_var*
begin
//#UC START# *47AB36DA024C_47A74A5F0123get_impl*
 Result := GetItem(0);
//#UC END# *47AB36DA024C_47A74A5F0123get_impl*
end;//_l3TypedListPrim_.pm_GetFirst

procedure _l3TypedListPrim_.Insert(anIndex: Integer;
  const anItem: _ItemType_);
//#UC START# *47A74F2F017B_47A74A5F0123_var*
//#UC END# *47A74F2F017B_47A74A5F0123_var*
begin
//#UC START# *47A74F2F017B_47A74A5F0123_impl*
 DoInsert(anIndex, anItem);
//#UC END# *47A74F2F017B_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Insert

function _l3TypedListPrim_.IndexOf(const anItem: _ItemType_): Integer;
//#UC START# *47A74F62037A_47A74A5F0123_var*

 function FindItem(P: PItemType; Index: Integer): Boolean;
 begin//FindItem
  {$IfDef l3Items_IsAtomic}
  if (P^ = anItem) then
  {$Else  l3Items_IsAtomic}
  if IsSameItems(P^, anItem) then
  {$EndIf l3Items_IsAtomic}
  begin
   IndexOf := Index;
   Result := false;
  end//P^ = Item
  else
   Result := true;
 end;//FindItem

//#UC END# *47A74F62037A_47A74A5F0123_var*
begin
//#UC START# *47A74F62037A_47A74A5F0123_impl*
 Result := -1;
 IterateAllF(l3L2IA(@FindItem));
//#UC END# *47A74F62037A_47A74A5F0123_impl*
end;//_l3TypedListPrim_.IndexOf

function _l3TypedListPrim_.Remove(const anItem: _ItemType_): Integer;
//#UC START# *47A74F810201_47A74A5F0123_var*
//#UC END# *47A74F810201_47A74A5F0123_var*
begin
//#UC START# *47A74F810201_47A74A5F0123_impl*
 if Empty then
  Result := -1
 else
 begin
(*  if UseFind then
  begin
   if Find(Item2CompareData(Item), Result, SortIndex) then
    DoDelete(Result)
   else
    Result := -1;
  end//UseFind
  else*)
  begin
   Result := IndexOf(anItem);
   if (Result >= 0) then
   begin
    {$IfDef l3Items_IsAtomic}
    Assert(ItemSlot(Result)^ = anItem);
    {$Else  l3Items_IsAtomic}
    {$If (SizeOf(_ItemType_) <= 4) AND not Defined(l3Items_Uncomparable)}
    Assert((ItemSlot(Result)^ = anItem) OR IsSameItems(ItemSlot(Result)^, anItem));
    {$IfEnd}
    {$EndIf l3Items_IsAtomic}
    DoDelete(Result);
   end;//Result >= 0
  end;//UseFind
 end;//Empty
//#UC END# *47A74F810201_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Remove

function _l3TypedListPrim_.Add(const anItem: _ItemType_): Integer;
//#UC START# *47A750E70096_47A74A5F0123_var*
//#UC END# *47A750E70096_47A74A5F0123_var*
begin
//#UC START# *47A750E70096_47A74A5F0123_impl*
 Result := DoAdd(anItem);
//#UC END# *47A750E70096_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Add

procedure _l3TypedListPrim_.Move(CurIndex: Integer;
  NewIndex: Integer);
//#UC START# *47AC544B01F8_47A74A5F0123_var*
{$IfNDef l3Items_IsAtomic}
{$If SizeOf(_ItemType_) > 4}
var
 l_Tmp : array [0..cItemSize - 1] of byte;
{$Else}
var
 l_Tmp : PPointer;
{$IfEnd}
{$Else   l3Items_IsAtomic}
var
 l_Tmp : _ItemType_;
{$EndIf l3Items_IsAtomic}
//#UC END# *47AC544B01F8_47A74A5F0123_var*
begin
//#UC START# *47AC544B01F8_47A74A5F0123_impl*
 CheckIndex(NewIndex);
 if (NewIndex <> CurIndex) then
 begin
  CheckIndex(CurIndex);
  {$IfNDef l3Items_NoChanging}
  Changing;
  try
  {$EndIf  l3Items_NoChanging}
   {$IfNDef l3Items_IsAtomic}
   {$If SizeOf(_ItemType_) > 4}
   Assert(SizeOf(l_Tmp) = cItemSize);
   // - для записей и прочих больших структур, тут должно упасть, тогда будем разбираться отдельно
   //   УЖЕ - НЕ ДОЛЖНО
   l3Move(ItemSlot(CurIndex)^, l_Tmp, cItemSize);
   {$Else}
   Assert(SizeOf(l_Tmp^) = cItemSize);
   l_Tmp := PPointer(ItemSlot(CurIndex))^;
   {$IfEnd}
   if (NewIndex < CurIndex) then
    MoveItems(NewIndex + 1, NewIndex + 0, CurIndex-NewIndex, Self)
   else
   if (CurIndex < NewIndex) then
    MoveItems(CurIndex + 0, CurIndex + 1, NewIndex-CurIndex, Self);
   {$If SizeOf(_ItemType_) > 4}
   l3Move(l_Tmp, ItemSlot(NewIndex)^, cItemSize);
   {$Else}
   PPointer(ItemSlot(NewIndex))^ := l_Tmp;
   {$IfEnd}
   // надо подумать о том, не сделать ли здесь FillItem, или вообще - без типизации
   // короче - надо аккуратно с граничными элементами, особенно если они с автоматическим
   // подсчётом ссылок (интерфейсы, строки, сложные записи)
   {$Else   l3Items_IsAtomic}
   l_Tmp := ItemSlot(CurIndex)^;
   if (NewIndex < CurIndex) then
    MoveItems(NewIndex + 1, NewIndex + 0, CurIndex-NewIndex, Self)
   else
   if (CurIndex < NewIndex) then
    MoveItems(CurIndex + 0, CurIndex + 1, NewIndex-CurIndex, Self);
   ItemSlot(NewIndex)^ := l_Tmp;
   {$EndIf  l3Items_IsAtomic}
  {$IfNDef l3Items_NoChanging}
  finally
   Changed;
  end;//try..finally
  {$EndIf  l3Items_NoChanging}
 end;
//#UC END# *47AC544B01F8_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Move

function _l3TypedListPrim_.IterateBackF(aHi: Tl3Index;
  aLo: Tl3Index;
  anAction: Tl3IteratorAction): Integer;
//#UC START# *47ACAC9C0153_47A74A5F0123_var*
//#UC END# *47ACAC9C0153_47A74A5F0123_var*
begin
//#UC START# *47ACAC9C0153_47A74A5F0123_impl*
 try
  Result := IterateBack(aHi, aLo, anAction);
 finally
  l3FreeIA(anAction);
 end;{try..finally}
//#UC END# *47ACAC9C0153_47A74A5F0123_impl*
end;//_l3TypedListPrim_.IterateBackF

function _l3TypedListPrim_.IterateBack(aHi: Tl3Index;
  aLo: Tl3Index;
  anAction: Tl3IteratorAction): Integer;
//#UC START# *47ACB5C200C5_47A74A5F0123_var*
var
 i, j, k : Integer;
 l_List  : Pointer;
//#UC END# *47ACB5C200C5_47A74A5F0123_var*
begin
//#UC START# *47ACB5C200C5_47A74A5F0123_impl*
 Result := -1;
 if {not Empty}
    (Count > 0)
    // http://mdp.garant.ru/pages/viewpage.action?pageId=290950474
    // т.к. смотрим на _k2HashTag_.GetEmpty и удивляемся
    AND (aHi >= aLo) then
 begin
  l_List := f_Data.AsPointer;
  j := Min(aHi, Hi);
  k := Max(aLo, Lo);
  for i := j downto k do
  begin
   Result := i;
   if not anAction(PAnsiChar(l_List) + i * cItemSize, i) then break;
  end;//for i := j
 end;//not Empty
//#UC END# *47ACB5C200C5_47A74A5F0123_impl*
end;//_l3TypedListPrim_.IterateBack

{$If not defined(l3Items_IsProto)}
procedure _l3TypedListPrim_.Assign(Source: TPersistent);
//#UC START# *47B09CD5029B_47A74A5F0123_var*
//#UC END# *47B09CD5029B_47A74A5F0123_var*
begin
//#UC START# *47B09CD5029B_47A74A5F0123_impl*
 if (Source Is _l3TypedListPrim_) then
 begin
  {$If not defined(l3Items_NoSort)}
  if (Duplicates <> l3_dupAssign) then
  {$IfEnd} 
   Clear;
  JoinWith(_l3TypedListPrim_(Source));
 end//Source Is _l3TypedListPrim_
 else
  inherited;
//#UC END# *47B09CD5029B_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Assign
{$IfEnd} //not l3Items_IsProto

function _l3TypedListPrim_.JoinWith(aList: _l3TypedListPrim_): Integer;
//#UC START# *47B09DF302A7_47A74A5F0123_var*
var
 i   : Integer;
 l_C : Integer;
//#UC END# *47B09DF302A7_47A74A5F0123_var*
begin
//#UC START# *47B09DF302A7_47A74A5F0123_impl*
 l_C := aList.f_Count;
 if (l_C > 0) then
 begin
  Result := f_Count;
  Capacity := Result + l_C;
  for i := 0 to Pred(l_C) do
   Add(aList.ItemSlot(i)^);
 end//l_C > 0
 else
  Result := -1;
//#UC END# *47B09DF302A7_47A74A5F0123_impl*
end;//_l3TypedListPrim_.JoinWith

function _l3TypedListPrim_.Iterate(aLo: Tl3Index;
  aHi: Tl3Index;
  Action: Tl3IteratorAction): Integer;
//#UC START# *47B1BD39008B_47A74A5F0123_var*
var
 i, k      : Integer;
 {$If SizeOf(_ItemType_) > 4}
 {$Else}
 l_TmpItem : Pointer;
 l_OldItem : Pointer;
 {$IfEnd}
 l_List    : Pointer;
 l_Count   : Integer;
//#UC END# *47B1BD39008B_47A74A5F0123_var*
begin
//#UC START# *47B1BD39008B_47A74A5F0123_impl*
 Result := -1;
 l_List := f_Data.AsPointer;
 if (l_List <> nil) then
 begin
  l_Count := f_Count;
  k := Min(Pred(l_Count), aHi);
  i := Max(0, aLo);
  try
   while (i <= k) do
   begin
    Result := i;
    {$If SizeOf(_ItemType_) > 4}
    if Action(PItemType(PAnsiChar(l_List) + i * cItemSize), i) then
    begin
     if (l_Count <> f_Count) then
     begin
      l_List := f_Data.AsPointer;
      if (l_Count > f_Count) then
      begin
       // - удалили текущий элемент
       l_Count := f_Count;
       // - корректируем запоменное число элементов
       k := Pred(l_Count);
       // - корректируем условие цикла
       continue;
       // - увеличивать индекс не надо
      end;//l_Count > f_Count
     end;//l_Count <> f_Count
    end//Action..
    else
     break;
    {$Else}
    l_TmpItem := PPointer(PAnsiChar(l_List) + i * cItemSize)^;
    l_OldItem := l_TmpItem;
    if Action(@l_TmpItem, i) then
    begin
     if (l_Count <> f_Count) then
     begin
      l_List := f_Data.AsPointer;
      if (l_Count > f_Count) then
      begin
       // - удалили текущий элемент
       l_Count := f_Count;
       // - корректируем запоменное число элементов
       k := Min(Pred(l_Count), aHi);
       // - корректируем условие цикла
       continue;
       // - увеличивать индекс не надо
      end;//l_Count > f_Count
     end;//l_Count <> f_Count
     if (l_TmpItem <> l_OldItem) then
      PPointer(PAnsiChar(l_List) + i * cItemSize)^ := l_TmpItem;
    end//Action..
    else
     break;
    {$IfEnd}
    Inc(i);
   end;//while (i <= k)
  except
   on EListError do;
   // - негоже итератору поднимать ошибку о неверном индексе
  end//try..except
 end;{l_List <> nil}
//#UC END# *47B1BD39008B_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Iterate

function _l3TypedListPrim_.IterateAll(Action: Tl3IteratorAction): Integer;
//#UC START# *47B1BDA202C3_47A74A5F0123_var*
var
 i, k      : Integer;
 {$If SizeOf(_ItemType_) > 4}
 {$Else}
 l_TmpItem : Pointer;
 l_OldItem : Pointer;
 {$IfEnd}
 l_List    : Pointer;
 l_Count   : Integer;
//#UC END# *47B1BDA202C3_47A74A5F0123_var*
begin
//#UC START# *47B1BDA202C3_47A74A5F0123_impl*
 Result := -1;
 l_List := f_Data.AsPointer;
 if (l_List <> nil) then
 begin
  l_Count := f_Count;
  k := Pred(l_Count);
  i := 0;
  try
   while (i <= k) do
   begin
    Result := i;
    {$If SizeOf(_ItemType_) > 4}
    if Action(PItemType(PAnsiChar(l_List) + i * cItemSize), i) then
    begin
     if (l_Count <> f_Count) then
     begin
      l_List := f_Data.AsPointer;
      if (l_Count > f_Count) then
      begin
       // - удалили текущий элемент
       l_Count := f_Count;
       // - корректируем запоменное число элементов
       k := Pred(l_Count);
       // - корректируем условие цикла
       continue;
       // - увеличивать индекс не надо
      end;//l_Count > f_Count
     end;//l_Count <> f_Count
    end//Action..
    else
     break;
    {$Else}
    l_TmpItem := PPointer(PAnsiChar(l_List) + i * cItemSize)^;
    l_OldItem := l_TmpItem;
    if Action(@l_TmpItem, i) then
    begin
     if (l_Count <> f_Count) then
     begin
      l_List := f_Data.AsPointer;
      if (l_Count > f_Count) then
      begin
       // - удалили текущий элемент
       l_Count := f_Count;
       // - корректируем запоменное число элементов
       k := Pred(l_Count);
       // - корректируем условие цикла
       continue;
       // - увеличивать индекс не надо
      end;//l_Count > f_Count
     end;//l_Count <> f_Count
     if (l_TmpItem <> l_OldItem) then
      PPointer(PAnsiChar(l_List) + i * cItemSize)^ := l_TmpItem;
    end//Action..
    else
     break;
    {$IfEnd}
    Inc(i);
   end;//while (i <= k)
  except
   on EListError do;
   // - негоже итератору поднимать ошибку о неверном индексе
  end//try..except
 end;//l_List <> nil
//#UC END# *47B1BDA202C3_47A74A5F0123_impl*
end;//_l3TypedListPrim_.IterateAll

procedure _l3TypedListPrim_.Clear;
//#UC START# *47B1C16D0188_47A74A5F0123_var*

 {$IfNDef l3Items_IsUnrefcounted}
 function _FreeSlot(P: PItemType; Index: Integer): Bool;
 begin
  FreeSlot(P^);
  Result := true;
 end;
 {$EndIf  l3Items_IsUnrefcounted}

{$IfDef l3Items_IsUnrefcounted}
var
 l_List : Pointer;
{$EndIf l3Items_IsUnrefcounted} 
//#UC END# *47B1C16D0188_47A74A5F0123_var*
begin
//#UC START# *47B1C16D0188_47A74A5F0123_impl*
 {$IfNDef l3Items_NoChanging}
 Changing;
 try
 {$EndIf  l3Items_NoChanging}
  {$IfDef l3Items_IsUnrefcounted}
  if (f_Count > 0) then
  begin
   l_List := f_Data.AsPointer;
   if (l_List <> nil) then
    l3FillChar(l_List^, f_Count * cItemSize);
  end;//f_Count > 0
  {$Else  l3Items_IsUnrefcounted}
  IterateAllF(l3L2IA(@_FreeSlot));
  {$EndIf l3Items_IsUnrefcounted}
  //SetListSize(0);
  f_Count := 0;
 {$IfNDef l3Items_NoChanging}
 finally
  Changed;
 end;//try..finally
 {$EndIf  l3Items_NoChanging}
//#UC END# *47B1C16D0188_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Clear

function _l3TypedListPrim_.GetItem(Index: Integer): _ItemType_;
//#UC START# *47B1CCC901BE_47A74A5F0123_var*
//#UC END# *47B1CCC901BE_47A74A5F0123_var*
begin
//#UC START# *47B1CCC901BE_47A74A5F0123_impl*
 CheckIndex(Index);
 Result := ItemSlot(Index)^;
//#UC END# *47B1CCC901BE_47A74A5F0123_impl*
end;//_l3TypedListPrim_.GetItem

function _l3TypedListPrim_.DoAdd(const aData: _ItemType_): Integer; // can raise El3DuplicateItem
//#UC START# *47B1D68E0219_47A74A5F0123_var*

 {$If not defined(l3Items_NoSort)}
 procedure SayDup(anIndex: Integer);
 begin
  raise El3DuplicateItem.Create(Format('Duplicate Item №%d in %s', [anIndex, ClassName]));
 end;
 {$IfEnd}

//#UC END# *47B1D68E0219_47A74A5F0123_var*
begin
//#UC START# *47B1D68E0219_47A74A5F0123_impl*
 {$If not defined(l3Items_NoSort)}
 if (SortIndex <> l3_siUnsorted) then
 begin
  {$IfNDef l3Items_NeedsAssignItem}
  Assert(Duplicates <> l3_dupAssign, 'l3_dupAssign не поддерживается в списке ' + ClassName);
  {$EndIf  l3Items_NeedsAssignItem}
  if (f_Count > 0) then
  begin
   if DoFindInsertionPlace(aData, Result) then
   begin
    case Duplicates of
     l3_dupIgnore :
      Result := -1;
     l3_dupAccept :
      DirectInsert(Succ(Result), aData);
     l3_dupError  :
      SayDup(Result);
     l3_dupAssign :
      {$IfDef l3Items_NeedsAssignItem}
      AssignItem(PItemType(ItemSlot(Result))^, aData);
      {$Else  l3Items_NeedsAssignItem}
      raise EListError.Create('l3_dupAssign не поддерживается в списке ' + ClassName);
      {$EndIf l3Items_NeedsAssignItem}
     l3_dupChange :
      DoSetItem(Result, aData);
    end;//case Duplicates
   end//DoFindInsertionPlace
   else
    DirectInsert(Result, aData);
  end//f_Count > 0
  else
  begin
   Result := 0;
   DirectInsert(Result, aData);
  end;//f_Count > 0
 end//SortIndex <> l3_siUnsorted
 else
 {$IfEnd}
 begin
  Result := f_Count;
  DirectInsert(Result, aData);
 end;//SortIndex <> l3_siUnsorted
//#UC END# *47B1D68E0219_47A74A5F0123_impl*
end;//_l3TypedListPrim_.DoAdd

procedure _l3TypedListPrim_.DoInsert(anIndex: Integer;
  const aData: _ItemType_); // can raise EListError
//#UC START# *47B1DB3C01D6_47A74A5F0123_var*

 procedure _Error;
 begin
  raise EListError.CreateFmt(SListIndexError, [anIndex]);
 end;

//#UC END# *47B1DB3C01D6_47A74A5F0123_var*
begin
//#UC START# *47B1DB3C01D6_47A74A5F0123_impl*
 if (anIndex < 0) or (anIndex > f_Count) then
  _Error;
 DirectInsert(anIndex, aData) 
//#UC END# *47B1DB3C01D6_47A74A5F0123_impl*
end;//_l3TypedListPrim_.DoInsert

procedure _l3TypedListPrim_.DoSetItem(anIndex: Integer;
  const anItem: _ItemType_);
//#UC START# *47B2CC7E01F6_47A74A5F0123_var*
{$IfNDef l3Items_IsAtomic}
var
 l_P : PItemType;
{$EndIf  l3Items_IsAtomic}
//#UC END# *47B2CC7E01F6_47A74A5F0123_var*
begin
//#UC START# *47B2CC7E01F6_47A74A5F0123_impl*
 CheckSetItem(anIndex);
 {$IfDef l3Items_IsAtomic}
 PItemType(ItemSlot(anIndex))^ := anItem;
 {$Else  l3Items_IsAtomic}
 l_P := PItemType(ItemSlot(anIndex));
 if not IsSameItems(l_P^, anItem) then
 begin
  FreeSlot(l_P^);
  FillSlot(l_P^, anItem);
 end;//not IsSameItems(l_P^, anItem)
 {$EndIf l3Items_IsAtomic}
//#UC END# *47B2CC7E01F6_47A74A5F0123_impl*
end;//_l3TypedListPrim_.DoSetItem

procedure _l3TypedListPrim_.DeleteLast;
//#UC START# *47B49C9600E9_47A74A5F0123_var*
var
 l_P  : PItemType;
//#UC END# *47B49C9600E9_47A74A5F0123_var*
begin
//#UC START# *47B49C9600E9_47A74A5F0123_impl*
 if (f_Count > 0) then
 begin
  {$IfNDef l3Items_NoChanging}
  Changing;
  try
  {$EndIf  l3Items_NoChanging}
   l_P := ItemSlot(Pred(f_Count));
   Dec(f_Count);
   FreeSlot(l_P^);
  {$IfNDef l3Items_NoChanging}
  finally
   Changed;
  end;//try..finally
  {$EndIf  l3Items_NoChanging}
 end;//f_Count > 0
//#UC END# *47B49C9600E9_47A74A5F0123_impl*
end;//_l3TypedListPrim_.DeleteLast

constructor _l3TypedListPrim_.Create;
//#UC START# *47B9866E034D_47A74A5F0123_var*
//#UC END# *47B9866E034D_47A74A5F0123_var*
begin
//#UC START# *47B9866E034D_47A74A5F0123_impl*
 {$IfDef l3Items_NoOwner}
 inherited Create;
 {$Else  l3Items_NoOwner}
 inherited Create;
 {$EndIf  l3Items_NoOwner}
 {$If not defined(l3Items_NoSort)}
 {$IfDef l3Items_HasCustomSort}
 f_SortIndex := l3_siUnsorted;
 {$Else  l3Items_HasCustomSort}
 f_Sorted := false;
 {$EndIf l3Items_HasCustomSort}
 {$IfEnd}
//#UC END# *47B9866E034D_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Create

{$If not defined(l3Items_IsProto)}
function _l3TypedListPrim_.Clone: Pointer;
//#UC START# *47BAC7A50039_47A74A5F0123_var*
type
 R_l3TypedListPrim_ = class of _l3TypedListPrim_;
//#UC END# *47BAC7A50039_47A74A5F0123_var*
begin
//#UC START# *47BAC7A50039_47A74A5F0123_impl*
 Result := R_l3TypedListPrim_(ClassType).Create;
 _l3TypedListPrim_(Result).Assign(Self);
//#UC END# *47BAC7A50039_47A74A5F0123_impl*
end;//_l3TypedListPrim_.Clone
{$IfEnd} //not l3Items_IsProto

procedure _l3TypedListPrim_.pm_SetCount(aValue: Integer);
//#UC START# *47BEE088001A_47A74A5F0123set_var*

 procedure SayBadCount(aNewCount: LongInt);
 begin
  raise EListError.CreateFmt(sListIndexError, [aNewCount]);
 end;

var
 l_Ptr   : PItemType;
 {$IfNDef l3Items_IsUnrefcounted}
 l_Index : Integer;
 {$EndIf  l3Items_IsUnrefcounted}
//#UC END# *47BEE088001A_47A74A5F0123set_var*
begin
//#UC START# *47BEE088001A_47A74A5F0123set_impl*
 if (aValue < 0) then
  SayBadCount(aValue);
 if (aValue < f_Count) then
 begin
  l_Ptr := ItemSlot(aValue);
  {$IfDef l3Items_IsUnrefcounted}
  l3FillChar(l_Ptr^, (Hi - aValue) * cItemSize);
  {$Else  l3Items_IsUnrefcounted}
  for l_Index := aValue to Hi do
  begin
   FreeSlot(l_Ptr^);
   Inc(PAnsiChar(l_Ptr), cItemSize);
  end;//for i
  {$EndIf  l3Items_IsUnrefcounted}
 end//aValue < f_Count
 else
 if (aValue > GetCapacity(Self)) then
  ReAllocList(ExpandSize(aValue), Self);
 if (f_Count < aValue) then
  l3ZeroMemory(ItemSlot(f_Count), (aValue - f_Count) * cItemSize);
 f_Count := aValue;
//#UC END# *47BEE088001A_47A74A5F0123set_impl*
end;//_l3TypedListPrim_.pm_SetCount

function _l3TypedListPrim_.DoGetSortIndex: Tl3SortIndex;
//#UC START# *47B9841B03AD_47A74A5F0123_var*
//#UC END# *47B9841B03AD_47A74A5F0123_var*
begin
//#UC START# *47B9841B03AD_47A74A5F0123_impl*
 {$If not defined(l3Items_NoSort)}
 {$IfDef l3Items_HasCustomSort}
 Result := f_SortIndex;
 {$Else l3Items_HasCustomSort}
 if f_Sorted then
  {$IfDef l3Items_CaseUnsensitive}
  Result := l3_siCaseUnsensitive
  {$Else  l3Items_CaseUnsensitive}
  Result := l3_siNative
  {$EndIf l3Items_CaseUnsensitive}
 else
  Result := l3_siUnsorted; 
 {$EndIf l3Items_HasCustomSort}
 {$Else}
 Result := l3_siUnsorted;
 {$IfEnd}
//#UC END# *47B9841B03AD_47A74A5F0123_impl*
end;//_l3TypedListPrim_.DoGetSortIndex

procedure _l3TypedListPrim_.DoSetSortIndex(Value: Tl3SortIndex);
//#UC START# *47B9843903DB_47A74A5F0123_var*
//#UC END# *47B9843903DB_47A74A5F0123_var*
begin
//#UC START# *47B9843903DB_47A74A5F0123_impl*
 {$If not defined(l3Items_NoSort)}
 {$IfDef l3Items_HasCustomSort}
 f_SortIndex := Value;
 {$Else  l3Items_HasCustomSort}
 Case Value of
  l3_siUnsorted:
   f_Sorted := false;
  l3_siNative:
   f_Sorted := true;
  else
   Assert(false); 
 end;//Case Value
 {$EndIf l3Items_HasCustomSort}
 {$Else}
 Assert(Value = l3_siUnsorted);
 {$IfEnd}
//#UC END# *47B9843903DB_47A74A5F0123_impl*
end;//_l3TypedListPrim_.DoSetSortIndex

{$EndIf l3TypedListPrim_imp}
