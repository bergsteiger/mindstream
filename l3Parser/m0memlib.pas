unit m0MEMLib;

(*
//
// module:  m0memlib.pas
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: m0memlib.pas,v 1.3 2014/08/21 07:21:20 lulin Exp $
//
*)

// $Log: m0memlib.pas,v $
// Revision 1.3  2014/08/21 07:21:20  lulin
// - чистим код.
//
// Revision 1.2  2014/08/21 07:02:08  lulin
// - чистим код.
//
// Revision 1.1  2014/08/20 16:31:25  lulin
// - вычищаем мусор.
//
// Revision 1.8  2014/08/20 15:00:41  lulin
// - вычищаем мусор.
//
// Revision 1.7  2014/08/20 14:11:44  lulin
// - вычищаем мусор.
//
// Revision 1.6  2014/08/20 13:40:55  lulin
// - вычищаем мусор.
//
// Revision 1.5  2013/07/08 16:43:16  lulin
// - выделяем работу с размером куска памяти.
//
// Revision 1.4  2013/04/12 16:25:07  lulin
// - отлаживаем под XE3.
//
// Revision 1.3  2013/04/08 14:50:45  lulin
// - портируем.
//
// Revision 1.2  2012/01/11 17:29:57  lulin
// {RequestLink:326769483}
//
// Revision 1.1  2008/02/07 09:54:24  lulin
// - библиотека m0 переехала внутрь библиотеки L3.
//
// Revision 1.15  2006/05/18 12:10:14  lulin
// - cleanup.
//

{$Include m0Define.inc}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Consts,
  Classes,

  m0Const,
  //m0AddTyp,
  m0S32Lib
  ;

procedure m0MEMAlloc(var ADest: Pointer; ASize: LongInt; AChar: AnsiChar);

procedure m0MEMFree(var ADest: Pointer);

procedure m0MEMReAlloc(var ADest: Pointer; ASize: LongInt; AChar: AnsiChar);

function m0MEMSize(ADest: Pointer): LongInt;

implementation

uses
  l3Base,
  l3MemorySizeUtils,
  l3Memory,

  m2MemLib
  ;

procedure m0MEMAlloc(var ADest: Pointer; ASize: LongInt; AChar: AnsiChar);
begin
 l3System.GetLocalMem(aDest, aSize);
 if (aDest <> nil) then
  m2MEMFill(ADest, ASize, Byte(AChar));
end;

procedure m0MEMFree(var ADest: Pointer);

begin
 l3System.FreeLocalMem(aDest);
end;

procedure m0MEMReAlloc(var ADest: Pointer; ASize: LongInt; AChar: AnsiChar);
var
 l_OldSize: LongInt;
begin
 l_OldSize := m0MEMSize(aDest);
 if (l_OldSize <> aSize) then
 begin
  l3System.ReallocLocalMem(aDest, aSize);
  if (l_OldSize < aSize) then
   m2MemFill(PAnsiChar(aDest) + l_OldSize, aSize - l_OldSize, Byte(aChar));
 end;//l_OldSize <> aSize
end;

function m0MEMSize(ADest: Pointer): LongInt;
begin
 Result := l3MemorySize(aDest);
end;

end.
