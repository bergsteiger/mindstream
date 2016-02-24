unit l3ProtoPersistent;
{$Include l3Define.inc}

interface

uses
  l3CastablePersistent,
  l3PureMixIns
  ;

type
 _l3Unknown_Parent_ = Tl3CastablePersistent;
 {$Include l3Unknown.imp.pas}
 Tl3ProtoPersistent = {abstract} class(_l3Unknown_)
 end;//Tl3ProtoPersistent

implementation

uses
  SysUtils,
  l3Base,
  l3Core,
  Windows,
  Classes,
  l3MemUtils,
  l3Interlocked
  ;

{$Include l3Unknown.imp.pas}

end.