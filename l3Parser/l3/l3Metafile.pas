unit l3Metafile;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  Classes,
  Graphics,
  Windows,
  l3PureMixIns
  ;

type
 _l3Unknown_Parent_ = TMetafile;
 {$Include ..\L3\l3Unknown.imp.pas}
 Tl3Metafile = class(_l3Unknown_)
  {* Метафайл }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 public
 // public methods
   procedure LoadWMFFromStream(Stream: TStream);
   class function TryMakeFromStream(Stream: TStream): Tl3Metafile;
   procedure LoadFromIStream(const aStream: IStream);
   procedure SaveToIStream(const aStream: IStream);
 end;//Tl3Metafile

implementation

uses
  Consts,
  l3MetafileHeader,
  l3Stream,
  SysUtils,
  l3Base,
  l3Core,
  l3MemUtils,
  l3Interlocked
  ;

{$Include ..\L3\l3Unknown.imp.pas}

type
  THackMetafile = class(TGraphic)
  private
  // private fields
   FImage : TMetafileImage;
  end;//THackMetafile

  THackSharedImage = class(TSharedImage)
  end;//THackSharedImage

  THackImage = class(TSharedImage)
  private
  // private fields
   FHandle : HENHMETAFILE;
   FWidth : Integer;
   FHeight : Integer;
   FPalette : HPALETTE;
   FInch : Word;
  end;//THackImage

// start class Tl3Metafile

procedure Tl3Metafile.LoadWMFFromStream(Stream: TStream);
//#UC START# *54BE0C4402DE_47DFD79200BD_var*
const
 l3HundredthMMPerInch = 2540;
var
 l_MFP      : TMetaFilePict;
 l_WMF      : Tl3MetafileHeader;
 l_Length   : LongInt;
 l_BitMem   : Pointer;
 l_EMFHeader: TEnhMetaheader;
 l_HackImage: THackImage;
//#UC END# *54BE0C4402DE_47DFD79200BD_var*
begin
//#UC START# *54BE0C4402DE_47DFD79200BD_impl*
 Clear; // Вызов NewImage...
 l_Length := Stream.Size - Stream.Position;
 Stream.Read(l_WMF, SizeOf(l_WMF));
 Dec(l_Length, SizeOf(Tl3MetafileHeader));
 GetMem(l_BitMem, l_Length);
 l_HackImage := THackImage(THackMetafile(Self).FImage);
 try
  Stream.Read(l_BitMem^, l_Length);
  if l_WMF.Inch = 0 then
   l_WMF.Inch := 96;
  l_HackImage.FInch := l_WMF.Inch;
  l_HackImage.FWidth := MulDiv(l_WMF.Box.Right - l_WMF.Box.Left, l3HundredthMMPerInch, l_HackImage.FInch);
  l_HackImage.FHeight := MulDiv(l_WMF.Box.Bottom - l_WMF.Box.Top, l3HundredthMMPerInch, l_HackImage.FInch);
  with l_MFP do
  begin
   MM := MM_ANISOTROPIC;
   xExt := 0;
   yExt := 0;
   hmf := 0;
  end; // with l_MFP do
  l_HackImage.FHandle := SetWinMetaFileBits(l_Length, l_BitMem, 0, l_MFP);
  if l_HackImage.FHandle = 0 then
   raise EInvalidGraphic.CreateRes(@SInvalidMetafile);
  // Get the maximum extent actually used by the metafile output
  // and re-convert the WMF data using the new extents.
  // This helps preserve whitespace margins in l_WMFs
  GetEnhMetaFileHeader(l_HackImage.FHandle, Sizeof(l_EMFHeader), @l_EMFHeader);
  with l_MFP, l_EMFHeader.rclFrame do
  begin
   MM := MM_ANISOTROPIC;
   xExt := MulDiv(l_HackImage.FWidth, l_HackImage.FInch, l3HundredthMMPerInch);
   yExt := MulDiv(l_HackImage.FHeight, l_HackImage.FInch, l3HundredthMMPerInch);
   hmf := 0;
  end; // with l_MFP, l_EMFHeader.rclFrame do
  DeleteEnhMetafile(l_HackImage.FHandle);
  l_HackImage.FHandle := SetWinMetaFileBits(l_Length, l_BitMem, 0, l_MFP);
  if l_HackImage.FHandle = 0 then
   raise EInvalidGraphic.CreateRes(@SInvalidMetafile);
  Enhanced := False;
 finally
  Freemem(l_BitMem, l_Length);
 end;
 PaletteModified := Palette <> 0;
 Changed(Self);
