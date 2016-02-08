unit l3ProtoPtrRecListPrim;
 
{$Include l3Define.inc}

interface

uses
  l3Memory,
  l3ProtoDataContainer,
  l3PureMixIns,
  l3Interfaces,
  l3Types,
  l3Except,
  Classes
  ;

 {$Define l3Items_NeedsBeforeFreeItem}

 {$Define l3Items_HasChanging}

 {$Define l3Items_IsProto}

type
 _DataType_ = Tl3Ptr;
 _l3Changing_Parent_ = Tl3ProtoDataContainer;
 {$Include l3Changing.imp.pas}
 _l3UntypedList_Parent_ = _l3Changing_;
 {$Include l3UntypedList.imp.pas}
 Tl3ProtoPtrRecListPrim = class(_l3UntypedList_)
 end;//Tl3ProtoPtrRecListPrim

implementation

uses
  SysUtils,
  RTLConsts,
  l3Base,
  l3MinMax
  ;

{$Include l3Changing.imp.pas}

type _Instance_R_ = Tl3ProtoPtrRecListPrim;

{$Include l3UntypedList.imp.pas}

end.