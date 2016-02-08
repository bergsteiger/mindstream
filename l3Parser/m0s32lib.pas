(*
//
// module:  m0s32lib.pas
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: m0s32lib.pas,v 1.1 2014/08/20 16:31:25 lulin Exp $
//
*)
unit    m0S32Lib;

{$I m0Define.inc}

interface


uses
  Windows,
  Messages,
  SysUtils,
  Consts,
  Classes
  ,

  m0Const{,
  m0AddTyp};


(*function m0S32Min(AParamA: LongInt; AParamB: LongInt): LongInt;

function m0S32Max(AParamA: LongInt; AParamB: LongInt): LongInt;*)

function m0S32Compare(AParamA: LongInt; AParamB: LongInt): Integer;

implementation


 { -- unit.public -- }

(*function m0S32Min(AParamA: LongInt; AParamB: LongInt): LongInt;
asm

  cmp   eax,edx
  jle   @@01
  mov   eax,edx
  @@01:

end;

function m0S32Max(AParamA: LongInt; AParamB: LongInt): LongInt;
asm

  cmp   eax,edx
  jnle  @@01
  mov   eax,edx
  @@01:

end;*)

function m0S32Compare(AParamA: LongInt; AParamB: LongInt): Integer;
asm

  mov   ecx,eax
  xor   eax,eax
  cmp   ecx,edx
  je    @@02
  jnge  @@01
  inc   eax
  jmp   @@02
  @@01:         dec   eax
  @@02:

end;


end.
