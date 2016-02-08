{$IfNDef l3OtherListView_imp}
 
{$Define l3OtherListView_imp}
 PItemType = ^_ItemType_;

 _l3OtherListView_ = {mixin} class(Tl3CustomOtherListView)
 private
 // private fields
   f_List : _ListType_;
 protected
 // property methods
   function pm_GetCount: Integer;
   {$If not defined(l3ViewListIsTag)}
   function pm_GetItemSlot(anIndex: Integer): PItemType;
   {$IfEnd} //not l3ViewListIsTag
 protected
 // realized methods
   function CompareItems(anIndex1: Integer;
     anIndex2: Integer): Integer; override;
   function OtherListCount: Integer; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected methods
   function CompareData(const anItem1: _ItemType_;
     const anItem2: _ItemType_): Integer; virtual; abstract;
 public
 // public methods
   constructor Create(const aList: _ListType_); reintroduce;
   function Add(const anItem: _ItemType_): Integer;
 public
 // public properties
   property Count: Integer
     read pm_GetCount;
   {$If not defined(l3ViewListIsTag)}
   property ItemSlot[anIndex: Integer]: PItemType
     read pm_GetItemSlot;
   {$IfEnd} //not l3ViewListIsTag
 end;//_l3OtherListView_

{$Else l3OtherListView_imp}

// start class _l3OtherListView_

constructor _l3OtherListView_.Create(const aList: _ListType_);
//#UC START# *4DEFB2B600B5_4DEFB2450043_var*
//#UC END# *4DEFB2B600B5_4DEFB2450043_var*
begin
//#UC START# *4DEFB2B600B5_4DEFB2450043_impl*
 aList.SetRefTo(f_List);
 inherited Create;
//#UC END# *4DEFB2B600B5_4DEFB2450043_impl*
end;//_l3OtherListView_.Create

function _l3OtherListView_.Add(const anItem: _ItemType_): Integer;
//#UC START# *4DEFD51502B7_4DEFB2450043_var*
{$IfDef l3ViewListIsTag}
var
 l_Item : _ItemType_;
{$EndIf l3ViewListIsTag}
//#UC END# *4DEFD51502B7_4DEFB2450043_var*
begin
//#UC START# *4DEFD51502B7_4DEFB2450043_impl*
 {$IfDef l3ViewListIsTag}
 l_Item := anItem;
 Result := f_Sorter.Add(f_List.AddChild(l_Item.AsObject));
 {$Else  l3ViewListIsTag}
 Result := f_Sorter.Add(f_List.Add(anItem));
 {$EndIf l3ViewListIsTag}
//#UC END# *4DEFD51502B7_4DEFB2450043_impl*
end;//_l3OtherListView_.Add

function _l3OtherListView_.pm_GetCount: Integer;
//#UC START# *4DEFBD670196_4DEFB2450043get_var*
//#UC END# *4DEFBD670196_4DEFB2450043get_var*
begin
//#UC START# *4DEFBD670196_4DEFB2450043get_impl*
 Result := f_Sorter.Count;
//#UC END# *4DEFBD670196_4DEFB2450043get_impl*
end;//_l3OtherListView_.pm_GetCount

{$If not defined(l3ViewListIsTag)}
function _l3OtherListView_.pm_GetItemSlot(anIndex: Integer): PItemType;
//#UC START# *4DEFC1D101A9_4DEFB2450043get_var*
//#UC END# *4DEFC1D101A9_4DEFB2450043get_var*
begin
//#UC START# *4DEFC1D101A9_4DEFB2450043get_impl*
 Result := Pointer(f_List.ItemSlot(f_Sorter[anIndex]));
//#UC END# *4DEFC1D101A9_4DEFB2450043get_impl*
end;//_l3OtherListView_.pm_GetItemSlot
{$IfEnd} //not l3ViewListIsTag

function _l3OtherListView_.CompareItems(anIndex1: Integer;
  anIndex2: Integer): Integer;
//#UC START# *4DEFAFF80100_4DEFB2450043_var*
//#UC END# *4DEFAFF80100_4DEFB2450043_var*
begin
//#UC START# *4DEFAFF80100_4DEFB2450043_impl*
 {$IfDef l3ViewListIsTag}
 Result := CompareData(f_List.Child[anIndex1], f_List.Child[anIndex2]);
 {$Else  l3ViewListIsTag}
 Result := CompareData(f_List.ItemSlot(anIndex1)^, f_List.ItemSlot(anIndex2)^);
 {$EndIf l3ViewListIsTag}
//#UC END# *4DEFAFF80100_4DEFB2450043_impl*
end;//_l3OtherListView_.CompareItems

function _l3OtherListView_.OtherListCount: Integer;
//#UC START# *4DEFB991020F_4DEFB2450043_var*
//#UC END# *4DEFB991020F_4DEFB2450043_var*
begin
//#UC START# *4DEFB991020F_4DEFB2450043_impl*
 {$IfDef l3ViewListIsTag}
 Result := f_List.ChildrenCount;
 {$Else  l3ViewListIsTag}
 Result := f_List.Count;
 {$EndIf l3ViewListIsTag}
//#UC END# *4DEFB991020F_4DEFB2450043_impl*
end;//_l3OtherListView_.OtherListCount

procedure _l3OtherListView_.Cleanup;
//#UC START# *479731C50290_4DEFB2450043_var*
//#UC END# *479731C50290_4DEFB2450043_var*
begin
//#UC START# *479731C50290_4DEFB2450043_impl*
 FreeAndNil(f_List);
 inherited;
//#UC END# *479731C50290_4DEFB2450043_impl*
end;//_l3OtherListView_.Cleanup

{$EndIf l3OtherListView_imp}
