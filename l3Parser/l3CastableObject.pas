unit l3CastableObject;

{$Include l3Define.inc}

interface

uses
  l3Interfaces
  ;

type
 _l3Castable_Parent_ = TObject;
 {$Include l3Castable.imp.pas}
 Tl3CastableObject = class(_l3Castable_)
 end;//Tl3CastableObject

implementation

{$Include l3Castable.imp.pas}

end.