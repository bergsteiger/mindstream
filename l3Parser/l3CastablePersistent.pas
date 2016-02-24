unit l3CastablePersistent;

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include l3Define.inc}

interface

uses
  Classes,
  l3Interfaces
  ;

type
 _l3Castable_Parent_ = TPersistent;
 {$Include l3Castable.imp.pas}
 Tl3CastablePersistent = {abstract} class(_l3Castable_)
  {* TPersistent с методом QueryInterface. }
 end;//Tl3CastablePersistent

implementation

{$Include l3Castable.imp.pas}

end.