unit l3ProtoObject;

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include l3Define.inc}

interface

uses
  l3CastableObject,
  l3PureMixIns
  ;

type
 _l3Unknown_Parent_ = Tl3CastableObject;
 {$Include l3Unknown.imp.pas}
 Tl3ProtoObject = {abstract} class(_l3Unknown_)
 end;//Tl3ProtoObject

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

{$Include ..\L3\l3Unknown.imp.pas}

end.