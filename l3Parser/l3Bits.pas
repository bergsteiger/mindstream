unit l3Bits;
{* Функции для работы с битами. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Bits -                    }
{ Начат: 05.10.1999 15:31             }
{ $Id: l3Bits.pas,v 1.19 2012/11/01 09:42:57 lulin Exp $ }

// $Log: l3Bits.pas,v $
// Revision 1.19  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.18  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.17  2008/04/01 17:07:09  lulin
// - нарисовал контейнер документа на модели.
//
// Revision 1.16  2007/08/14 14:30:12  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.15  2005/07/21 14:47:36  lulin
// - базовая виртуальная нода вынесена в отдельный модуль.
//
// Revision 1.14  2004/03/05 15:52:11  demon
// - new function: l3TestPartMask
//
// Revision 1.13  2003/12/11 13:29:13  voba
// - add: новая функция l3GetByMask
//
// Revision 1.12  2003/05/30 17:05:12  voba
// - rename l3*Flag to l3*Mask
//
// Revision 1.11  2002/01/23 10:20:13  voba
// -bug fix : borland non correct size of type workarround
//
// Revision 1.10  2001/11/21 15:17:32  law
// - new procs: l3*Bit - для работы с Word'ом.
//
// Revision 1.9  2001/11/21 14:11:00  law
// - new type: Tl3BitNum.
//
// Revision 1.8  2001/11/21 13:56:32  law
// - new behavior: _l3TestBit теперь возвращает Boolean - 0 или 1.
//
// Revision 1.7  2001/07/26 15:55:03  law
// - comments: xHelpGen.
//
// Revision 1.6  2001/04/05 08:53:51  law
// - _move: функции l3TestFlag & Co переехали в модуль l3Bits.
//
// Revision 1.5  2000/12/15 15:18:59  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  l3Types
  ;

const
  l3MinBitNum = Integer(0);
    {* - минимальный номер бита в целом. }
  l3MaxBitNum = Integer(31);
    {* - максимальный номер бита в целом. }

type
  Tl3BitNum = integer;//l3MinBitNum .. l3MaxBitNum;
    {* - число бит в целом. }

{$IfDef WIN32}
function  l3TestBit(W: Long; N: Tl3BitNum): Boolean;
  {* - проверить N-й бит. }
{$Else  WIN32}
function  l3TestBit(W: Long; N: Tl3BitNum): LongBool;
  {* - проверить N-й бит. }
{$EndIf WIN32}
procedure l3SetBit(var W : Long; N: Tl3BitNum);
  overload;
  {* - установить N-й бит. }
procedure l3SetBit(var W : Word; N: Tl3BitNum);
  overload;
  {* - установить N-й бит. }
procedure l3ClearBit(var W: Long; N: Tl3BitNum);
  overload;
  {* - очистить N-й бит. }
procedure l3ClearBit(var W: Word; N: Tl3BitNum);
  overload;
  {* - очистить N-й бит. }
procedure l3InvertBit(var W: Long; N: Tl3BitNum);
  overload;
  {* - инвертировать N-й бит. }
procedure l3InvertBit(var W: Word; N: Tl3BitNum);
  overload;
  {* - инвертировать N-й бит. }
function  l3BitCount(X: Long): Long;
  {* - подсчитать число бит. }
function  l3BitCountF(X: Long): Long;
  {* - "быстро" подсчитать число бит. }

function  l3TestMask(W, N : Integer) : Boolean;
  {* - проверить маску. }
function  l3TestPartMask(W, N : Integer) : Boolean;
  {* - проверить на пересечение с маской. }
function  l3GetByMask(W, N : Integer) : Integer;
  {* - сфильтровать маской. }
procedure l3SetMask(var W : Integer; N : Integer);
  {* - установить маску. }
procedure l3ClearMask(var W : Integer; N : Integer);
  {* - очистить маску. }
procedure l3InvertMask(var W: Integer; N : Integer);
  {* - инвертировать маску. }

implementation

var
 l3BitTable: array[0..255] of Long;

procedure LoadBitTable;
var
 i : Long;
begin
 for i:=0 to 255 do
  l3BitTable[i] := l3BitCount(i);
end;

function l3BitCount(X: Long): Long;
  {-}
