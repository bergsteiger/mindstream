unit l3RevertedInt64List;
 
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
 _ItemType_ = Int64;
 _l3RevertedAtomicList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3RevertedAtomicList.imp.pas}
 Tl3RevertedInt64List = class(_l3RevertedAtomicList_)
 end;//Tl3RevertedInt64List

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = Tl3RevertedInt64List;

{$Include l3RevertedAtomicList.imp.pas}

end.