unit l3SimpleNodeList;
 
{$Include l3Define.inc}

interface

uses
  l3TreeInterfaces,
  l3SimpleDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Il3SimpleNode;
 _l3InterfaceRefList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfaceRefList.imp.pas}
 Tl3SimpleNodeList = class(_l3InterfaceRefList_)
 end;//Tl3SimpleNodeList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = Tl3SimpleNodeList;

{$Include l3InterfaceRefList.imp.pas}

end.