{$IfNDef l3ObjectRefList_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3"
// Модуль: "w:/common/components/rtl/Garant/L3/l3ObjectRefList.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Low Level::L3::l3CoreObjects::l3ObjectRefList
//
// Список ссылок на объекты.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define l3ObjectRefList_imp}
 _l3UncomparabeObjectRefList_Parent_ = _l3ObjectRefList_Parent_;
 {$Include ..\L3\l3UncomparabeObjectRefList.imp.pas}
 _l3ObjectRefList_ = {mixin} class(_l3UncomparabeObjectRefList_)
  {* Список ссылок на объекты. }
 end;//_l3ObjectRefList_

{$Else l3ObjectRefList_imp}

// start class _l3ObjectRefList_

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47B57B9E0050_var*
//#UC END# *47B2C42A0163_47B57B9E0050_var*
begin
//#UC START# *47B2C42A0163_47B57B9E0050_impl*
 //aTo.Assign(aFrom);
 Assert(false);
//#UC END# *47B2C42A0163_47B57B9E0050_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_47B57B9E0050_var*
//#UC END# *47B99D4503A2_47B57B9E0050_var*
begin
//#UC START# *47B99D4503A2_47B57B9E0050_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := CI.rA^.OCompare(CI.rB^);
//#UC END# *47B99D4503A2_47B57B9E0050_impl*
end;//CompareExistingItems


{$Include ..\L3\l3UncomparabeObjectRefList.imp.pas}


{$EndIf l3ObjectRefList_imp}
