unit l3DataObject;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3InternalInterfaces,
  l3StringList,
  l3LongintList,
  l3SimpleObject,
  ActiveX,
  Windows
  ;

type
 Tl3DataObject = class(Tl3SimpleObject, IDataObject, Il3DragImageSource)
  {* Базовый класс для работы с IDataObject. }
 private
 // private fields
   f_DragBitmap : Il3Bitmap;
   f_FilesNames : Tl3StringList;
   f_Formats : Tl3LongintList;
    {* Поле для свойства Formats}
 protected
 // realized methods
   function Image: Il3Bitmap;
   function GetData(const formatetcIn: TFormatEtc;
    out medium: TStgMedium): HResult; stdcall;
   function GetDataHere(const formatetc: TFormatEtc;
    out medium: TStgMedium): HResult; stdcall;
   function QueryGetData(const formatetc: TFormatEtc): HResult; stdcall;
   function GetCanonicalFormatEtc(const formatetc: TFormatEtc;
    out formatetcOut: TFormatEtc): HResult; stdcall;
   function SetData(const formatetc: TFormatEtc;
    var medium: TStgMedium;
    fRelease: BOOL): HResult; stdcall;
   function EnumFormatEtc(dwDirection: Integer;
    out enumFormatEtc: IEnumFormatEtc): HResult; stdcall;
   function DAdvise(const formatetc: TFormatEtc;
    advf: Integer;
    const advSink: IAdviseSink;
    out dwConnection: Integer): HResult; stdcall;
   function DUnadvise(dwConnection: Integer): HResult; stdcall;
   function EnumDAdvise(out enumAdvise: IEnumStatData): HResult; stdcall;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 protected
 // protected methods
   function DoGetData(const aFormatEtcIn: TFormatEtc;
    var medium: Tl3StoragePlace): HResult; virtual;
   function DoGetDataHere(const aFormatEtcIn: TFormatEtc;
    const medium: Tl3StoragePlace): HResult; virtual;
   procedure WriteFilesAndSetNames(aNames: Tl3StringList); virtual;
   function Bitmap: Il3Bitmap; virtual;
   procedure CheckFormats;
   function DoQueryGetData(const aFormatEtc: TFormatEtc): HResult; virtual;
   procedure SetDragBitmap(const aBitmap: Il3Bitmap);
 public
 // public methods
   constructor Create(const aFormats: Tl3ClipboardFormats); reintroduce;
   function AcceptableTymed: Integer; virtual;
 public
 // public properties
   property Formats: Tl3LongintList
     read f_Formats;
 end;//Tl3DataObject

implementation

uses
  l3DataObjectEnum,
  l3Base,
  SysUtils,
  ShlObj
  ;

// start class Tl3DataObject

constructor Tl3DataObject.Create(const aFormats: Tl3ClipboardFormats);
//#UC START# *48F340C901DE_4680F5AA0274_var*
var
 l_Index : Integer;
//#UC END# *48F340C901DE_4680F5AA0274_var*
begin
//#UC START# *48F340C901DE_4680F5AA0274_impl*
 inherited Create;
 f_Formats := Tl3LongintList.Make;
 for l_Index := Low(aFormats) to High(aFormats) do
  f_Formats.Add(aFormats[l_Index]);
 if (Win32Platform <> VER_PLATFORM_WIN32_NT) AND
    (f_Formats.Count > 0) AND (f_Formats.IndexOf(CF_Locale) < 0) then
   f_Formats.Add(CF_Locale);
//#UC END# *48F340C901DE_4680F5AA0274_impl*
end;//Tl3DataObject.Create

function Tl3DataObject.DoGetData(const aFormatEtcIn: TFormatEtc;
  var medium: Tl3StoragePlace): HResult;
//#UC START# *48F3495D0398_4680F5AA0274_var*
const
 c_Inch = 2540;
var
 l_HObject        : HGLOBAL;
 l_Index          : Integer;
 l_Size           : Integer;
 l_pChar          : PAnsiChar;
 l_pDropFiles     : PDropFiles;
 l_Format         : Word;
 l_Data           : THandle;
 l_Palette        : HPALETTE;
 l_HMetafile      : HMETAFILE;
 l_Canvas         : Il3Canvas;
 l_Bmp            : Il3Bitmap;
 l_DC             : hDC;
