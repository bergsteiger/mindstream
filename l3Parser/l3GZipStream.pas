unit l3GZipStream;

{ $Id: l3GZipStream.pas,v 1.13 2014/11/21 12:04:53 lukyanets Exp $ }

// $Log: l3GZipStream.pas,v $
// Revision 1.13  2014/11/21 12:04:53  lukyanets
// Отправляем описание файлов
//
// Revision 1.12  2013/07/15 07:35:39  fireton
// - дополнительные проверки GZIP на валидность
//
// Revision 1.11  2013/04/09 11:08:18  lulin
// - пытаемся отладиться под XE.
//
// Revision 1.10  2012/07/16 09:13:54  fireton
// - переводим чтение GZIP на ZLib от JCL
//
// Revision 1.9  2012/07/11 09:57:13  fireton
// - получаем размер через GetSize (чтобы избежать Seek)
//
// Revision 1.8  2011/10/14 05:28:00  narry
// Обновление
//
// Revision 1.7  2010/08/24 15:36:42  fireton
// - неправильно считался размер и криво позиционировался поток
//
// Revision 1.6  2010/08/17 10:17:40  narry
// K233013275. Корректно обрабатываем дополнительные данные
//
// Revision 1.5  2009/07/21 15:10:18  lulin
// - bug fix: не собирался и не работал Архивариус в ветке.
//
// Revision 1.4  2009/04/20 11:08:26  fireton
// - bug fix: ошибка при чтении зашифрованного потока
//
// Revision 1.3  2009/04/20 09:56:02  fireton
// - реализация seek в конец потока
//
// Revision 1.2  2009/04/20 08:13:02  fireton
// - поток для раскодирования Base64
//
// Revision 1.1  2009/04/15 14:52:28  fireton
// [$143396353]. Первый коммит.
//

interface
uses
 Classes,
 l3Base,
 l3BaseStream,
 l3Except,
 JclCompression;

type
 Tl3GZipHeader = packed record
  rID     : Word;
  rMethod : Byte;
  rFlags  : Byte;
  rTime   : Longword;
  rXFlags : Byte;
  rOS     : Byte;
 end;

 EGZIPError = class(El3Error);

 // поток, который умеет формировать данные для ZLib
 Tl3GZipProxyStream = class(Tl3Stream)
 private
  f_CRC32: LongWord;
  f_HeaderSize: Integer;
  f_OriginalSize: LongWord;
  f_Position: Int64;
  f_Size: LongWord;
  f_Stream: Tl3Stream;
 protected
  procedure Cleanup; override;
  function GetSize: Int64; override;
 public
  constructor Create(aStream: Tl3Stream);
        {* - создает подпоток. }
  function Read(var Buffer; Count: Longint): Longint; override;
        {-}
  function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
        {-}
  function Write(const Buffer; Count: Longint): Longint; override;
  property CRC32: LongWord read f_CRC32;
  property OriginalSize: LongWord read f_OriginalSize;
 end;

 // поток, умеющий распаковывать GZIP
 Tl3GZipStream = class(Tl3Stream)
 private
  f_Decompressor: TJclZLibDecompressStream;
  f_Position: LongWord;
  f_Proxy: Tl3GZipProxyStream;
  procedure DoCheckCRC32;
 protected
    // internal methods
  procedure Cleanup; override;
  function GetSize: Int64; override;
 public
    {public methods}
  constructor Create(aStream: Tl3Stream; aCheckCRC: Boolean = False); reintroduce;
        {-}
  function Read(var Buffer; Count: Longint): Longint; override;
        {-}
  function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
        {-}
  function Write(const Buffer; Count: Longint): Longint; override;
 end;

implementation
uses
 SysUtils,
 l3bits,
 zlibh,
 l3CRCUtils;

const
 cGZIPID  = $8B1F;
 cDeflate = 8;

 _cHeaderSize = SizeOf(Tl3GZipHeader);

 cZLibHeader : array[0..1] of Byte = ($78, $9C);

 cFTEXT    = 0;
 cFHCRC    = 1;
 cFEXTRA   = 2;
 cFNAME    = 3;
 cFCOMMENT = 4;

 cExtraLen = 2;
 cCRC16Len = 2;


resourcestring
 sNonGZIPFile              = 'Не найден заголовок формата GZIP';
 sUnknownCompressionMethod = 'GZIP: Неизвестный метод компрессии';
 sUnsupportedFormat        = 'GZIP: Дополнительные данные не поддерживаются';
 sInvalidFile              = 'GZIP: Файл испорчен';
 sInvalidCRC               = 'GZIP: Файл испорчен (неверная контрольная сумма)';

constructor Tl3GZipStream.Create(aStream: Tl3Stream; aCheckCRC: Boolean = False);
begin
 inherited Create;
 f_Proxy := Tl3GZipProxyStream.Create(aStream);
 if aCheckCRC then
  DoCheckCRC32;
 Seek(0, soFromBeginning); 
end;

procedure Tl3GZipStream.Cleanup;
begin
 try
  l3Free(f_Decompressor);
 except
  // гасим всякие ошибки с библиотекой декомпрессии
 end;
 l3Free(f_Proxy);
 inherited Cleanup;
