unit l3DictionaryPrim;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoDataContainer,
  l3Variant,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

 {$Define l3Items_NeedsBeforeFreeItem}

 {$Undef l3Items_NoSort}

 {$Define l3Items_CaseUnsensitive}

 {$Define l3Items_NeedsAssignItem}

type
 _l3StringList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3StringList.imp.pas}
 Tl3DictionaryPrim = class(_l3StringList_)
 end;//Tl3DictionaryPrim

implementation

uses
  l3String,
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = Tl3DictionaryPrim;

{$Include ..\L3\l3StringList.imp.pas}

end.