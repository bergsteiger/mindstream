unit IafwSettingsReplaceListenerPtrList;
 
{$Include afwDefine.inc}

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
 _ItemType_ = IafwSettingsReplaceListener;
 _l3InterfacePtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfacePtrList.imp.pas}
 TIafwSettingsReplaceListenerPtrList = class(_l3InterfacePtrList_)
  {* —ÔËÒÓÍ ” ¿«¿“≈À≈… Ì‡ IafwSettingsReplaceListener }
 end;//TIafwSettingsReplaceListenerPtrList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = TIafwSettingsReplaceListenerPtrList;

{$Include l3InterfacePtrList.imp.pas}

end.