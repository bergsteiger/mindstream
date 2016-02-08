unit l3CustomSortIntegerList;
 
{$Include l3Define.inc}

interface

uses
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

 {$Define l3Items_CompareItemsRec_NeedsRList}

type
 _ItemType_ = Integer;
 _l3AtomicListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3AtomicListPrim.imp.pas}
 Tl3CustomSortIntegerList = {abstract} class(_l3AtomicListPrim_)
  {* http://mdp.garant.ru/pages/viewpage.action?pageId=269058147 }
 protected
 // overridden protected methods
   procedure InitFields; override;
 protected
 // protected methods
   function CompareItems(A: Integer;
     B: Integer): Integer; virtual; abstract;
     {* Функция сравнения элементов }
 end;//Tl3CustomSortIntegerList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3CustomSortIntegerList

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4DEFAA880377_var*
//#UC END# *47B99D4503A2_4DEFAA880377_var*
begin
//#UC START# *47B99D4503A2_4DEFAA880377_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Tl3CustomSortIntegerList(CI.rList).CompareItems(CI.rA^, CI.rB^);
//#UC END# *47B99D4503A2_4DEFAA880377_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3CustomSortIntegerList;

{$Include l3AtomicListPrim.imp.pas}

// start class Tl3CustomSortIntegerList

procedure Tl3CustomSortIntegerList.InitFields;
//#UC START# *47A042E100E2_4DEFAA880377_var*
//#UC END# *47A042E100E2_4DEFAA880377_var*
begin
//#UC START# *47A042E100E2_4DEFAA880377_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_4DEFAA880377_impl*
end;//Tl3CustomSortIntegerList.InitFields

end.