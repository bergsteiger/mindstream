unit m0STRLib;

(*
//
// module:  m0strlib.pas
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: m0strlib.pas,v 1.2 2014/08/21 07:02:08 lulin Exp $
//
*)

// $Log: m0strlib.pas,v $
// Revision 1.2  2014/08/21 07:02:08  lulin
// - чистим код.
//
// Revision 1.1  2014/08/20 16:31:25  lulin
// - вычищаем мусор.
//
// Revision 1.4  2014/08/20 15:00:41  lulin
// - вычищаем мусор.
//
// Revision 1.3  2013/04/05 12:03:18  lulin
// - портируем.
//
// Revision 1.2  2009/03/19 16:28:26  lulin
// [$139443095].
//
// Revision 1.1  2008/02/07 09:54:24  lulin
// - библиотека m0 переехала внутрь библиотеки L3.
//
// Revision 1.7  2007/08/21 08:58:54  fireton
// - исправление функции генерации заголовка документа
//
// Revision 1.6  2006/05/04 11:01:29  lulin
// - поправлен тип длины строки.
// - вычищены "старые" методы работы с памятью и строками.
//
// Revision 1.5  2004/04/20 09:38:52  law
// - cleanup.
//

{$I m0Define.inc}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Consts,
  Classes,

  m0Const,
  //m0AddTyp,
  m0S32Lib//,
  //m0MEMLib
  ;

(*procedure m0STRNew(var ADest: PAnsiChar; ASour: PAnsiChar);

procedure m0STRNewBuff(var ADest: PAnsiChar; ABuff: PAnsiChar; ASize: LongInt);

procedure m0STRFree(var ADest: PAnsiChar);

function m0STRPos(ADest: PAnsiChar; ASour: PAnsiChar): PAnsiChar;*)

function m0STRCopySize(ADest: PAnsiChar; ASour: PAnsiChar; ASize: LongInt): PAnsiChar;

(*function m0STRAnsiIsUpper(ASour: PAnsiChar): LongBool;

function m0STRAnsiIsLower(ASour: PAnsiChar): LongBool;*)

function m0STRAnsiUpperChar(AChar: AnsiChar): AnsiChar;

function m0STRAnsiLowerChar(AChar: AnsiChar): AnsiChar;

function m0STRAnsiUpperBuff(ABuff: PAnsiChar): LongInt;

function m0STRAnsiLowerBuff(ABuff: PAnsiChar): LongInt;

function m0STRPasBuff(ABuff: PAnsiChar; ASize: LongInt): string;

(*procedure m0STRPasAppend(var ADest: string; const ASour: string);*)

implementation

uses
  l3Chars,
  l3String,

  m2MemLib
  ;

