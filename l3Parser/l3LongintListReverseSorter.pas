unit l3LongintListReverseSorter;
 
{$Include l3Define.inc}

interface

uses
  l3CustomLongintListView,
  l3PureMixIns
  ;

type
 Tl3LongintListReverseSorter = class(Tl3CustomLongintListView)
  {* Пример списка, который сортирует исходный список в обратном порядке }
 protected
 // realized methods
   function CompareData(const anItem1: _ItemType_;
     const anItem2: _ItemType_): Integer; override;
 end;//Tl3LongintListReverseSorter

implementation

// start class Tl3LongintListReverseSorter

function Tl3LongintListReverseSorter.CompareData(const anItem1: _ItemType_;
  const anItem2: _ItemType_): Integer;
//#UC START# *4DEFB2D90167_4DEFC02E01CF_var*
//#UC END# *4DEFB2D90167_4DEFC02E01CF_var*
begin
//#UC START# *4DEFB2D90167_4DEFC02E01CF_impl*
 Result := (anItem2 - anItem1);
//#UC END# *4DEFB2D90167_4DEFC02E01CF_impl*
end;//Tl3LongintListReverseSorter.CompareData

end.