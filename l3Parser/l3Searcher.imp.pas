{$IfNDef l3Searcher_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3"
// Модуль: "w:/common/components/rtl/Garant/L3/l3Searcher.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Low Level::L3::Стандартные примеси::l3Searcher
//
// Умеет искать элементы по заданному критерию.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define l3Searcher_imp}
 _l3Searcher_ = {abstract mixin} class(_l3Searcher_Parent_)
  {* Умеет искать элементы по заданному критерию. }
 public
 // public methods
   function FindData(const aFindData: _FindDataType_;
    out theIndex: Integer;
    aSortIndex: Tl3SortIndex = l3_siNative): Boolean; overload; 
     {* Ищет в списке указанные данные. Возвращает true если данные найдены, а в theIndex - индекс найденого элемента, если данные не найдены, то theIndex указывает на предполагаемое место вставки. }
 end;//_l3Searcher_

{$Else l3Searcher_imp}

// start class _l3Searcher_

function _l3Searcher_.FindData(const aFindData: _FindDataType_;
  out theIndex: Integer;
  aSortIndex: Tl3SortIndex = l3_siNative): Boolean;
//#UC START# *47B9CA1001D2_47B47E230134_var*
var
 L, H, i, C: Longint;
 // H обязательно знаковый!!!!! см. H := Pred(i);
//#UC END# *47B9CA1001D2_47B47E230134_var*
begin
//#UC START# *47B9CA1001D2_47B47E230134_impl*
 theIndex := 0;
 Result := false;
 H := Hi;
 if (H < 0) then
  Exit;
 {$If not defined(l3Items_NoSort)}
 if (SortIndex = aSortIndex) AND (SortIndex <> l3_siUnsorted) then
 begin
  L := 0;
  while (L <= H) do
  begin
   i := (L + H) shr 1;
   C := CompareItemWithData(_Instance_R_(Self).ItemSlot(i)^, aFindData, aSortIndex, Self);
   if (C < 0) then
    L := Succ(i)
   else
   begin
    if (C = 0) then
    begin
     Result := true;
     theIndex := i;
     H := Pred(i);

    end//C = 0
    else
     H := Pred(i);

   end;//C < 0
  end;//while (L..
  if not Result then
   theIndex := L;
 end//SortIndex = aCompareIndex
 else
 {$IfEnd}
 begin
  for i := 0 to H do
  begin
   C := CompareItemWithData(_Instance_R_(Self).ItemSlot(i)^, aFindData, aSortIndex, Self);
   if (C >= 0) then
   begin
    theIndex := i;
    Result := (C = 0);
    if Result then break;
   end;//C >= 0
  end;//for i
 end;//SortIndex = aCompareIndex
//#UC END# *47B9CA1001D2_47B47E230134_impl*
end;//_l3Searcher_.FindData

{$EndIf l3Searcher_imp}
