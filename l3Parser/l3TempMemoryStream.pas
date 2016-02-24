unit l3TempMemoryStream;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3TempMemoryStream -        }
{ Начат: 25.06.2003 14:42             }
{ $Id: l3TempMemoryStream.pas,v 1.3 2006/01/17 09:23:22 narry Exp $ }

// $Log: l3TempMemoryStream.pas,v $
// Revision 1.3  2006/01/17 09:23:22  narry
// - исправление: размер буфера по умолчанию 1 Мб
//
// Revision 1.2  2003/06/25 11:18:22  law
// - bug fix: неправильно проверялось достижение максимального размера.
//
// Revision 1.1  2003/06/25 11:14:27  law
// - new unit: l3TempMemoryStream - содержит класс Tl3TempMemoryStream - потокв памяти, который имеет ограничение на размер, после достижения которого все данные вымещаются во временный файл.
//

{$I l3Define.inc }

interface

uses
  Classes,
  
  l3Types,
  l3Base,
  l3BaseStream,
  l3Memory,
  l3Stream
  ;

const
  cMaxTempMemoryStreamSize = 1024 * 1024;
    
type
  Tl3TempMemoryStream = class(Tl3Stream)
    private
    // internal fields
      f_MaxSize : Long;
      f_Mem     : Tl3MemoryStream;
      f_File    : Tl3TempFileStream;
    protected
    // internal methods
      procedure Release;
        override;
        {-}
    public
    // public methods
      constructor Create(aMaxSize : Long = cMaxTempMemoryStreamSize);
        reintroduce;
        {-}
      function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
        override;
        {-}
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
  end;//Tl3TempMemoryStream

implementation

// start class Tl3TempMemoryStream

constructor Tl3TempMemoryStream.Create(aMaxSize : Long = cMaxTempMemoryStreamSize);
  //reintroduce;
  {-}
begin
 inherited Create;
 if (aMaxSize = 0) then
  f_MaxSize := cMaxTempMemoryStreamSize
 else
  f_MaxSize := aMaxSize;
 f_Mem := Tl3MemoryStream.Make;
end;

procedure Tl3TempMemoryStream.Release;
  //override;
  {-}
begin
 l3Free(f_Mem);
 l3Free(f_File);
 inherited;
end;

function Tl3TempMemoryStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
  //override;
  {-}
begin
 if (f_Mem = nil) then
 begin
  if (f_File = nil) then
   Result := 0
  else
   Result := f_File.Seek(Offset, Origin);
 end else
  Result := f_Mem.Seek(Offset, Origin);
end;

function Tl3TempMemoryStream.Read(var Buffer; Count: Longint): Longint;
  //override;
  {-}
begin
 if (f_Mem = nil) then
 begin
  if (f_File = nil) then
   Result := 0
  else
   Result := f_File.Read(Buffer, Count);
 end else
  Result := f_Mem.Read(Buffer, Count);
end;

function Tl3TempMemoryStream.Write(const Buffer; Count: Longint): Longint;
  //override;
  {-}
begin
 if (f_Mem = nil) then
 begin
  if (f_File = nil) then
   Result := 0
  else
   Result := f_File.Write(Buffer, Count);
 end else
 begin
  if (f_Mem.Position + Count >= f_MaxSize) then
  begin
   f_File := Tl3TempFileStream.Create;
   try
    f_File.CopyFrom(f_Mem, 0);
    l3Free(f_Mem);
    Result := f_File.Write(Buffer, Count);
   except
    l3Free(f_File);
    raise;
   end;//try..except
  end else
   Result := f_Mem.Write(Buffer, Count);
 end;//f_Mem = nil
end;

end.

