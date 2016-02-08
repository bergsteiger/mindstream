unit l3Base64;
{ $Id: l3Base64.pas,v 1.8 2013/04/19 13:08:17 lulin Exp $ }

// $Log: l3Base64.pas,v $
// Revision 1.8  2013/04/19 13:08:17  lulin
// - портируем.
//
// Revision 1.7  2012/04/27 09:57:30  fireton
// - поток некорректно перематывалс€ на начало
// - включаем пробел в список пропускаемых символов
// - AV при "неровной" исходной строке
//
// Revision 1.6  2012/04/16 14:11:01  fireton
// - выделил предка и сделал Tl3Base64StringStream, поток раскодировани€ из строки
//
// Revision 1.5  2010/08/17 11:42:30  narry
// K233013785. »з потока Base64 выбрасываютс€ #13#10
//
// Revision 1.4  2009/06/01 08:25:54  narry
// - неправильное позиционирование
//
// Revision 1.3  2009/04/23 11:25:10  fireton
// - [$145588441]. Ќеправильно вычисл€лась длина строки.
//
// Revision 1.2  2009/04/20 08:13:02  fireton
// - поток дл€ раскодировани€ Base64
//
// Revision 1.1  2009/04/16 11:48:22  fireton
// [$143396358]. ѕереносим base64 из DD в L3
//

interface

uses
 Classes,
 l3BaseStream,
 l3Interfaces;


type
 TEncodedQuartet = array[0..3] of AnsiChar;
 TDecodedTriplet = array[0..2] of Byte;

type
 // поток, умеющий раскодировать Base64
 Tl3Base64StreamPrim = class(Tl3Stream)
 private
  f_Position   : LongWord;
  f_Triplet    : TDecodedTriplet;
  f_TripletIdx : Integer;
  procedure DecodeNextTriplet;
 protected
  function GetNextByte: Byte;
  function GetResultSize: Int64; virtual; abstract;
  function GetSize: Int64; override;
  procedure ReadSourceChars(var Buffer; aCount: Integer); virtual; abstract;
  procedure SeekToBeginning; virtual; abstract;
 public
    {public methods}
  constructor Create; reintroduce;
        {* - создает подпоток. }
  function Read(var Buffer; Count: Longint): Longint; override;
        {-}
  function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
        {-}
  function Write(const Buffer; Count: Longint): Longint; override;
 end;

 Tl3Base64Stream = class(Tl3Base64StreamPrim)
 private
  f_ResSize: Longint;
  f_Source: Tl3Stream;
 protected
  function GetResultSize: Int64; override;
  procedure ReadSourceChars(var Buffer; aCount: Integer); override;
  procedure SeekToBeginning; override;
 public
  constructor Create(aStream: Tl3Stream); reintroduce;
 end;

 Tl3Base64StringStream = class(Tl3Base64StreamPrim)
 private
  f_ResSize: Longint;
  f_String: Il3CString;
  f_WStr: Tl3WString;
 protected
  function GetResultSize: Int64; override;
  procedure ReadSourceChars(var Buffer; aCount: Integer); override;
  procedure SeekToBeginning; override;
 public
  constructor Create(const aString: Il3CString); reintroduce;
 end;

function l3EncodeBase64(const inStr: AnsiString): AnsiString;
function l3DecodeBase64(const CinLine: AnsiString): AnsiString;

implementation
uses
 l3Base,
 l3String;

{$RANGECHECKS OFF}

function DecodeQuartet(const aQuartet: TEncodedQuartet; out theTriplet: TDecodedTriplet): Integer;
var
 l_C4: array[0..3] of Byte;
 I : Integer;
const
 INVALID_VALUE = 255;
