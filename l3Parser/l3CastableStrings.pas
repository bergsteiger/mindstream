unit l3CastableStrings;

 
{$Include l3Define.inc}

interface

uses
  Classes,
  l3Interfaces
  ;

type
 _l3Castable_Parent_ = TStrings;
 {$Include l3Castable.imp.pas}
 Tl3CastableStrings = class(_l3Castable_)
 end;//Tl3CastableStrings

implementation

{$Include l3Castable.imp.pas}

end.