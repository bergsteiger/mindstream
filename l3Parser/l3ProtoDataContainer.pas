unit l3ProtoDataContainer;

{$Include l3Define.inc}

interface

uses
  l3ProtoObject
  ;

type
 _l3DataContainer_Parent_ = Tl3ProtoObject;
 {$Include l3DataContainer.imp.pas}
 Tl3ProtoDataContainer = {abstract} class(_l3DataContainer_)
  {* Самый примитивный контейнер данных }
 end;//Tl3ProtoDataContainer

implementation

{$Include l3DataContainer.imp.pas}

end.