begin
 Result := 0;
 l3FillChar(theTriplet, SizeOf(TDecodedTriplet));
 for I := 0 to 3 do
 begin
  case aQuartet[I] of
   '+'     : l_C4[I] := 62;
   '/'     : l_C4[I] := 63;
   '0'..'9': l_C4[I] := Ord(aQuartet[I]) - (Ord('0')-52);
   'A'..'Z': l_C4[I] := Ord(aQuartet[I]) - Ord('A');
   'a'..'z': l_C4[I] := Ord(aQuartet[I]) - (Ord('a')-26);
  else
   l_C4[I] := INVALID_VALUE;
  end;
 end;

 if (l_C4[0] = INVALID_VALUE) or (l_C4[1] = INVALID_VALUE) then
  Exit;
 theTriplet[0] := (l_C4[0] shl 2) or (l_C4[1] shr 4);
 Inc(Result);

 if l_C4[2] = INVALID_VALUE then
  Exit;
 theTriplet[1] := (l_C4[1] shl 4) or (l_C4[2] shr 2);
 Inc(Result);

 if l_C4[3] = INVALID_VALUE then
  Exit;
 theTriplet[2] := (l_C4[2] shl 6) or l_C4[3];
 Inc(Result);
end;

// может ошибатьс€ на единицу - в большую сторону, т.к. заранее неизвестен
// символ в конце base64 потока (значащий или терминатор)
function DecodedSize(aEncodedSize: Longword): Longword;
var
 l_QCount: LongWord;
begin
 l_QCount := aEncodedSize div 4;
 Result := l_QCount * 3;
 if aEncodedSize mod 4 > 0 then
  Inc(Result);
end;

function l3EncodeBase64(const inStr: AnsiString): AnsiString;

 function Encode_Byte(b: Byte): AnsiChar;
 const
  Base64Code: String[64] = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
 begin
  Result := Base64Code[(b and $3F)+1];
 end;

var
  i: Integer;
begin
 i := 1;
 Result := '';
 while i <= Length(InStr) do
 begin
  Result := Result + Encode_Byte(Byte(inStr[i]) shr 2);
  Result := Result + Encode_Byte((Byte(inStr[i]) shl 4) or (Byte(inStr[i+1]) shr 4));
  if i+1 <= Length(inStr) then
   Result := Result + Encode_Byte((Byte(inStr[i+1]) shl 2) or (Byte(inStr[i+2]) shr 6))
  else
   Result := Result + '=';
  if i+2 <= Length(inStr) then
   Result := Result + Encode_Byte(Byte(inStr[i+2]))
  else
   Result := Result + '=';
  Inc(i, 3);
 end;
end;

// Base64 decoding
function l3DecodeBase64(const CinLine: AnsiString): AnsiString;
var
 inLineIndex: Integer;
 InLineLength: Integer;
 l_Quartet : TEncodedQuartet;
 l_Triplet : TDecodedTriplet;
 l_ResPos  : Integer;
 l_Num, I  : Integer;
begin
 l_ResPos := 1;
 inLineIndex := 1;
 InLineLength := Length(CinLine);
 SetLength(Result, DecodedSize(InLineLength));

 while inLineIndex <= InLineLength do
 begin
  l_Num := InLineLength - inLineIndex + 1;
  if l_Num > 4 then
   l_Num := 4;
  l3FillChar(l_Quartet, SizeOf(l_Quartet));
  l3Move(CinLine[inLineIndex], l_Quartet, l_Num);
  Inc(inLineIndex, l_Num);
  l_Num := DecodeQuartet(l_Quartet, l_Triplet);
  l3Move(l_Triplet, Result[l_ResPos], l_Num);
  Inc(l_ResPos, l_Num);
 end;
 SetLength(Result, l_ResPos-1);
end;

constructor Tl3Base64StreamPrim.Create;
begin
 inherited Create;
 f_TripletIdx := -1;
 f_Position := 0;
end;

procedure Tl3Base64StreamPrim.DecodeNextTriplet;
var
 l_Quartet: TEncodedQuartet;
 i, j: Byte;
 l_Len: Byte;
