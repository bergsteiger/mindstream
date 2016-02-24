unit l3CardinalList;
 
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

type
 _ItemType_ = Cardinal;
 _l3AtomicList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3AtomicList.imp.pas}
 Tl3CardinalList = class(_l3AtomicList_)
  {* Список, содержащий Cardinal }
 end;//Tl3CardinalList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = Tl3CardinalList;

{$Include l3AtomicList.imp.pas}

end.