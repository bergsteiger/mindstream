unit l3DataContainerWithoutIUnknown;
 
{$Include l3Define.inc}

interface

uses
  l3DataContainerWithoutIUnknownPrim,
  l3PureMixIns
  ;

type
 _l3Changing_Parent_ = Tl3DataContainerWithoutIUnknownPrim;
 {$Include l3Changing.imp.pas}
 Tl3DataContainerWithoutIUnknown = {abstract} class(_l3Changing_)
  {* Контейнер данных без реализации IUnknown, но во всей интерфейсной поддержкой }
 end;//Tl3DataContainerWithoutIUnknown

implementation

{$Include l3Changing.imp.pas}

end.