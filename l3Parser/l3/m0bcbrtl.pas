unit m0BCBRTL;

{* Процедуры работы с памятью для C-шных obj-файлов. }

(*
//
// module:  m0bcblib.pas
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: m0bcbrtl.pas,v 1.2 2014/08/21 07:02:07 lulin Exp $
//
*)

 // $Log: m0bcbrtl.pas,v $
 // Revision 1.2  2014/08/21 07:02:07  lulin
 // - чистим код.
 //
 // Revision 1.1  2014/08/20 16:31:25  lulin
 // - вычищаем мусор.
 //
 // Revision 1.8  2014/08/20 13:40:55  lulin
 // - вычищаем мусор.
 //
 // Revision 1.7  2013/04/05 12:03:18  lulin
 // - портируем.
 //
 // Revision 1.6  2012/11/01 09:43:03  lulin
 // - забыл точку с запятой.
 //
 // Revision 1.5  2012/11/01 07:45:17  lulin
 // - делаем возможность логирования процесса загрузки модулей.
 //
 // Revision 1.4  2012/01/12 11:51:40  lulin
 // {RequestLink:326769483}
 // - пытаемся восстановиться после проезда по памяти.
 //
 // Revision 1.3  2009/10/20 14:09:22  lulin
 // - удалён за ненадобностью.
 //
 // Revision 1.2  2009/03/19 16:28:26  lulin
 // [$139443095].
 //
 // Revision 1.1  2008/02/07 09:54:24  lulin
 // - библиотека m0 переехала внутрь библиотеки L3.
 //
 // Revision 1.11  2007/08/14 19:32:04  lulin
 // - оптимизируем очистку памяти.
 //
 // Revision 1.10  2006/05/04 11:01:29  lulin
 // - поправлен тип длины строки.
 // - вычищены "старые" методы работы с памятью и строками.
 //
 // Revision 1.9  2003/11/26 15:26:00  fireton
 // update: исходники частично отформатированы
 //
 // Revision 1.8  2002/03/21 12:22:00  law
 // - bug fix: не очищалась память.
 //
 // Revision 1.7  2002/03/01 12:58:45  law
 // - cleanup.
 //
 // Revision 1.6  2002/03/01 12:29:46  law
 // no message
 //
 // Revision 1.5  2002/03/01 12:17:13  narry
 // - bug fix: AV при включенной директиве m0AllocSize.
 //

{$I m0Define.inc}

interface

(*const
  __chartype: packed array[0..256] of Word = ($0000,
    $0020, $0020, $0020, $0020, $0020, $0020, $0020, $0020, // $00
    $0020, $0028, $0028, $0028, $0028, $0028, $0020, $0020, // $08
    $0020, $0020, $0020, $0020, $0020, $0020, $0020, $0020, // $10
    $0020, $0020, $0020, $0020, $0020, $0020, $0020, $0020, // $18
    $0048, $0010, $0010, $0010, $0010, $0010, $0010, $0010, // $20
    $0010, $0010, $0010, $0010, $0010, $0010, $0010, $0010, // $28
    $0084, $0084, $0084, $0084, $0084, $0084, $0084, $0084, // $30
    $0084, $0084, $0010, $0010, $0010, $0010, $0010, $0010, // $38
    $0010, $0181, $0181, $0181, $0181, $0181, $0181, $0101, // $40
    $0101, $0101, $0101, $0101, $0101, $0101, $0101, $0101, // $48
    $0101, $0101, $0101, $0101, $0101, $0101, $0101, $0101, // $50
    $0101, $0101, $0101, $0010, $0010, $0010, $0010, $0010, // $58
    $0010, $0182, $0182, $0182, $0182, $0182, $0182, $0102, // $60
    $0102, $0102, $0102, $0102, $0102, $0102, $0102, $0102, // $68
    $0102, $0102, $0102, $0102, $0102, $0102, $0102, $0102, // $70
    $0102, $0102, $0102, $0010, $0010, $0010, $0010, $0020, // $78
    $0000, $0000, $0010, $0000, $0010, $0010, $0010, $0010, // $80
    $0010, $0010, $0000, $0010, $0000, $0000, $0000, $0000, // $88
    $0000, $0010, $0010, $0010, $0010, $0010, $0010, $0010, // $90
    $0000, $0010, $0000, $0010, $0000, $0000, $0000, $0000, // $98
    $0048, $0000, $0000, $0000, $0010, $0000, $0010, $0010, // $a0
    $0000, $0010, $0000, $0010, $0010, $0010, $0010, $0000, // $a8
    $0010, $0010, $0000, $0000, $0000, $0010, $0010, $0010, // $b0
    $0000, $0010, $0000, $0010, $0000, $0000, $0000, $0000, // $b8
    $0101, $0101, $0101, $0101, $0101, $0101, $0101, $0101, // $c0
    $0101, $0101, $0101, $0101, $0101, $0101, $0101, $0101, // $c8
    $0101, $0101, $0101, $0101, $0101, $0101, $0101, $0101, // $d0
    $0101, $0101, $0101, $0101, $0101, $0101, $0101, $0101, // $d8
    $0102, $0102, $0102, $0102, $0102, $0102, $0102, $0102, // $e0
    $0102, $0102, $0102, $0102, $0102, $0102, $0102, $0102, // $e8
    $0102, $0102, $0102, $0102, $0102, $0102, $0102, $0102, // $f0
    $0102, $0102, $0102, $0102, $0102, $0102, $0102, $0102  // $f8
    );*)