//#UC END# *48F3495D0398_4680F5AA0274_var*
begin
//#UC START# *48F3495D0398_4680F5AA0274_impl*
 Result := S_Ok;
 with aFormatEtcIn do
  if (cfFormat = CF_HDROP) and ((tymed and TYMED_HGLOBAL) <> 0) then
  begin
   medium.tymed := TYMED_HGLOBAL;
   if (f_FilesNames = nil) then
   begin
    f_FilesNames := Tl3StringList.Make;
    WriteFilesAndSetNames(f_FilesNames);
   end;//f_FilesNames = nil
   if (f_FilesNames.Count > 0) then
   begin
    l_Size := sizeof(TDropFiles) + 1;//+завершающий байт
    for l_Index := 0 to f_FilesNames.Count - 1 do
      l_Size := l_Size + f_FilesNames[l_Index].AsWStr.SLen + 1;//длина каждой строки, плюс 1 байт
    l_HObject := GlobalAlloc(GMEM_SHARE or GMEM_MOVEABLE or GMEM_ZEROINIT, l_Size);
    try
     if (l_HObject <> 0) then
     begin
      l_pDropFiles := GlobalLock(l_HObject);
      try
       l_pDropFiles.pFiles := sizeof(TDropFiles);
       GetCursorPos(l_pDropFiles.pt);
       l_pDropFiles.fNC := true;
       l_pDropFiles.fWide := false;
       l_pChar := PAnsiChar(l_pDropFiles) + l_pDropFiles.pFiles;
       for l_Index := 0 to f_FilesNames.Count - 1 do
       begin
        StrCopy(l_pChar, f_FilesNames[l_Index].AsWStr.S);
        l_pChar := l_pChar + (f_FilesNames[l_Index].AsWStr.SLen + 1);
       end;//for l_Index
      finally
       GlobalUnlock(l_HObject);
      end;//try..finally
      medium.hGlobal := l_HObject;
     end;//l_HObject <> 0
    except
     GlobalFree(l_HObject);
     Result := E_OutOfMemory;
    end;//try..except
   end;//f_FilesNames.Count > 0
   if medium.hGlobal = 0 then
     Result := DV_E_FORMATETC;
  end//cfFormat = CF_HDROP..
  else
  begin
   l_Bmp := Bitmap;
   if (l_Bmp <> nil) then
   begin
    if (cfFormat = CF_BITMAP) and ((tymed and (TYMED_HGLOBAL or TYMED_GDI)) <> 0) then
    begin
     medium.tymed := TYMED_GDI;
     l_Format := cfFormat;
     l_Bmp.SaveToClipboardFormat(l_Format, l_Data, l_Palette);
     medium.hGlobal := l_Data;
    end//cfFormat = CF_BITMAP..
