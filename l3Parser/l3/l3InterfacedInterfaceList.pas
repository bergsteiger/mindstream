unit l3InterfacedInterfaceList;


{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3InterfaceList,
  l3PureMixIns
  ;

type
 _ListType_ = Il3InterfaceList;
 _l3InterfacedList_Parent_ = Tl3InterfaceList;
 {$Include ..\L3\l3InterfacedList.imp.pas}
 Tl3InterfacedInterfaceList = class(_l3InterfacedList_)
 end;//Tl3InterfacedInterfaceList

implementation

type _Instance_R_ = Tl3InterfacedInterfaceList;

{$Include ..\L3\l3InterfacedList.imp.pas}

end.