procedure _abort;
  cdecl;

function _tolower(AChar: Integer): Integer;
  cdecl;

function _malloc(ASize: LongInt): Pointer;
  cdecl;

function _realloc(APointer: Pointer; ASize: LongInt): Pointer;
  cdecl;

procedure _free(APointer: Pointer);
  cdecl;

function _memcmp(ADest: Pointer; ASour: Pointer; ASize: LongInt): Integer;
  cdecl;

function _memcpy(ADest: Pointer; ASour: Pointer; ASize: LongInt): Pointer;
  cdecl;

function _memmove(ADest: Pointer; ASour: Pointer; ASize: LongInt): Pointer;
  cdecl;

procedure _memset(ADest: Pointer; AChar: Integer; ASize: LongInt);
  cdecl;

function _strlen(ASour: PChar): LongInt;
  cdecl;

implementation

uses
  SysUtils,

  l3Base,
  l3Memory,

  m0MemLib,
  m0StrLib,

  m2MemLib
  ;

var
  g_Buffers12: Pl3MemoryChain = nil;
  g_Buffers20: Pl3MemoryChain = nil;

 { -- unit.public -- }

procedure _abort;
begin
  Abort;
end;

function _tolower(AChar: Integer): Integer;
begin
  if ((AChar >= 0) and (AChar <= 255)) then
    Result := Ord(m0STRAnsiLowerChar(AnsiChar(AChar)))
  else
    Result := AChar;
end;

function _malloc(ASize: LongInt): Pointer;
begin
  case aSize of
    12: 
     g_Buffers12.AllocItem(Result);
    20: 
     g_Buffers20.AllocItem(Result);
    else
    begin
     m0MEMAlloc(Result, ASize, #000);
     Exit;
    end;//else 
  end;//Case aSize
  l3FillChar(Result^, aSize, 0);
end;

function _realloc(APointer: Pointer; ASize: LongInt): Pointer;
begin
  Result := APointer;
  Assert(m0MemSize(APointer) >= 0);
  m0MEMReAlloc(Result, ASize, #000);
end;

procedure _free(APointer: Pointer);
var
  l_Size: LongInt;
begin
  l_Size := m0MemSize(aPointer);
  if (l_Size = g_Buffers12.RealSize) then
    g_Buffers12.FreeItem(aPointer)
  else
  if (l_Size = g_Buffers20.RealSize) then
    g_Buffers20.FreeItem(aPointer)
  else
  begin
   Assert(l_Size >= 0);
   m0MEMFree(APointer);
  end;//l_Size = g_Buffers20.RealSize
end;

function _memcmp(ADest: Pointer; ASour: Pointer; ASize: LongInt): Integer;
begin
 Result := m2MEMCompare(ADest, ASour, ASize);
end;

function _memcpy(ADest: Pointer; ASour: Pointer; ASize: LongInt): Pointer;
begin
 Result := m2MEMCopy(ADest, ASour, ASize);
end;

function _memmove(ADest: Pointer; ASour: Pointer; ASize: LongInt): Pointer;
begin
 Result := m2MEMCopy(ADest, ASour, ASize);
end;

procedure _memset(ADest: Pointer; AChar: Integer; ASize: LongInt);
begin
 m2MEMFill(ADest, ASize, Lo(AChar));
end;

function _strlen(ASour: PChar): LongInt;
begin
 Result := StrLen(ASour);
end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\m0\pas\m0bcbrtl.pas initialization enter'); {$EndIf}
 g_Buffers12 := l3NewMemoryChain(12);
 g_Buffers20 := l3NewMemoryChain(20);

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\m0\pas\m0bcbrtl.pas initialization leave'); {$EndIf}
end.
