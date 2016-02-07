unit l3LongintList;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3LongintListPrim
  ;

type
 _ListType_ = Tl3LongintListPrim;
 _l3ListOperations_Parent_ = Tl3LongintListPrim;
 {$Include ..\L3\l3ListOperations.imp.pas}
 Tl3LongintList = class(_l3ListOperations_)
  {* Список целых чисел }
 end;//Tl3LongintList

implementation

{$Include ..\L3\l3ListOperations.imp.pas}

end.