var
 Y : Long;
begin
 Y := X;
 Y := Y - ((Y shr 1) and $55555555);
 Y := (Y and $33333333) + ((Y shr 2) and $33333333);
 Y := Y + Y shr 4;
 Y := Y and $0f0f0f0f;
 Y := Y + Y shr 8;
 y := Y + Y shr 16;
 Result := Y and $000000ff;
end;

function l3BitCountF(X:Long):Long;
  register;
  {-}
asm
   test eax,eax
   jz @@Done

   push ebx
   mov ebx,eax

   xor ecx,ecx
   xor edx,edx

   mov cl,bl
   mov dl,bh

   shr ebx,16
   mov eax, dword ptr [l3BitTable+ecx*4]

   add eax, dword ptr [l3BitTable+edx*4]
   mov cl,bl

   add eax, dword ptr [l3BitTable+ecx*4]
   mov dl,bh

   add eax, dword ptr [l3BitTable+edx*4]
   pop ebx
@@Done:
end;

{$IFDEF WIN32}
function l3TestBit(W: Long; N: Tl3BitNum): Boolean; register;
                  {eax,     edx}
  {-}
asm
       mov     ecx, eax
       xor     eax, eax
       bt      ecx, edx
       adc     eax, eax
end;
{$ELSE WIN32}
function l3TestBit(W: Long; N: Tl3BitNum): LongBool; assembler;
  {-}
asm
db $66; mov     ax, word ptr ss:[W]
db $66; mov     dx, word ptr ss:[N]
        dd      $D0A30F66                  { bt      eax, edx }
db $66; jc      @@ret
db $66; xor     ax, ax                     { xor     eax, eax }
@@ret:
db $66; push    ax                         { push    eax      }
        pop     ax                         { eax.Lo -> ax     }
        pop     dx                         { eax.Hi -> dx     }
end;
{$ENDIF WIN32}
(*begin
 Result := (W AND (1 shl N)) <> 0;
end;*)

{$IFDEF WIN32}
procedure l3SetBit(var W : Long; N: Tl3BitNum); register;
  {-}               {eax,         edx}
asm
       bts     [eax], edx
end;

procedure l3SetBit(var W : Word; N: Tl3BitNum); register;
  {-}               {eax,         edx}
asm
       bts     word ptr [eax], edx
end;
{$ELSE WIN32}
procedure l3SetBit(var W : Long; N: Tl3BitNum);
  {-}
begin
 W := (W OR (1 shl N));
end;
{$ENDIF WIN32}
(*begin
 W := (W OR (1 shl N));
end;*)

{$IFDEF WIN32}
procedure l3ClearBit(var W: Long; N: Tl3BitNum);
  {-}
asm
       btr     [eax], edx
end;

procedure l3ClearBit(var W: Word; N: Tl3BitNum);
  {-}
asm
       btr     word ptr [eax], edx
end;
{$ELSE WIN32}
procedure l3ClearBit(var W: Long; N: Tl3BitNum);
  {-}
begin
 W := (W AND not(1 shl N));
end;
{$ENDIF WIN32}
(*begin
 W := (W AND not(1 shl N));
end;*)

procedure l3InvertBit(var W: Long; N: Tl3BitNum);
  {-}
asm
       btc     [eax], edx
end;

procedure l3InvertBit(var W: Word; N: Tl3BitNum);
  {-}
asm
       btc     word ptr [eax], edx
end;

function  l3TestMask(W, N : Integer) : Boolean;
  {-}
begin
 Result := W and N = N;
end;

function  l3TestPartMask(W, N : Integer) : Boolean;
  {-}
begin
 Result := W and N <> 0;
end;

function  l3GetByMask(W, N : Integer) : Integer;
  {-}
begin
 Result := W and N;
end;

procedure l3SetMask(var W : Integer; N : Integer);
  {-}
begin
 W := W or N;
end;

procedure l3ClearMask(var W : Integer; N : Integer);
  {-}
begin
 W := W and not N;
end;

procedure l3InvertMask(var W: Integer; N : Integer);
  {-}
begin
 W := W xor N;
end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3Bits.pas initialization enter'); {$EndIf}
 LoadBitTable;

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3Bits.pas initialization leave'); {$EndIf}
end.

