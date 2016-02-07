unit IafwSettingListenerPtrList;
 
{$Include ..\AFW\afwDefine.inc}

interface

uses
  afwInterfaces,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = IafwSettingListener;
 _l3InterfacePtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\l3\l3InterfacePtrList.imp.pas}
 TIafwSettingListenerPtrList = class(_l3InterfacePtrList_)
  {* —ÔËÒÓÍ ” ¿«¿“≈À≈… Ì‡ IafwSettingListener }
 end;//TIafwSettingListenerPtrList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = TIafwSettingListenerPtrList;

{$Include ..\l3\l3InterfacePtrList.imp.pas}

end.