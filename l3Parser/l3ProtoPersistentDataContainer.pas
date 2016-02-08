unit l3ProtoPersistentDataContainer;
 
{$Include l3Define.inc}

interface

uses
  l3ProtoPersistent,
  l3PureMixIns,
  l3IID,
  l3Interfaces
  ;

type
 _l3DataContainer_Parent_ = Tl3ProtoPersistent;
 {$Include l3DataContainer.imp.pas}
 _l3Changing_Parent_ = _l3DataContainer_;
 {$Include l3Changing.imp.pas}
 _l3COMQueryInterface_Parent_ = _l3Changing_;
 {$Include l3COMQueryInterface.imp.pas}
 Tl3ProtoPersistentDataContainer = {abstract} class(_l3COMQueryInterface_)
 end;//Tl3ProtoPersistentDataContainer

implementation

uses
  l3InterfacesMisc
  ;

{$Include l3DataContainer.imp.pas}

{$Include l3Changing.imp.pas}

{$Include l3COMQueryInterface.imp.pas}

end.