{$IfNDef l3ListOperations_imp}
 
{$Define l3ListOperations_imp}
 _l3ListOperations_ = {mixin} class(_l3ListOperations_Parent_)
 public
 // public methods
   function DeleteList(const aList: _ListType_): Boolean;
     {* Удаляет из списка элементы содержащиеся в другом списке (aList) }
   function InsertList(const aList: _ListType_): Boolean;
     {* Добавляет в список элементы другого списка (aList) }
   function IntersectList(const aList: _ListType_): Boolean;
     {* Удаляет из списка Элементы НЕ содержащиеся в другом списке (aList) }
 end;//_l3ListOperations_

{$Else l3ListOperations_imp}

// start class _l3ListOperations_

function _l3ListOperations_.DeleteList(const aList: _ListType_): Boolean;
//#UC START# *47BB2786011C_47BB26AF027F_var*
var
 I : Integer;
 l_Index : Integer;
//#UC END# *47BB2786011C_47BB26AF027F_var*
begin
//#UC START# *47BB2786011C_47BB26AF027F_impl*
 Result := false;
 if (aList = nil) or (aList.Count = 0) then Exit;
 for I := aList.Lo to aList.Hi do
  if FindData(aList[I], l_Index) then
  begin
   Result := true;
   DoDelete(l_Index);
  end;//FindData(aList[I], l_Index)
//#UC END# *47BB2786011C_47BB26AF027F_impl*
end;//_l3ListOperations_.DeleteList

function _l3ListOperations_.InsertList(const aList: _ListType_): Boolean;
//#UC START# *47BB27A101FF_47BB26AF027F_var*
var
 I : Integer;
 l_Index : Integer;
 l_Item  : _ItemType_;
//#UC END# *47BB27A101FF_47BB26AF027F_var*
begin
//#UC START# *47BB27A101FF_47BB26AF027F_impl*
 Result := false;
 if (aList = nil) or (aList.Count = 0) then Exit;
 for I := aList.Lo to aList.Hi do
 begin
  l_Item := aList[I];
  if not FindData(l_Item, l_Index) then
  begin
   Result := true;
   DirectInsert(l_Index, l_Item);
  end;//not FindData(l_Item, l_Index)
 end;//for I
//#UC END# *47BB27A101FF_47BB26AF027F_impl*
end;//_l3ListOperations_.InsertList

function _l3ListOperations_.IntersectList(const aList: _ListType_): Boolean;
//#UC START# *47BB27E802DF_47BB26AF027F_var*
var
 I : Integer;
 l_Index : Integer;
//#UC END# *47BB27E802DF_47BB26AF027F_var*
begin
//#UC START# *47BB27E802DF_47BB26AF027F_impl*
 Result := false;
 if (aList = nil) or (aList.Count = 0) then
 begin
  if not Empty then
   Result := true;
  Clear;
 end//aList = nil
 else
  for I := Hi downto Lo do
   if NOT aList.FindData(Items[I], l_Index) then
   begin
    Result := true; 
    DoDelete(I);
   end;//NOT aList.FindData(Items[I], l_Index)
//#UC END# *47BB27E802DF_47BB26AF027F_impl*
end;//_l3ListOperations_.IntersectList

{$EndIf l3ListOperations_imp}
