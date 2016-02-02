unit l3ProtoDataContainerWithCOMQI;

{$Include l3Define.inc}

interface

uses
  l3ProtoDataContainer,
  l3IID,
  l3Interfaces
  ;

type
 _l3COMQueryInterface_Parent_ = Tl3ProtoDataContainer;
 {$Include l3COMQueryInterface.imp.pas}
 Tl3ProtoDataContainerWithCOMQI = class(_l3COMQueryInterface_)
 end;//Tl3ProtoDataContainerWithCOMQI

implementation

uses
  l3InterfacesMisc
  ;

{$Include l3COMQueryInterface.imp.pas}

end.