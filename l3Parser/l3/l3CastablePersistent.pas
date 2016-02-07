unit l3CastablePersistent;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  Classes,
  l3Interfaces
  ;

type
 _l3Castable_Parent_ = TPersistent;
 {$Include ..\L3\l3Castable.imp.pas}
 Tl3CastablePersistent = {abstract} class(_l3Castable_)
  {* TPersistent с методом QueryInterface. }
 end;//Tl3CastablePersistent

implementation

{$Include ..\L3\l3Castable.imp.pas}

end.