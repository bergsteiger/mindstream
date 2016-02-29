unit l3Math;
{* Математические функции. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Math -                    }
{ Начат: 22.11.1999 18:02             }
{ $Id: l3Math.pas,v 1.11 2014/05/20 16:49:24 lulin Exp $ }

// $Log: l3Math.pas,v $
// Revision 1.11  2014/05/20 16:49:24  lulin
// - пытаемся восстановить компилируемость под XE.
//
// Revision 1.10  2009/07/01 10:39:32  lulin
// [$155025732].
//
// Revision 1.9  2009/06/29 15:57:43  lulin
// - прикрутил MulDiv от Кусакина.
//
// Revision 1.8  2009/06/29 09:53:00  lulin
// - заготовка от Кусакина - [$154075545].
//
// Revision 1.7  2009/06/29 08:36:19  lulin
// {RequestLink:154075236}. №7.
//
// Revision 1.6  2006/11/03 13:25:51  lulin
// - cleanup.
//
// Revision 1.5  2002/07/16 07:49:51  law
// - new proc: l3Between.
//
// Revision 1.4  2001/12/24 14:44:58  voba
// - bug fix: подключили новый индексатор к Архивариусу.
//
// Revision 1.3  2001/07/27 15:46:04  law
// - comments: xHelpGen.
//
// Revision 1.2  2000/12/15 15:19:01  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

(*uses
  l3Types
  ;*)

function l3MulDiv(aParamA, aParamB, aParamC: LongInt): LongInt;
  {$IfNDef l3UseSSE}pascal;{$EndIf}
  {* Умножение с последующим делением. }
function l3Between(aValue, aLower, aUpper: LongInt): Boolean;
  {* Определяет находится ли aValue между aLower и aUpper (включительно). }
{$IfNDef Delphi6}
function Sign(X: Integer): Integer;
  {-}
{$EndIf Delphi6}

implementation

(*
function l3MulDiv(aParamA, aParamB, aParamC: Long): Long;
var
 A1 : array [0..3] of TevByte absolute aParamA;
 M  : Long;
 S  : Long;
begin
 if (A1[3] AND $80 = 0) then S := 1 else S := -1; {-вычисление знака S}
 M := Abs(aParamA * aParamB);
 Result := S * (M div aParamC + Ord(((M mod aParamC) shl 1) >= aParamC));
{ M := A * B;
 Result := M div C + Ord(((M mod Abs(C)) shl 1) >= Abs(C));}
end;*)

function l3MulDiv(aParamA, aParamB, aParamC: Longint): Longint;
  assembler;
{$IfNDef l3UseSSE}
  {-}
asm
               push  ebx
               xor   ecx, ecx
               mov   eax, dword ptr ss:[aParamA]
               test  eax, eax
               js    @@01
               inc   ecx
               jmp   @@02
 @@01:         dec   ecx
 @@02:         mov   edx, dword ptr ss:[aParamB]
               imul  edx
               mov   ebx, dword ptr ss:[aParamC]
               idiv  ebx
               test  edx, edx
               jns   @@03
               neg   edx
 @@03:         add   edx, edx
               cmp   edx, ebx
               jb    @@04
               add   eax, ecx
 @@04:         pop   ebx
end;
{$Else  l3UseSSE}
asm
  cvtsi2sd xmm0, eax   //load 32bit int to 64bit double
  cvtsi2sd xmm1, edx
  cvtsi2sd xmm2, ecx

  mulsd    xmm0, xmm1  //xmm0 = xmm0*xmm1
  divsd    xmm0, xmm2  //xmm0 = xmm0/xmm2

  cvtsd2si eax,  xmm0   //eax = int32(xmm0)
end;
{$EndIf l3UseSSE}

{$IfNDef Delphi6}
function Sign(X: Integer): Integer;
  {-}
begin
 if (X < 0) then
  Result := -1
 else if (X > 0) then
  Result := 1
 else
  Result := 0;
end;
{$EndIf Delphi6}

function l3Between(aValue, aLower, aUpper: LongInt): Boolean;
  {* Определяет находится ли aValue между aLower и aUpper (включительно). }
begin
 Result := (aValue >= aLower) AND (aValue <= aUpper);
end;

end.
