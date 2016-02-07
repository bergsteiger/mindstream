unit l3ImageUtils;

{ $Id: l3ImageUtils.pas,v 1.16 2015/08/07 12:15:55 lulin Exp $ }

// $Log: l3ImageUtils.pas,v $
// Revision 1.16  2015/08/07 12:15:55  lulin
// - делаем консольную запускалку.
//
// Revision 1.15  2015/04/09 09:11:23  fireton
// - выпиливаем TMetafileHeader в отдельный модуль
//
// Revision 1.14  2015/01/19 12:42:26  dinishev
// {Requestlink:586350815}
//
// Revision 1.13  2014/08/21 11:13:33  lulin
// - чиним библиотеки.
//
// Revision 1.12  2014/07/11 10:46:01  lulin
// - чистим код.
//
// Revision 1.11  2014/07/10 17:01:20  lulin
// {RequestLink:543448591}
//
// Revision 1.10  2014/07/10 15:19:36  lulin
// {RequestLink:543448591}
//
// Revision 1.9  2014/05/26 12:34:03  dinishev
// Bug fix: использовался Integer вместо Cardinal
//
// Revision 1.8  2014/05/16 09:29:09  dinishev
// Возможность задавать точность сравнения картинок "вручную".
//
// Revision 1.7  2014/05/16 09:20:30  dinishev
// Возможность задавать точность сравнения картинок "вручную".
//
// Revision 1.6  2014/05/07 14:11:29  dinishev
// Удочерил ScreenShot из JEDI, чтобы не тянуть кучу зависимостей во все проекты.
//
// Revision 1.5  2014/04/15 10:26:36  dinishev
// Доточил поддержку сравнения emf и wmf.
//
// Revision 1.4  2014/02/19 09:21:16  dinishev
// {Requestlink:481811059}.Переименовал процедуру.
//
// Revision 1.3  2014/02/19 08:52:39  dinishev
// {Requestlink:481811059}
//
// Revision 1.2  2010/12/10 18:29:45  lulin
// {RequestLink:245761273}.
//
// Revision 1.1  2010/10/15 14:01:57  fireton
// - строим дифу картинок
//

interface

uses
 Windows,
 Classes,
 Graphics,
 ActiveX
 ;


type
 Tl3CompareImageResult = (l3_rImagesEqual, l3_rImagesDissimilar, l3_rError);

{$IfNDef DesignTimeLibrary}
function l3IsImageEqual(const aFirst: AnsiString; const aSecond: AnsiString; const aDiff: AnsiString): Tl3CompareImageResult;
{$EndIf  DesignTimeLibrary}
procedure l3ShowDiffImage(const aDiff: AnsiString);
procedure l3MakeScreenShot(aBitmap: TBitmap; aLeft, aTop, aWidth, aHeight: Integer; aHandle: THandle);
procedure l3BuildComparisonImage(const aEtalonFN, aTestFN, aResultFN: string);
procedure l3SetFuzzValueInPercent(aValue: Integer);

procedure l3BitmapToAlphaPNG(aBitmap: TBitmap; aDest: TStream); overload;
procedure l3BitmapToAlphaPNG(aBitmap: TBitmap; aDest: IStream); overload;

// Поддержка WMF
const
 l3DefaultWMFDPI = 1440;

function l3IsValidMETA_HEADERRecord(const aHeader: TMetaHeader): Boolean;

implementation

uses
 {$IfNDef DesignTimeLibrary}
 JclMiscel,
 {$EndIf  DesignTimeLibrary}

 l3Base,

 SysUtils,
 m2memlib,
 {$IfNDef NoImageEn}
 hyiedefs,
 hyieutils,
 imageenio,
 imageenproc,
 {$EndIf  NoImageEn}
 l3Memory,

 l3Stream
 ;

const
 cnDefFuzzValueInPercent = 3;

var
 g_FuzzValueInPercent: Integer = cnDefFuzzValueInPercent;

procedure l3SetFuzzValueInPercent(aValue: Integer);
begin
 if (aValue < 0) or (aValue > 100) then
  g_FuzzValueInPercent := cnDefFuzzValueInPercent
 else
  g_FuzzValueInPercent := aValue;
end;

procedure l3ShowDiffImage(const aDiff: AnsiString);
var
  l_Params: AnsiString;
begin
 if FileExists(aDiff) then
 begin
  l_Params := Format('imdisplay "%s"', [aDiff]);
  WinExec(PAnsiChar(l_Params), SW_SHOWNORMAL);
 end; // if FileExists(aDiff) then
end;

{$IfNDef DesignTimeLibrary}
function l3IsImageEqual(const aFirst: AnsiString; const aSecond: AnsiString; const aDiff: AnsiString): Tl3CompareImageResult;

 function lp_CheckFileExt: AnsiString;
 // ImageMagic поддерживет запись не всех форматов!
 var
  l_Ext: AnsiString;
 begin
  l_Ext := ExtractFileExt(aDiff);
  if (l_Ext = '.emf') or (l_Ext = '.wmf') then
   Result := ChangeFileExt(aDiff, '.png')
  else
   Result := aDiff;
 end;

