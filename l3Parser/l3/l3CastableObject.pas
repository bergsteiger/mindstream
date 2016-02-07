unit l3CastableObject;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces
  ;

type
 _l3Castable_Parent_ = TObject;
 {$Include ..\L3\l3Castable.imp.pas}
 Tl3CastableObject = class(_l3Castable_)
 end;//Tl3CastableObject

implementation

{$Include ..\L3\l3Castable.imp.pas}

end.