begin
 l3FillChar(l_Quartet, SizeOf(l_Quartet));
 ReadSourceChars(l_Quartet, SizeOf(l_Quartet));
 i:= 0;
 while i <= 3 do
 begin
  while l_Quartet[i] in [#13, #10, #32] do
  begin
   if i < 3 then
    l3Move(l_Quartet[i+1], l_Quartet[i], 3-i);
   ReadSourceChars(l_Quartet[3], 1);
  end;
  Inc(i);
 end;
 DecodeQuartet(l_Quartet, f_Triplet);
 f_TripletIdx := 0;
end;

function Tl3Base64StreamPrim.GetNextByte: Byte;
begin
 if (f_TripletIdx < 0) or (f_TripletIdx > 2) then
  DecodeNextTriplet;
 Result := f_Triplet[f_TripletIdx];
 Inc(f_TripletIdx);
end;

function Tl3Base64StreamPrim.GetSize: Int64;
begin
 Result := GetResultSize;
end;

function Tl3Base64StreamPrim.Read(var Buffer; Count: Longint): Longint;
var
 l_Ptr: PByte;
 l_Size: Int64;
begin
 Result := 0;
 l_Size := GetSize;
 l_Ptr := @Buffer;
 while (Result < Count) and (f_Position < l_Size) do
 begin
  l_Ptr^ := GetNextByte;
  Inc(l_Ptr);
  Inc(Result);
  Inc(f_Position);
 end;
end;

function Tl3Base64StreamPrim.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
 if (Origin = soBeginning) and (Offset = 0) then
 begin
  Result := 0;
  f_Position := 0;
  f_TripletIdx := -1;
  SeekToBeginning;
  Exit;
 end;
 if (Origin = soCurrent) and (Offset = 0) then
 begin
  Result := f_Position;
  Exit;
 end;
 Assert(False, 'Tl3Base64StreamPrim: произвольный seek не поддерживаетс€');
end;

function Tl3Base64StreamPrim.Write(const Buffer; Count: Longint): Longint;
begin
 Assert(False, 'Tl3Base64StreamPrim: запись не поддерживаетс€');
end;

constructor Tl3Base64Stream.Create(aStream: Tl3Stream);
begin
 inherited Create;
 f_Source := aStream;
 f_ResSize := DecodedSize(f_Source.Size);
end;

function Tl3Base64Stream.GetResultSize: Int64;
begin
 Result := f_ResSize;
end;

procedure Tl3Base64Stream.ReadSourceChars(var Buffer; aCount: Integer);
begin
 f_Source.Read(Buffer, aCount);
end;

procedure Tl3Base64Stream.SeekToBeginning;
begin
 f_Source.Seek(0, soBeginning);
end;

constructor Tl3Base64StringStream.Create(const aString: Il3CString);
begin
 inherited Create;
 f_String := aString;
 f_WStr := f_String.AsWStr;
 f_ResSize := DecodedSize(f_WStr.SLen);
end;

function Tl3Base64StringStream.GetResultSize: Int64;
begin
 Result := f_ResSize;
end;

procedure Tl3Base64StringStream.ReadSourceChars(var Buffer; aCount: Integer);
var
 l_Chars: array[0..3] of AnsiChar absolute Buffer; // больше не надо, читаетс€ по 4 символа максимум
 I: Integer;
begin
 for I := 0 to aCount - 1 do
  if I < f_WStr.SLen then
   l_Chars[I] := l3Char(f_WStr, I);
 f_WStr := l3Copy(f_WStr, aCount);
end;

procedure Tl3Base64StringStream.SeekToBeginning;
begin
 f_WStr := f_String.AsWStr;
end;


{

  while (inLineIndex <= InLineLength) and (c4 < 4) do
  begin
   c := CinLine[inLineIndex];
   case c of
    '+'     : x := 62;
    '/'     : x := 63;
    '0'..'9': x := Ord(c) - (Ord('0')-52);
    '='     : x := -1;
    'A'..'Z': x := Ord(c) - Ord('A');
    'a'..'z': x := Ord(c) - (Ord('a')-26);
   else
    x := RESULT_ERROR;
   end;
   if x <> RESULT_ERROR then
   begin
    StoredC4[c4] := x;
    Inc(c4);
   end;
   Inc(inLineIndex);
  end;

  if c4 = 4 then
  begin
   c4 := 0;
   Result := Result + Char((StoredC4[0] shl 2) or (StoredC4[1] shr 4));
   if StoredC4[2] = -1 then
    Exit;
   Result := Result + Char((StoredC4[1] shl 4) or (StoredC4[2] shr 2));
   if StoredC4[3] = -1 then
    Exit;
   Result := Result + Char((StoredC4[2] shl 6) or (StoredC4[3]));
  end;
 end;
end;
}
end.