(*procedure m0STRNew(var ADest: PAnsiChar; ASour: PAnsiChar);
begin
 m0STRNewBuff(ADest, ASour, l3StrLen(ASour));
end;

procedure m0STRNewBuff(var ADest: PAnsiChar; ABuff: PAnsiChar; ASize: LongInt);
begin
 ADest := ABuff;
 if (ABuff <> nil) then
 begin
  if (ASize <> 0) then
  begin
   m0MEMAlloc(Pointer(ADest), Succ(ASize), #000);
   m2MEMCopy(ADest, ABuff, ASize);
  end
  else
   ADest := nil;
 end;//ABuff <> nil
end;

procedure m0STRFree(var ADest: PAnsiChar);
begin
 m0MEMFree(Pointer(ADest));
end;

function m0STRPos(ADest: PAnsiChar; ASour: PAnsiChar): PAnsiChar;
asm
  and   eax,eax
  je    @@05
  and   edx,edx
  jne   @@01
  xor   eax,eax
  jmp   @@05
  @@01:         push  edi
  cld
  push  esi
  push  ebx
  mov   ebx,eax
  mov   edi,edx
  xor   al,al
  xor   ecx,ecx
  dec   ecx
  repne scasb
  not   ecx
  dec   ecx
  je    @@03
  mov   esi,ecx
  mov   edi,ebx
  xor   ecx,ecx
  dec   ecx
  repne scasb
  not   ecx
  sub   ecx,esi
  jbe   @@03
  mov   edi,ebx
  mov   ebx,esi
  dec   ebx
  @@02:         mov   esi,edx
  lodsb
  repne scasb
  jne   @@03
  mov   eax,ecx
  push  edi
  mov   ecx,ebx
  repe  cmpsb
  pop   edi
  mov   ecx,eax
  jne   @@02
  mov   eax,edi
  dec   eax
  jmp   @@04
  @@03:         xor   eax,eax
  @@04:         cld
  pop   ebx
  pop   esi
  pop   edi
  @@05:

end;*)

function m0STRCopySize(ADest: PAnsiChar; ASour: PAnsiChar; ASize: LongInt): PAnsiChar;
asm

  and   eax,eax
  je    @@01
  push  edi
  push  esi
  mov   edi,eax
  mov   esi,edx
  mov   edx,ecx
  shr   ecx,$2
  rep   movsd
  mov   ecx,edx
  and   ecx,$3
  rep   movsb
  mov   edx,eax
  mov   eax,ecx
  stosb
  mov   eax,edx
  pop   esi
  pop   edi
  @@01:

end;

(*function m0STRAnsiIsUpper(ASour: PAnsiChar): LongBool;
var
 LCount : LongInt;
begin
 Result := True;
 for LCount := l3StrLen(ASour) downto 1 do
 begin
  if (m0STRAnsiUpperChar(ASour^) <> ASour^) then
  begin
   Result := False;
   Exit;
  end;//m0STRAnsiUpperChar(ASour^) <> ASour^
  Inc(LongInt(ASour));
 end;//for LCount
end;

function m0STRAnsiIsLower(ASour: PAnsiChar): LongBool;
var
 LCount : LongInt;
begin
 Result := True;
 for LCount := l3StrLen(ASour) downto 1 do
 begin
  if (m0STRAnsiLowerChar(ASour^) <> ASour^) then
  begin
   Result := False;
   Exit;
  end;//m0STRAnsiLowerChar(ASour^) <> ASour^
  Inc(LongInt(ASour));
 end;//for LCount
end;*)

function m0STRAnsiUpperChar(AChar: AnsiChar): AnsiChar;
begin
 if (AChar in cc_LoRussian + cc_LoEnglish) then
  Result := AnsiChar(Ord(AChar) and $df)
 else
   Result := AChar;
end;

function m0STRAnsiLowerChar(AChar: AnsiChar): AnsiChar;
begin
 if (AChar in cc_UpRussian + cc_UpEnglish) then
  Result := AnsiChar(Ord(AChar) or $20)
 else
  Result := AChar;
end;

function m0STRAnsiUpperBuff(ABuff: PAnsiChar): LongInt;
begin
 Result := 0;
 while (ABuff^ <> #000) do
 begin
  ABuff^ := m0STRAnsiUpperChar(ABuff^);
  Inc(LongInt(ABuff));
  Inc(Result);
 end;//while (ABuff^ <> #000)
end;

function m0STRAnsiLowerBuff(ABuff: PAnsiChar): LongInt;
begin
 Result := 0;
 while (ABuff^ <> #000) do
 begin
  ABuff^ := m0STRAnsiLowerChar(ABuff^);
  Inc(LongInt(ABuff));
  Inc(Result);
 end;//while (ABuff^ <> #000)
end;

function m0STRPasBuff(ABuff: PAnsiChar; ASize: LongInt): string;
begin
 SetString(Result, ABuff, ASize);
end;

(*procedure m0STRPasAppend(var ADest: string; const ASour: string);
begin
 if ASour = '' then
  Exit;
 if (ADest = '') then
  ADest := ASour
 else
  ADest := ADest + ' ' + ASour;
end;*)

end.
