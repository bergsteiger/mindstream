unit l3DataRefList;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3SimpleDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Pointer;
 _l3DataRefList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3DataRefList.imp.pas}
 Tl3DataRefList = class(_l3DataRefList_)
  {* Список ссылок на куски памяти. При своём освобождении освобождает хранимые куски памяти. Эта память должна быть выделена функцией l3System.GetLocalMem. }
 end;//Tl3DataRefList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = Tl3DataRefList;

{$Include ..\L3\l3DataRefList.imp.pas}

end.