const
 csCompareCommand = 'compare -metric AE -fuzz ';
 csParams = '%d%s %s %s %s';
var
 l_Code       : Cardinal;
 l_CommandLine: AnsiString;
begin
 l_CommandLine := csCompareCommand + Format(csParams, [g_FuzzValueInPercent, '%', aFirst, aSecond, lp_CheckFileExt]);
 l_Code := WinExec32AndWait(l_CommandLine, {STARTF_USESHOWWINDOW}SW_HIDE);
 Assert(l_Code <= Ord(High(Tl3CompareImageResult)));
 Result := Tl3CompareImageResult(l_Code);
end;
{$EndIf DesignTimeLibrary}

{$IfNDef NoImageEn}
function MergeRGB(const aRGB1, aRGB2: TRGB): TRGB;
const
 C1 = 0.8;
 C2 = 0.2;
begin
 Result.r := blimit(Round(aRGB1.r*C1 + aRGB2.r*C2));
 Result.g := blimit(Round(aRGB1.g*C1 + aRGB2.g*C2));
 Result.b := blimit(Round(aRGB1.b*C1 + aRGB2.b*C2));
end;
{$EndIf NoImageEn}                                                          

procedure l3BuildComparisonImage(const aEtalonFN, aTestFN, aResultFN: string);
{$IfNDef NoImageEn}
var
 l_IO : TImageEnIO;
 l_Etalon : TIEBitmap;
 l_Test   : TIEBitmap;
 l_CheckWidth, l_CheckHeight : Integer;
 l_Red: TRGB;
 I, J : Integer;
 l_E: TRGB;
 l_T: TRGB;
 l_RH, l_RS, l_RL : Double;
 l_EH, l_ES, l_EL : Double;
 l_TH, l_TS, l_TL : Double;
{$EndIf NoImageEn}
begin
 {$IfNDef NoImageEn}
 l_Etalon := TIEBitmap.Create;
 try
  l_Test := TIEBitmap.Create;
  try
   l_IO := TImageEnIO.Create(nil);
   try
    l_IO.AttachedIEBitmap := l_Etalon;
    l_IO.LoadFromFile(aEtalonFN);
    l_IO.AttachedIEBitmap := l_Test;
    l_IO.LoadFromFile(aTestFN);
   finally
    FreeAndNil(l_IO);
   end;
   l_Etalon.PixelFormat := ie24RGB;
   l_Test.PixelFormat := ie24RGB;

   if l_Etalon.Width < l_Test.Width then
   begin
    l_CheckWidth := l_Etalon.Width;
    l_Etalon.Width := l_Test.Width;
    l_Etalon.FillRect(l_CheckWidth, 0, l_Etalon.Width-1, l_Etalon.Height-1, clRed);
   end
   else
    if l_Etalon.Width > l_Test.Width then
    begin
     l_CheckWidth := l_Test.Width;
     l_Etalon.FillRect(l_CheckWidth, 0, l_Etalon.Width-1, l_Etalon.Height-1, clYellow);
    end
    else
     l_CheckWidth := l_Etalon.Width;

   if l_Etalon.Height < l_Test.Height then
   begin
    l_CheckHeight := l_Etalon.Height;
    l_Etalon.Height := l_Test.Height;
    l_Etalon.FillRect(0, l_CheckHeight, l_Etalon.Width-1, l_Etalon.Height-1, clRed);
   end
   else
    if l_Etalon.Height > l_Test.Height then
    begin
     l_CheckHeight := l_Test.Height;
     l_Etalon.FillRect(0, l_CheckHeight, l_Etalon.Width-1, l_Etalon.Height-1, clYellow);
    end
    else
     l_CheckHeight := l_Etalon.Height;

    l_Red.r := 255;
    l_Red.g := 0;
    l_Red.b := 0;

    RGB2HSL(l_Red, l_RH, l_RS, l_RL);

    for I := 0 to l_CheckWidth - 1 do
     for J := 0 to l_CheckHeight - 1 do
     begin
      l_E := l_Etalon.Pixels_ie24RGB[I, J];
      l_T := l_Test.Pixels_ie24RGB[I, J];
      if m2MEMCompare(@l_E, @l_T, SizeOf(TRGB)) <> 0  then
      begin

       RGB2HSL(l_E, l_EH, l_ES, l_EL);
       RGB2HSL(l_E, l_TH, l_TS, l_TL);
       {
       if l_EL > l_TL then
        HSL2RGB(l_E, l_RH, l_ES, l_EL)
       else
        HSL2RGB(l_E, l_RH, l_TS, l_RL);
       }
       if l_EL > l_TL then
        l_Etalon.Pixels_ie24RGB[I, J] := MergeRGB(l_E, l_Red)
       else
        l_Etalon.Pixels_ie24RGB[I, J] := MergeRGB(l_T, l_Red);
      end;
     end;

    l_IO := TImageEnIO.Create(nil);
    try
     l_IO.AttachedIEBitmap := l_Etalon;
     l_IO.SaveToFilePNG(aResultFN);
    finally
     FreeAndNil(l_IO);
    end;

  finally
   FreeAndNil(l_Test);
  end;
 finally
  FreeAndNil(l_Etalon);
 end;
 {$Else  NoImageEn}
 Assert(false);
 {$EndIf NoImageEn}
