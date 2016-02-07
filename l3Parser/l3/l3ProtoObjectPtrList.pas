unit l3ProtoObjectPtrList;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Tl3ProtoObject;
 _l3ObjectPtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3ObjectPtrList.imp.pas}
 Tl3ProtoObjectPtrList = class(_l3ObjectPtrList_)
  {* —ÔËÒÓÍ ” ¿«¿“≈À≈… Ì‡ Tl3ProtoObject }
 end;//Tl3ProtoObjectPtrList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = Tl3ProtoObjectPtrList;

{$Include ..\L3\l3ObjectPtrList.imp.pas}

end.