end;

procedure Tl3GZipStream.DoCheckCRC32;
begin
 if L3CalcCRC32(Self) <> f_Proxy.CRC32 then
  raise EGZIPError.Create(sInvalidCRC);
end;

function Tl3GZipStream.GetSize: Int64;
begin
 Result := f_Proxy.OriginalSize;
end;

function Tl3GZipStream.Read(var Buffer; Count: Longint): Longint;
begin
 Result := f_Decompressor.Read(Buffer, Count);
 Inc(f_Position, Result);
end;

function Tl3GZipStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
 if Offset = 0 then
 begin
  case Origin of
   soBeginning:
    begin
     Result := 0;
     f_Position := 0;
     try
      FreeAndNil(f_Decompressor); // потому что он не умеет seek
     except
      // гасим ошибки с библиотекой декомпрессии
     end;
     f_Proxy.Seek(0, soBeginning);
     f_Decompressor := TJclZLibDecompressStream.Create(f_Proxy, -DEF_WBITS);
     Exit;
    end;

   soCurrent:
    begin
     Result := f_Position;
     Exit;
    end;

   soEnd:
    begin
     Result := f_Proxy.OriginalSize;
     f_Position := Result;
     Exit;
    end;
  end;
 end;
 Assert(False, 'Tl3GZipStream: произвольный seek не поддерживается');
end;

function Tl3GZipStream.Write(const Buffer; Count: Longint): Longint;
begin
 Assert(False, 'Tl3GZipStream: запись не поддерживается');
end;

constructor Tl3GZipProxyStream.Create(aStream: Tl3Stream);
var
 l_Header: Tl3GZipHeader;
 l_Temp: Integer;
 l_Char: Char;
begin
 inherited Create;
 f_Stream := aStream.Use;
 f_Stream.Seek(0, soBeginning);
 f_Stream.Read(l_Header, SizeOf(l_Header));

 if l_Header.rID <> cGZIPID then
  raise EGZIPError.Create(sNonGZIPFile);

 if l_Header.rMethod <> cDeflate then
  raise EGZIPError.Create(sUnknownCompressionMethod);

 if l_Header.rFlags > 0 then
 begin
  if l3TestBit(l_Header.rFlags, cFEXTRA) then
  begin
   f_Stream.Read(l_Temp, cExtraLen);
   f_Stream.Seek(l_Temp, soCurrent);
  end;
  if l3TestBit(l_Header.rFlags, cFNAME) then
  repeat
   f_Stream.Read(l_Char, SizeOf(AnsiChar));
  until l_Char = #0;
  if l3TestBit(l_Header.rFlags, cFCOMMENT) then
  repeat
   f_Stream.Read(l_Char, SizeOf(AnsiChar));
  until l_Char <> #0;
  if l3TestBit(l_Header.rFlags, cFHCRC) then
   f_Stream.Read(l_Temp, cCRC16Len);
 end; // l_Header.rFlags > 0

 f_HeaderSize:= f_Stream.Position;

 f_Stream.Seek(f_Stream.Size-8, soBeginning);
 f_Stream.Read(f_CRC32, SizeOf(f_CRC32));
 f_Stream.Read(f_OriginalSize, SizeOf(f_OriginalSize));

 f_Size := f_Stream.Size - f_HeaderSize - 8 {crc32 + original size};
 Seek(0, soBeginning);
end;

procedure Tl3GZipProxyStream.Cleanup;
begin
 l3Free(f_Stream);
 inherited;
end;

function Tl3GZipProxyStream.GetSize: Int64;
begin
 Result := f_Size;
end;

function Tl3GZipProxyStream.Read(var Buffer; Count: Longint): Longint;
var
 l_NewPosition : Int64;
 l_BytesToRead : Longint;
begin
 l_NewPosition := f_Position + Count;
 if l_NewPosition >= f_Size then
  l_NewPosition := f_Size;

 l_BytesToRead := l_NewPosition - f_Position;

 Result := l_BytesToRead;

 if l_BytesToRead > 0 then
 begin
  l_BytesToRead:= f_Stream.Read(Buffer, l_BytesToRead);
  Inc(f_Position, l_BytesToRead);
 end;
end;

function Tl3GZipProxyStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
var
 l_RealPos: Int64;
begin
 case Origin of
  soBeginning: f_Position := Offset;
  soCurrent  : f_Position := f_Position + Offset;
  soEnd      : f_Position := f_Size - Offset;
 end;
 if f_Position < 0 then
  f_Position := 0;
 if f_Position > f_Size then
  f_Position := f_Size;
 l_RealPos := f_HeaderSize + f_Position - 1;
 if l_RealPos < f_HeaderSize then
  l_RealPos := f_HeaderSize;
 f_Stream.Seek(l_RealPos, soBeginning);
 Result := f_Position;
end;

function Tl3GZipProxyStream.Write(const Buffer; Count: Longint): Longint;
begin
 Assert(False, 'Tl3GZipProxyStream: запись не поддерживается')
end;

end.
