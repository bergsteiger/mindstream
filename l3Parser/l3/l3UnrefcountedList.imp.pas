{$IfNDef l3UnrefcountedList_imp}
 
{$Define l3UnrefcountedList_imp}
//#UC START# *47B992F60244ci*
 {$Define l3Items_IsUnrefcounted}
//#UC END# *47B992F60244ci*
 _l3StandardTypedList_Parent_ = _l3UnrefcountedList_Parent_;
 {$Include ..\L3\l3StandardTypedList.imp.pas}
 _l3UnrefcountedList_ = {abstract mixin} class(_l3StandardTypedList_)
  {* Список элементов, которые не имеют понятия о подсчете ссылок }
//#UC START# *47B992F60244publ*
//#UC END# *47B992F60244publ*
 end;//_l3UnrefcountedList_

{$Else l3UnrefcountedList_imp}

// start class _l3UnrefcountedList_

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


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

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_47B992F60244_var*
//#UC END# *47B07CF403D0_47B992F60244_var*
begin
//#UC START# *47B07CF403D0_47B992F60244_impl*
 Result := (A = B);
//#UC END# *47B07CF403D0_47B992F60244_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47B992F60244_var*
//#UC END# *47B2C42A0163_47B992F60244_var*
begin
//#UC START# *47B2C42A0163_47B992F60244_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47B992F60244_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

procedure FillItem(var aPlace: _ItemType_;
  const anItem: _ItemType_
  {$If defined(l3Items_FillItem_NeedsList)}
  ;
  anItems: _l3Items_
  {$IfEnd} //l3Items_FillItem_NeedsList
  );
//#UC START# *47B935AF0066_47B992F60244_var*
//#UC END# *47B935AF0066_47B992F60244_var*
begin
//#UC START# *47B935AF0066_47B992F60244_impl*
 aPlace := anItem;
//#UC END# *47B935AF0066_47B992F60244_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_47B992F60244_var*
//#UC END# *47B94A5C006E_47B992F60244_var*
begin
//#UC START# *47B94A5C006E_47B992F60244_impl*
 // - ничего освобождать не нужно
 {$IfDef l3Items_IsAtomic}
 aPlace := 0;
 {$Else  l3Items_IsAtomic}
 Integer(aPlace) := 0;
 {$EndIf l3Items_IsAtomic}
//#UC END# *47B94A5C006E_47B992F60244_impl*
end;//FreeItem


{$Include ..\L3\l3StandardTypedList.imp.pas}


//#UC START# *47B992F60244impl*
//#UC END# *47B992F60244impl*

{$EndIf l3UnrefcountedList_imp}