(*    else
    if (cfFormat = CF_METAFILEPICT) and ((tymed and (TYMED_HGLOBAL or TYMED_MFPICT)) <> 0) then
    begin
     //medium.tymed := TYMED_HGLOBAL;
     medium.tymed := TYMED_MFPICT;
     l_DC := CreateMetafile(nil);
     try
      l_Canvas := Tl3OldMFCanvas.Make;
      try
       SetMapMode(l_DC, MM_ANISOTROPIC);
       SetWindowOrgEx(l_DC, 0, 0, nil);
       SetWindowExtEx(l_DC, l_Bmp.Width, l_Bmp.Height, nil);
       l_Canvas.DC := l_DC;
       l_Canvas.BeginPaint;
       try
        l_Canvas.DrawEnabled := true;
        //l_Canvas.ClipRect := l_Canvas.DR2LR(l3SRect(0, 0, l_Bmp.Width, l_Bmp.Height));
        l_Bmp.StretchDraw(l3Rect(0,0, l_Bmp.InchWidth, l_Bmp.InchHeight), l_Canvas);
        //l_Canvas.TextOut(l3Point0, l3PCharLen('Test'));
       finally
        l_Canvas.EndPaint;
       end;//try..finally
      finally
       l_Canvas := nil;
      end;//try..finally
     finally
      l_HMetafile := CloseMetafile(l_DC);
     end;//try..finally
     l_HObject := GlobalAlloc(GMEM_MOVEABLE, sizeof(METAFILEPICT));
     try
      with PMetafilePict(GlobalLock(l_HObject))^ do
      begin
       mm := MM_ANISOTROPIC;
       //mm := MM_ISOTROPIC;
       hMF := l_HMetafile;
       xExt := l_Bmp.Width * c_Inch div Screen.PixelsPerInch;//mm*100
       yExt := l_Bmp.Height * c_Inch div Screen.PixelsPerInch;
      end;//PMetafilePict(GlobalLock(l_HObject))^
      GlobalUnlock(l_HObject);
      medium.hGlobal := l_HObject;
     except
      GlobalFree(l_HObject);
      Result := E_OutOfMemory;
     end;//try..except
    end///cfFormat = CF_METAFILEPICT*)
    else
    if ((cfFormat = CF_ENHMETAFILE)) and ((tymed and (TYMED_HGLOBAL or TYMED_MFPICT)) <> 0) then
    begin
     medium.tymed := TYMED_MFPICT;
     l_Format := cfFormat;
     l_Bmp.SaveToClipboardFormat(l_Format, l_Data, l_Palette);
     medium.hGlobal := l_Data;
    end//cfFormat = CF_ENHMETAFILE
    else
     Result := DV_E_FORMATETC;
   end//l_Bmp <> nil
   else
    Result := DV_E_FORMATETC;
  end;//cfFormat = CF_HDROP..
//#UC END# *48F3495D0398_4680F5AA0274_impl*
end;//Tl3DataObject.DoGetData

function Tl3DataObject.DoGetDataHere(const aFormatEtcIn: TFormatEtc;
  const medium: Tl3StoragePlace): HResult;
//#UC START# *48F349AE00F1_4680F5AA0274_var*
//#UC END# *48F349AE00F1_4680F5AA0274_var*
begin
//#UC START# *48F349AE00F1_4680F5AA0274_impl*
 Result := DV_E_FORMATETC;
//#UC END# *48F349AE00F1_4680F5AA0274_impl*
end;//Tl3DataObject.DoGetDataHere

procedure Tl3DataObject.WriteFilesAndSetNames(aNames: Tl3StringList);
//#UC START# *48F3504301B7_4680F5AA0274_var*
//#UC END# *48F3504301B7_4680F5AA0274_var*
begin
//#UC START# *48F3504301B7_4680F5AA0274_impl*
//#UC END# *48F3504301B7_4680F5AA0274_impl*
end;//Tl3DataObject.WriteFilesAndSetNames

function Tl3DataObject.Bitmap: Il3Bitmap;
//#UC START# *48F350F802F7_4680F5AA0274_var*
//#UC END# *48F350F802F7_4680F5AA0274_var*
begin
//#UC START# *48F350F802F7_4680F5AA0274_impl*
 Result := f_DragBitmap;
//#UC END# *48F350F802F7_4680F5AA0274_impl*
end;//Tl3DataObject.Bitmap

function Tl3DataObject.AcceptableTymed: Integer;
//#UC START# *48F351BE0015_4680F5AA0274_var*
//#UC END# *48F351BE0015_4680F5AA0274_var*
begin
//#UC START# *48F351BE0015_4680F5AA0274_impl*
 Result := TYMED_NULL;
 if (Bitmap <> nil) then
  Result := Result or TYMED_HGLOBAL or TYMED_GDI or TYMED_MFPICT
//#UC END# *48F351BE0015_4680F5AA0274_impl*
end;//Tl3DataObject.AcceptableTymed

procedure Tl3DataObject.CheckFormats;
//#UC START# *48F351EB00E1_4680F5AA0274_var*
//#UC END# *48F351EB00E1_4680F5AA0274_var*
begin
//#UC START# *48F351EB00E1_4680F5AA0274_impl*
 if (Bitmap = nil) then
 begin
  f_Formats.Remove(CF_BITMAP);
  f_Formats.Remove(CF_METAFILEPICT);
  f_Formats.Remove(CF_ENHMETAFILE);
 end//Bitmap = nil
 else
 begin
  if (f_Formats.IndexOf(CF_BITMAP) < 0) then
   f_Formats.Add(CF_BITMAP);
(*  if (f_Formats.IndexOf(CF_METAFILEPICT) < 0) then
   f_Formats.Add(CF_METAFILEPICT);*)
  if (f_Formats.IndexOf(CF_ENHMETAFILE) < 0) then
   f_Formats.Add(CF_ENHMETAFILE);
 end;//Bitmap <> nil
//#UC END# *48F351EB00E1_4680F5AA0274_impl*
end;//Tl3DataObject.CheckFormats

function Tl3DataObject.DoQueryGetData(const aFormatEtc: TFormatEtc): HResult;
//#UC START# *48F359680368_4680F5AA0274_var*
var
 l_Index : Integer;
//#UC END# *48F359680368_4680F5AA0274_var*
begin
//#UC START# *48F359680368_4680F5AA0274_impl*
 with aFormatEtc do
 begin
  if (dwAspect <> DVASPECT_CONTENT) then
   Result := DV_E_DVAspect
  else
  if (lIndex <> -1) then
   Result := DV_E_LINDEX
  else
  begin
   if (tymed AND AcceptableTymed <> TYMED_NULL) then
   begin
    Result := DV_E_FormatEtc;
    for l_Index := f_Formats.Lo to f_Formats.Hi do
     if (f_Formats[l_Index] = cfFormat) then
     begin
      Result := S_Ok;
      break;
     end;//f_Formats[l_Index] = cfFormat
   end//if (tymed AND AcceptableTymed <> TYMED_NULL) then
   else
    Result := DV_E_FormatEtc;
  end;//lIndex <> -1
 end;//with aFormatEtc do
//#UC END# *48F359680368_4680F5AA0274_impl*
end;//Tl3DataObject.DoQueryGetData

procedure Tl3DataObject.SetDragBitmap(const aBitmap: Il3Bitmap);
//#UC START# *48F35AEC0254_4680F5AA0274_var*
//#UC END# *48F35AEC0254_4680F5AA0274_var*
begin
//#UC START# *48F35AEC0254_4680F5AA0274_impl*
 f_DragBitmap := aBitmap;
 CheckFormats;
//#UC END# *48F35AEC0254_4680F5AA0274_impl*
end;//Tl3DataObject.SetDragBitmap

function Tl3DataObject.Image: Il3Bitmap;
//#UC START# *476F77AA034A_4680F5AA0274_var*
//#UC END# *476F77AA034A_4680F5AA0274_var*
begin
//#UC START# *476F77AA034A_4680F5AA0274_impl*
 Result := f_DragBitmap;
//#UC END# *476F77AA034A_4680F5AA0274_impl*
end;//Tl3DataObject.Image

function Tl3DataObject.GetData(const formatetcIn: TFormatEtc;
  out medium: TStgMedium): HResult;
//#UC START# *48F32DD50284_4680F5AA0274_var*
var
 l_HObject : hGlobal;
 l_P       : PInteger;
//#UC END# *48F32DD50284_4680F5AA0274_var*
begin
//#UC START# *48F32DD50284_4680F5AA0274_impl*
 Result := QueryGetData(formatetcIn);
 if (Result = S_Ok) then
 begin
  with formatetcIn do
   if (cfFormat = CF_Locale) then
   begin
    if ((tymed and TYMED_HGLOBAL) <> 0) then
    begin
     l_HObject := GlobalAlloc(GMEM_SHARE or GMEM_MOVEABLE or GMEM_ZEROINIT, SizeOf(Integer));
     try
      l_P := GlobalLock(l_HObject);
      try
       l_P^ := LANG_RUSSIAN;
      finally
       GlobalUnlock(l_HObject);
      end;//try..finally
      medium.tymed := TYMED_HGLOBAL;
      medium.hGlobal := l_HObject;
     except
      GlobalFree(l_HObject);
      Result := E_OutOfMemory;
     end;//try..except
(*     medium.tymed := TYMED_HGLOBAL;
     medium.hGlobal := LANG_RUSSIAN;*)
    end//(tymed and TYMED_HGLOBAL) <> 0..
    else
     Result := DV_E_FORMATETC;
   end//cfFormat = CF_Locale..
   else
   begin
    l3FillChar(medium, sizeof(medium), 0);
    Result := DoGetData(formatetcIn, medium);
   end;//cfFormat = CF_Locale..
 end;//Result = S_Ok
//#UC END# *48F32DD50284_4680F5AA0274_impl*
end;//Tl3DataObject.GetData

function Tl3DataObject.GetDataHere(const formatetc: TFormatEtc;
  out medium: TStgMedium): HResult;
//#UC START# *48F32E0200AF_4680F5AA0274_var*
var
 l_P : PInteger;
//#UC END# *48F32E0200AF_4680F5AA0274_var*
begin
//#UC START# *48F32E0200AF_4680F5AA0274_impl*
 Result := QueryGetData(formatetc);
 if (Result = S_Ok) then
 begin
  with formatetc do
   if (cfFormat = CF_Locale) then
   begin
    if ((tymed and TYMED_HGLOBAL) <> 0) AND (medium.tymed = TYMED_HGLOBAL) then
    begin
     l_P := GlobalLock(medium.hGlobal);
     try
      l_P^ := LANG_RUSSIAN;
     finally
      GlobalUnlock(medium.hGlobal);
     end;//try..finally
(*     medium.hGlobal := LANG_RUSSIAN;*)
    end//tymed and TYMED_HGLOBAL) <> 0
    else
     Result := DV_E_FORMATETC;
   end//cfFormat = CF_Locale..
   else
    Result := DoGetDataHere(formatetc, medium);
 end;//Result = S_Ok
//#UC END# *48F32E0200AF_4680F5AA0274_impl*
end;//Tl3DataObject.GetDataHere

function Tl3DataObject.QueryGetData(const formatetc: TFormatEtc): HResult;
//#UC START# *48F32E20007F_4680F5AA0274_var*
//#UC END# *48F32E20007F_4680F5AA0274_var*
begin
//#UC START# *48F32E20007F_4680F5AA0274_impl*
 Result := DoQueryGetData(formatetc);
//#UC END# *48F32E20007F_4680F5AA0274_impl*
end;//Tl3DataObject.QueryGetData

function Tl3DataObject.GetCanonicalFormatEtc(const formatetc: TFormatEtc;
  out formatetcOut: TFormatEtc): HResult;
//#UC START# *48F32E330154_4680F5AA0274_var*
//#UC END# *48F32E330154_4680F5AA0274_var*
begin
//#UC START# *48F32E330154_4680F5AA0274_impl*
 Result := DATA_S_SAMEFORMATETC;
 FormatEtcOut := FormatEtc;
 FormatEtcOut.ptd := nil;
//#UC END# *48F32E330154_4680F5AA0274_impl*
end;//Tl3DataObject.GetCanonicalFormatEtc

function Tl3DataObject.SetData(const formatetc: TFormatEtc;
  var medium: TStgMedium;
  fRelease: BOOL): HResult;
//#UC START# *48F32E4D0179_4680F5AA0274_var*
//#UC END# *48F32E4D0179_4680F5AA0274_var*
begin
//#UC START# *48F32E4D0179_4680F5AA0274_impl*
 Result := E_NOTIMPL;
//#UC END# *48F32E4D0179_4680F5AA0274_impl*
end;//Tl3DataObject.SetData

function Tl3DataObject.EnumFormatEtc(dwDirection: Integer;
  out enumFormatEtc: IEnumFormatEtc): HResult;
//#UC START# *48F330A10257_4680F5AA0274_var*
//#UC END# *48F330A10257_4680F5AA0274_var*
begin
//#UC START# *48F330A10257_4680F5AA0274_impl*
 if (dwDirection = DATADIR_GET) then
 begin
  Result := S_Ok;
  enumFormatEtc := Tl3DataObjectEnum.Make(Self);
 end//if (dwDirection = DATADIR_GET) then
 else
  Result := E_NotImpl;
//#UC END# *48F330A10257_4680F5AA0274_impl*
end;//Tl3DataObject.EnumFormatEtc

function Tl3DataObject.DAdvise(const formatetc: TFormatEtc;
  advf: Integer;
  const advSink: IAdviseSink;
  out dwConnection: Integer): HResult;
//#UC START# *48F330C40367_4680F5AA0274_var*
//#UC END# *48F330C40367_4680F5AA0274_var*
begin
//#UC START# *48F330C40367_4680F5AA0274_impl*
 Result := OLE_E_AdviseNotSupported;
//#UC END# *48F330C40367_4680F5AA0274_impl*
end;//Tl3DataObject.DAdvise

function Tl3DataObject.DUnadvise(dwConnection: Integer): HResult;
//#UC START# *48F3312B0381_4680F5AA0274_var*
//#UC END# *48F3312B0381_4680F5AA0274_var*
begin
//#UC START# *48F3312B0381_4680F5AA0274_impl*
 Result := OLE_E_AdviseNotSupported;
//#UC END# *48F3312B0381_4680F5AA0274_impl*
end;//Tl3DataObject.DUnadvise

function Tl3DataObject.EnumDAdvise(out enumAdvise: IEnumStatData): HResult;
//#UC START# *48F3313E0339_4680F5AA0274_var*
//#UC END# *48F3313E0339_4680F5AA0274_var*
begin
//#UC START# *48F3313E0339_4680F5AA0274_impl*
 Result := OLE_E_AdviseNotSupported;
//#UC END# *48F3313E0339_4680F5AA0274_impl*
end;//Tl3DataObject.EnumDAdvise

procedure Tl3DataObject.Cleanup;
//#UC START# *479731C50290_4680F5AA0274_var*
//#UC END# *479731C50290_4680F5AA0274_var*
begin
//#UC START# *479731C50290_4680F5AA0274_impl*
 l3Free(f_Formats);
 f_DragBitmap := nil;
 l3Free(f_FilesNames);
 inherited;
//#UC END# *479731C50290_4680F5AA0274_impl*
end;//Tl3DataObject.Cleanup

procedure Tl3DataObject.InitFields;
//#UC START# *47A042E100E2_4680F5AA0274_var*
//#UC END# *47A042E100E2_4680F5AA0274_var*
begin
//#UC START# *47A042E100E2_4680F5AA0274_impl*
 inherited;
 CheckFormats;
//#UC END# *47A042E100E2_4680F5AA0274_impl*
end;//Tl3DataObject.InitFields

end.