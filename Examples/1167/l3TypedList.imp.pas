{$IfNDef l3TypedList_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3"
// Модуль: "w:/common/components/rtl/Garant/L3/l3TypedList.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Low Level::L3::l3CoreObjects::l3TypedList
//
// Список с возможностью переопределения методов манипуляции с элементами
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define l3TypedList_imp}
 _l3TypedListPrim_Parent_ = _l3TypedList_Parent_;
 {$Include ..\L3\l3TypedListPrim.imp.pas}
 _l3TypedList_ = {abstract mixin} class(_l3TypedListPrim_)
  {* Список с возможностью переопределения методов манипуляции с элементами }
 protected
 // property methods
   function pm_GetItems(anIndex: Integer): _ItemType_;
   procedure pm_SetItems(anIndex: Integer; const aValue: _ItemType_);
 public
 // public properties
   property Items[anIndex: Integer]: _ItemType_
     read pm_GetItems
     write pm_SetItems;
     default;
     {* Элементы списка. }
 end;//_l3TypedList_

{$Else l3TypedList_imp}

// start class _l3TypedList_

procedure MoveItems(Dst: Integer;
  Src: Integer;
  aSize: Cardinal;
  aList: _l3Items_);
//#UC START# *47B48A510176_47B084190028_var*
var
 l_Sz : Integer;
 l_S  : Integer;
 l_D  : Integer;
 l_B  : PAnsiChar;
//#UC END# *47B48A510176_47B084190028_var*
begin
//#UC START# *47B48A510176_47B084190028_impl*
 if (aSize > 0) then
 begin
  l_B := aList.f_Data.AsPointer;
  l_S := Src * cItemSize;
  l_D := Dst * cItemSize;
  l_Sz := aSize * cItemSize;
  if (l_Sz = SizeOf(Integer)) then
  begin
   PLong(l_B + l_D)^ := PLong(l_B + l_S)^;
   Exit;
  end//l_Sz = SizeOf(Integer)
  else
   l3Move((l_B + l_S)^, (l_B + l_D)^, l_Sz);
 end;//aSize > 0
//#UC END# *47B48A510176_47B084190028_impl*
end;//MoveItems


{$Include ..\L3\l3TypedListPrim.imp.pas}

// start class _l3TypedList_

function _l3TypedList_.pm_GetItems(anIndex: Integer): _ItemType_;
//#UC START# *47A1B1C102E9_47B084190028get_var*
//#UC END# *47A1B1C102E9_47B084190028get_var*
begin
//#UC START# *47A1B1C102E9_47B084190028get_impl*
 Result := GetItem(anIndex);
//#UC END# *47A1B1C102E9_47B084190028get_impl*
end;//_l3TypedList_.pm_GetItems

procedure _l3TypedList_.pm_SetItems(anIndex: Integer; const aValue: _ItemType_);
//#UC START# *47A1B1C102E9_47B084190028set_var*
//#UC END# *47A1B1C102E9_47B084190028set_var*
begin
//#UC START# *47A1B1C102E9_47B084190028set_impl*
 DoSetItem(anIndex, aValue);
//#UC END# *47A1B1C102E9_47B084190028set_impl*
end;//_l3TypedList_.pm_SetItems

{$EndIf l3TypedList_imp}
