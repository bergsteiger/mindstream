unit l3CastableStrings;

 
{$Include ..\L3\l3Define.inc}

interface

uses
  Classes,
  l3Interfaces
  ;

type
 _l3Castable_Parent_ = TStrings;
 {$Include ..\L3\l3Castable.imp.pas}
 Tl3CastableStrings = class(_l3Castable_)
 end;//Tl3CastableStrings

implementation

{$Include ..\L3\l3Castable.imp.pas}

end.