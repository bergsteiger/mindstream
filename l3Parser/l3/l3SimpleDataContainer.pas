unit l3SimpleDataContainer;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3SimpleObject
  ;

type
 _l3DataContainer_Parent_ = Tl3SimpleObject;
 {$Include ..\L3\l3DataContainer.imp.pas}
 Tl3SimpleDataContainer = {abstract} class(_l3DataContainer_)
 end;//Tl3SimpleDataContainer

implementation

{$Include ..\L3\l3DataContainer.imp.pas}

end.