//#UC END# *54BE0C4402DE_47DFD79200BD_impl*
end;//Tl3Metafile.LoadWMFFromStream

class function Tl3Metafile.TryMakeFromStream(Stream: TStream): Tl3Metafile;
//#UC START# *54BE147D004B_47DFD79200BD_var*

 function lp_TestEMF(Stream: TStream): Boolean;
 var
   Size: Longint;
   Header: TEnhMetaHeader;
 begin
   Size := Stream.Size - Stream.Position;
   if Size > Sizeof(Header) then
   begin
     Stream.Read(Header, Sizeof(Header));
     Stream.Seek(-Sizeof(Header), soFromCurrent);
   end;
   Result := (Size > Sizeof(Header)) and
     (Header.iType = EMR_HEADER) and (Header.dSignature = ENHMETA_SIGNATURE);
 end;

var
 l_WMF: Tl3MetafileHeader;
//#UC END# *54BE147D004B_47DFD79200BD_var*
begin
//#UC START# *54BE147D004B_47DFD79200BD_impl*
 Result := nil;
 Stream.Seek(0, soBeginning);
 if lp_TestEMF(Stream) then
 begin
  Result := Tl3MetaFile.Create;
  Result.ReadEMFStream(Stream);
 end; // if TestEMF(Stream) then
//#UC END# *54BE147D004B_47DFD79200BD_impl*
end;//Tl3Metafile.TryMakeFromStream

procedure Tl3Metafile.LoadFromIStream(const aStream: IStream);
//#UC START# *47E14DD00013_47DFD79200BD_var*
var
 l_Stream : TStream;
//#UC END# *47E14DD00013_47DFD79200BD_var*
begin
//#UC START# *47E14DD00013_47DFD79200BD_impl*
 l3IStream2Stream(aStream, l_Stream);
 try
  LoadFromStream(l_Stream);
 finally
  FreeAndNil(l_Stream);
 end;//try..finally
//#UC END# *47E14DD00013_47DFD79200BD_impl*
end;//Tl3Metafile.LoadFromIStream

procedure Tl3Metafile.SaveToIStream(const aStream: IStream);
//#UC START# *47E14DE302A3_47DFD79200BD_var*
var
 l_Stream : TStream;
//#UC END# *47E14DE302A3_47DFD79200BD_var*
begin
//#UC START# *47E14DE302A3_47DFD79200BD_impl*
 l3IStream2Stream(aStream, l_Stream);
 try
  SaveToStream(l_Stream);
 finally
  FreeAndNil(l_Stream);
 end;//try..finally
//#UC END# *47E14DE302A3_47DFD79200BD_impl*
end;//Tl3Metafile.SaveToIStream

procedure Tl3Metafile.Cleanup;
//#UC START# *479731C50290_47DFD79200BD_var*
//#UC END# *479731C50290_47DFD79200BD_var*
begin
//#UC START# *479731C50290_47DFD79200BD_impl*
 THackSharedImage(THackMetafile(Self).FImage).Release;
 THackMetafile(Self).FImage := nil;
 inherited;
//#UC END# *479731C50290_47DFD79200BD_impl*
end;//Tl3Metafile.Cleanup

{$If not defined(DesignTimeLibrary)}
class function Tl3Metafile.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_47DFD79200BD_var*
//#UC END# *47A6FEE600FC_47DFD79200BD_var*
begin
//#UC START# *47A6FEE600FC_47DFD79200BD_impl*
 Result := true;
//#UC END# *47A6FEE600FC_47DFD79200BD_impl*
end;//Tl3Metafile.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.