end;

procedure l3MakeScreenShot(aBitmap: TBitmap; aLeft, aTop, aWidth, aHeight: Integer; aHandle: THandle);
var
 l_Pal  : TMaxLogPalette;
 l_WinDC: HDC;
begin
 aBitmap.Width := aWidth;
 aBitmap.Height := aHeight; 
 // Get the HDC of the window...
 l_WinDC := GetDC(aHandle);
 try
  if l_WinDC = 0 then
   raise EInvalidGraphicOperation.Create('Неправильный HDC!');
  // Palette-device?
  if (GetDeviceCaps(l_WinDC, RASTERCAPS) and RC_PALETTE) = RC_PALETTE then
  begin
   l3FillChar(l_Pal, SizeOf(TMaxLogPalette));  // fill the structure with zeros
   l_Pal.palVersion := $300;                     // fill in the palette version
   // grab the system palette entries...
   l_Pal.palNumEntries := GetSystemPaletteEntries(l_WinDC, 0, 256, l_Pal.palPalEntry);
   if l_Pal.PalNumEntries <> 0 then
    aBitmap.Palette := CreatePalette(PLogPalette(@l_Pal)^);
  end; // if (GetDeviceCaps(l_WinDC, RASTERCAPS) and RC_PALETTE) = RC_PALETTE then
  // copy from the screen to our bitmap...
  BitBlt(aBitmap.Canvas.Handle, 0, 0, aWidth, aHeight, l_WinDC, aLeft, aTop, SRCCOPY);
 finally
  ReleaseDC(aHandle, l_WinDC);        // finally, relase the DC of the window
 end;
end;

procedure l3BitmapToAlphaPNG(aBitmap: TBitmap; aDest: TStream);
{$IfNDef NoImageEn}
var
 l_Stream : Tl3MemoryStream;
 {I, }J, K  : Integer;
const
 c_ColWhite: TRGB = (b:255; g:255; r:255);
{$EndIf  NoImageEn}
begin
 {$IfNDef NoImageEn}
 l_Stream := Tl3MemoryStream.Create;
 try
  aBitmap.SaveToStream(l_Stream);
  l_Stream.Seek(0, 0);
  with TImageEnIO.Create(nil) do
  try
   LoadFromStreamBMP(l_Stream);
   l_Stream.Seek(0, 0);
   l_Stream.Size:= 0;

   // создаём альфа-канал. это совершенно дикий код. потому что НАДО рисовать формулы
   // уже с альфа-каналом, но с нахрапа так сделать не получилось, поэтому тут вот это говно.
   IEBitmap.CreateAlphaChannel;
   for J := 0 to IEBitmap.Width - 1 do
    for K := 0 to IEBitmap.Height - 1 do
     if EqualRGB(IEBitmap.Pixels[J,K], c_ColWhite) then
      IEBitmap.Alpha[J,K] := 0
     else
      IEBitmap.Alpha[J,K] := 255;

   SaveToStreamPNG(aDest);
   //l_Stream.Seek(0, 0);
  finally
   Free;
  end;
 finally
  FreeAndNil(l_Stream);
 end;//try..finally
 {$Else  NoImageEn}
 Assert(false);
 {$EndIf NoImageEn}
end;

procedure l3BitmapToAlphaPNG(aBitmap: TBitmap; aDest: IStream);
var
 l_Stream : TStream;
begin
 l3IStream2Stream(aDest, l_Stream);
 try
  l3BitmapToAlphaPNG(aBitmap, l_Stream);
 finally
  FreeAndNil(l_Stream);
 end;//try..finally
end;

function l3IsValidMETA_HEADERRecord(const aHeader: TMetaHeader): Boolean;

 function lp_ChectWMFType: Boolean;
 const
  cnMemoyMetaFile = 1;
  cnDiskMetaFile = 2;
 begin
  Result := (aHeader.mtType = cnMemoyMetaFile) or (aHeader.mtType = cnDiskMetaFile);
 end;

 function lp_ChectWMFVersion: Boolean;
 const
  cnMETAVERSION100 = 256; // 0x0100
  cnMETAVERSION300 = 768; // 0x0300
 begin
  Result := (aHeader.mtVersion = cnMETAVERSION100) or (aHeader.mtVersion = cnMETAVERSION300);
 end;

begin
 Result := lp_ChectWMFType and lp_ChectWMFVersion;
end;

end.
