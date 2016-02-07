unit l3BaseRecList;

 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoPtrRecList
  ;

type
 Tl3BaseRecList = class(Tl3ProtoPtrRecList)
 protected
 // realized methods
   function DoCompare(const A;
    const B;
    DataSize: Cardinal): Integer; override;
     {* Сравнивает элементы. }
 public
 // public methods
   function CompareItem(A: Integer;
    const B;
    aDataSize: Cardinal): Integer;
     {* aDataSize - размер сравниваемой части записи, если 0, то вся запись }
 end;//Tl3BaseRecList

implementation

uses
  m2MemLib
  ;

// start class Tl3BaseRecList

function Tl3BaseRecList.CompareItem(A: Integer;
  const B;
  aDataSize: Cardinal): Integer;
//#UC START# *47BF07D000E6_479DF7E200A3_var*
//#UC END# *47BF07D000E6_479DF7E200A3_var*
begin
//#UC START# *47BF07D000E6_479DF7E200A3_impl*
 Result := DoCompare(ItemSlot(A)^, B, aDataSize);
//#UC END# *47BF07D000E6_479DF7E200A3_impl*
end;//Tl3BaseRecList.CompareItem

function Tl3BaseRecList.DoCompare(const A;
  const B;
  DataSize: Cardinal): Integer;
//#UC START# *47BC677E02B1_479DF7E200A3_var*
//#UC END# *47BC677E02B1_479DF7E200A3_var*
begin
//#UC START# *47BC677E02B1_479DF7E200A3_impl*
 if DataSize = 0 then
  DataSize := ItemSize;
 Result := m2MEMCompare(@A, @B, DataSize);
//#UC END# *47BC677E02B1_479DF7E200A3_impl*
end;//Tl3BaseRecList.DoCompare

end.