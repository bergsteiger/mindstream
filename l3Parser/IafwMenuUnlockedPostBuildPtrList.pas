unit IafwMenuUnlockedPostBuildPtrList;

 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

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
 _ItemType_ = IafwMenuUnlockedPostBuild;
 _l3InterfacePtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfacePtrList.imp.pas}
 TIafwMenuUnlockedPostBuildPtrList = class(_l3InterfacePtrList_)
 end;//TIafwMenuUnlockedPostBuildPtrList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = TIafwMenuUnlockedPostBuildPtrList;

{$Include l3InterfacePtrList.imp.pas}

end.