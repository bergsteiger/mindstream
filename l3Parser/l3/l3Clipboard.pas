unit l3Clipboard;
{* Поток для работы с буфером обмена. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Clipboard -               }
{ Начат: 16.02.2000 11:56             }
{ $Id: l3Clipboard.pas,v 1.6 2010/03/18 14:15:46 lulin Exp $ }

// $Log: l3Clipboard.pas,v $
// Revision 1.6  2010/03/18 14:15:46  lulin
// {RequestLink:197951943}.
//
// Revision 1.5  2010/02/10 19:16:59  lulin
// {RequestLink:186352297}.
//
// Revision 1.4  2001/08/29 07:01:10  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.3  2001/07/26 15:55:03  law
// - comments: xHelpGen.
//
// Revision 1.2  2000/12/15 15:18:59  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

interface

uses
  Windows,
  l3Types,
  l3Base,
  l3BaseStream,
  l3Memory
  ;

type
  Tl3ClipboardStream = class(Tl3Stream)
   {* Поток для работы с буфером обмена. }
    private
    {internal fields}
      f_ReadStream       : Tl3HMemoryStream;
      f_WriteStream      : Tl3MemoryStream;
      f_NeedCommit       : Bool;
      f_IsClipboardEmpty : Bool;
    private
    {property fields}
      f_Format : Tl3ClipboardFormat;
      f_Mode   : Tl3FileMode;
    protected
    {property methods}
      procedure pm_SetFormat(Value: Tl3ClipboardFormat);
        {-}
    protected
    {internal methods}
      procedure AppendFromClipboard;
        {-}
      procedure Commit;
        {-}
      procedure Release;
        override;
        {-}  
    public
    {public methods}
      constructor Create(aMode   : Tl3FileMode;
                         aFormat : Tl3ClipboardFormat = cf_Text;
                         aHandle : hWnd = 0);
        reintroduce;
        {* - создает поток. }
      function Seek(Offset: Longint; Origin: Word): Longint;
        override;
        {-}
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
    public
    {public properties}
      property Format: Tl3ClipboardFormat
        read f_Format
        write pm_SetFormat;
        {* - текущий формат с которым работает поток. }
      property Mode: Tl3FileMode
        read f_Mode;
        {* - режим работы потока. }  
  end;{Tl3ClipboardStream}

implementation

uses
  SysUtils
  ;

{ start class Tl3ClipboardStream }

constructor Tl3ClipboardStream.Create(aMode   : Tl3FileMode;
                                      aFormat : Tl3ClipboardFormat = cf_Text;
                                      aHandle : hWnd = 0);
  {reintroduce;}
  {-}
begin
 Win32Check(OpenClipboard(aHandle));
 inherited Create;
 f_Mode := aMode;
 f_Format := aFormat;
 if (Mode = l3_fmRead) then
  f_ReadStream := Tl3HMemoryStream.Create(GetClipboardData(Format))
 else
 begin
  f_WriteStream := Tl3MemoryStream.Create;
  AppendFromClipboard;
 end;//Mode = l3_fmRead
end;

procedure Tl3ClipboardStream.Release;
  {override;}
  {-}
begin
 Commit;
 l3Free(f_ReadStream);
 l3Free(f_WriteStream);
 inherited;
 Win32Check(CloseClipboard);
end;

procedure Tl3ClipboardStream.pm_SetFormat(Value: Tl3ClipboardFormat);
  {-}
begin
 if (f_Format <> Value) then
 begin
  Commit;
  f_Format := Value;
  if (Mode = l3_fmRead) then
  begin
   l3Free(f_ReadStream);
   f_ReadStream := Tl3HMemoryStream.Create(GetClipboardData(Format))
  end//Mode = l3_fmRead
  else
   AppendFromClipboard;
 end;//f_Format <> Value
end;

procedure Tl3ClipboardStream.AppendFromClipboard;
  {-}
var
 l_OldData : Tl3HMemoryStream;
begin
 if (Mode = l3_fmAppend) AND IsClipboardFormatAvailable(Format) then
 begin
  l_OldData := Tl3HMemoryStream.Create(GetClipboardData(Format));
  try
   f_WriteStream.CopyFrom(l_OldData, 0);
  finally
   l3Free(l_OldData);
  end;//try..finally
  f_IsClipboardEmpty := true;
 end;//Mode = l3_fmAppend
end;

procedure Tl3ClipboardStream.Commit;
  {-}
begin
 if f_NeedCommit then
 begin
  f_NeedCommit := false;
  if not f_IsClipboardEmpty then
  begin
   Win32Check(EmptyClipboard);
   f_IsClipboardEmpty := true;
  end;//not f_IsClipboardEmpty
  SetClipboardData(Format, l3System.ReleaseHandle(f_WriteStream.MemoryPool.ReleaseHandle));
  f_WriteStream.Seek(0, 0);
 end;//f_NeedCommit
end;

function Tl3ClipboardStream.Seek(Offset: Longint; Origin: Word): Longint;
  {override;}
  {-}
begin
 if (Mode = l3_fmRead) then
  Result := f_ReadStream.Seek(Offset, Origin)
 else
  Result := f_WriteStream.Seek(Offset, Origin)
end;

function Tl3ClipboardStream.Read(var Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 if (Mode = l3_fmRead) then
  Result := f_ReadStream.Read(Buffer, Count)
 else
  Result := f_WriteStream.Read(Buffer, Count)
end;

function Tl3ClipboardStream.Write(const Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 if (Mode = l3_fmRead) then
  raise Exception.Create('Нельзя писать напрямую в Clipboard')
  {Result := f_ReadStream.Write(Buffer, Count)}
 else
 begin
  f_NeedCommit := true;
  Result := f_WriteStream.Write(Buffer, Count);
 end;//Mode = l3_fmRead
end;

end.

