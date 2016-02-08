unit l3IEBitmapContainer;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3IEBitmapContainer -       }
{ Начат: 26.07.2004 16:07             }
{ $Id: l3IEBitmapContainer.pas,v 1.38 2015/01/21 08:31:19 dinishev Exp $ }

// $Log: l3IEBitmapContainer.pas,v $
// Revision 1.38  2015/01/21 08:31:19  dinishev
// {Requestlink:586350815}
//
// Revision 1.37  2015/01/20 09:18:54  dinishev
// {Requestlink:586350815}
//
// Revision 1.36  2015/01/19 18:36:43  lulin
// {RequestLink:580710025}
//
// Revision 1.35  2015/01/19 13:03:30  dinishev
// {Requestlink:586350815}
//
// Revision 1.34  2014/11/10 13:53:50  morozov
// Убрал ассерт
//
// Revision 1.33  2014/11/07 13:56:02  lulin
// {RequestLink:571638581}.
//
// Revision 1.32  2014/05/13 10:26:38  dinishev
// {Requestlink:528448334}
//
// Revision 1.31  2014/02/21 16:28:30  lulin
// - избавляемся от обёрток над тегами.
//
// Revision 1.30  2014/02/14 15:33:48  lulin
// - избавляемся от ошибок молодости.
//
// Revision 1.29  2012/03/11 09:57:51  lulin
// {RequestLink:336663851}.
//
// Revision 1.28  2011/05/18 17:46:00  lulin
// {RequestLink:266409354}.
//
// Revision 1.27  2009/01/12 11:21:40  lulin
// - bug fix: был AV из-за непарности скобок добавления/удаления.
// - правильнее обрабатываем установленный снаружи DPI.
//
// Revision 1.26  2008/12/23 13:00:53  lulin
// - <K>: 133137231. Не всегда при печати освобождали отрендеренную картинку.
//
// Revision 1.25  2008/11/12 12:06:39  lulin
// - bug fix: падали при удалении контейнера при  выходе из приложения.
//
// Revision 1.24  2008/07/15 14:51:43  lulin
// - <K>: 102957837.
//
// Revision 1.23  2008/02/06 09:55:31  lulin
// - глобальные объекты сделаны индексированным свойством.
//
// Revision 1.22  2008/02/06 09:30:56  lulin
// - базовые списки объектов выделяем в отдельные файлы.
//
// Revision 1.21  2008/02/05 09:58:12  lulin
// - выделяем базовые объекты в отдельные файлы и переносим их на модель.
//
// Revision 1.20  2007/10/22 12:51:41  lulin
// - базовый контейнер теперь полностью реализует интерфейс картинки.
//
// Revision 1.19  2007/10/22 11:57:11  lulin
// - выделен еще один базовый контейнер графики.
//
// Revision 1.18  2007/08/02 15:07:50  lulin
// - при загрузке и отрисовки картинки учитываем ее DPI.
//
// Revision 1.17  2006/12/15 11:30:48  lulin
// - добавлена картинка со счетчиком ссылок.
//
// Revision 1.16  2006/11/17 13:14:08  lulin
// - наследуем базовые объекты от l3Base.
//
// Revision 1.15  2006/01/04 14:01:35  lulin
// - new behavior: освобождаем ненужные картинки.
//
// Revision 1.14  2006/01/04 13:20:25  lulin
// - new behavior: освобождаем ненужные картинки.
//
// Revision 1.13  2005/12/29 15:02:36  fireton
// - bug fix: избавляемся от утечек GDI-ресурсов (обход дыры в VCL)
//
// Revision 1.12  2005/02/22 12:27:44  lulin
// - рефакторинг работы с Tl3Point и Tl3Rect.
//
// Revision 1.11  2004/11/03 14:21:12  lulin
// - реализованы методы Il3Bitmap._Assign и _AssignTo.
//
// Revision 1.10  2004/11/03 09:55:15  lulin
// - new behavior: копирование параграфа в буфер обмена в формате CF_Bitmap теперь не завязано на тип параграфа, а использует интерфейс Il3Bitmap - в результате, кроме параграфов idBitmap в буфер обмена стали попадать все парагравы у которых атрибут tiObject поддерживает интерфейс Il3Bitmap, например idFormula.
//
// Revision 1.9  2004/11/02 16:39:19  lulin
// - bug fix: для параграфа с картинкой используем правильный контейнер.
//
// Revision 1.8  2004/09/20 15:34:18  lulin
// - попытался держать картинки в файле - безуспешно :-( сглаживание работает очень плохо (медленно, конца дождаться не удалось).
//
// Revision 1.7  2004/07/31 12:14:23  law
// - bug fix: при печати картинки обрезались.
//
// Revision 1.6  2004/07/29 11:30:43  law
// - new define: evRenderDirectly.
//
// Revision 1.5  2004/07/29 10:44:37  law
// - bug fix: лишний раз не рендерим картинки.
//
// Revision 1.4  2004/07/29 08:29:38  law
// - new behavior: при использовании ImageEn не грузим Bitmap без необходимости.
//
// Revision 1.3  2004/07/29 07:25:10  law
// - new behavior: при нехватке ресурсов для рисования картинки выводим на канву прямо сообщение об ошибке и гасим исключение.
//
// Revision 1.2  2004/07/28 16:05:48  law
// - new behavior: не применяем фильтр, если рисуем картинку в "родных" размерах.
//
// Revision 1.1  2004/07/26 14:19:26  law
// - new behavior: для рисования картинок используем функции из ImageEn.
//

{$Include l3Define.inc }

interface

uses
  Windows,
  
  Classes,
  Graphics,
  
  l3Types,
  l3InternalInterfaces,
  l3Base,
  l3GraphicContainer,
  l3Units,
  l3Metafile,

  hyieutils,
  ImageEnIO
  ;

type
  Tl3IEBitmapContainer = class(Tl3PrimGraphicContainer)
   {* - объект - контейнер для картинки (TBitmap). }
    private
    // property fields
      f_IO            : TImageEnIO;
      f_Bitmap        : TIEBitmap;
      f_Rendered      : TBitmap;
      f_Stream        : TStream;
      f_ParamsLoaded  : Boolean;
      f_DPI           : Integer;
      f_CheckMetaFile : Boolean;
      f_MetaFileRender: Tl3MetaFile;
    protected
    // interface methods
      // Il3Bitmap
      procedure SaveToClipboardFormat(var AFormat: Word; var AData: THandle; var APalette: HPALETTE);
        override;
        {-}
      procedure Il3Bitmap_AssignTo(P: TObject);
        override;
        {-}
      procedure Il3Bitmap_Assign(P: TPersistent);
        override;
        {-}
    protected
    // property methods
      function  pm_GetIO: TImageEnIO;
        {-}
      function  pm_GetBitmap: TIEBitmap;
        {-}
      function  pm_GetWidth: Long;
        override;
        {-}
      function  pm_GetHeight: Long;
        override;
        {-}
      function  pm_GetInchWidth: Long;
        override;
        {-}
      function  pm_GetInchHeight: Long;
        override;
        {-}
      procedure pm_SetStream(aStream: TStream);
        {-}
      function DPIX: Integer;
        {-}
      function DPIY: Integer;
        {-}
    protected
    // internal methods
      procedure DropRendered;
        {-}
      procedure Release;
        override;
        {-}
    public
    // public methods
      procedure StretchDraw(const aRect: Tl3Rect; const aCanvas: Il3Canvas);
        override;
        {-}
      function GetDPI: Integer;
      procedure SetDPI(aValue: Integer);
        {-}
      function Get_MetaFileRender(aHandle: HDC): Tl3MetaFile;
        {-}
    public
    // public properties
      property DPI: Integer
        read GetDPI
        write SetDPI;
        {-}
      property IO: TImageEnIO
        read pm_GetIO;
        {-}
      property Bitmap: TIEBitmap
        read pm_GetBitmap;
        {-}
      property Stream: TStream
        read f_Stream
        write pm_SetStream;
        {-}
  end;//Tl3IEBitmapContainer

implementation

uses
  SysUtils,
  
  l3Const,
  l3String,
  l3Bitmap,
  l3ScreenIC,
  l3Math,
  l3ObjectList,
  l3IEBitmapContainerStack,

  evConst,

  hyiedefs,
  imageenproc
  ;

procedure AddContainer(aCont: Tl3IEBitmapContainer);
var
 l_List : Tl3ObjectList;
begin
 l_List := Tl3IEBitmapContainerStack.Instance;
 if (l_List.IndexOf(aCont) >= 0) then
  Exit; 
 if (l_List.Count > 5) then
  Tl3IEBitmapContainer(l_List.First).DropRendered;
 l_List.Add(aCont);
end;

procedure RemoveContainer(aCont: Tl3IEBitmapContainer);
begin 
(* Assert(not l3SystemDown);
 if not l3SystemDown then
 // - не надо ничего удалять в процессе завершения работы, т.к. может оказаться, что и удалять неоткуда *)
 // - закомментировал, потому что:
 // [15:02]  ЛА> надо закомментировать тогда Assert и условие за ним (про l3SystemDown) и смотреть - что сломается
  if Tl3IEBitmapContainerStack.Exists then
   Tl3IEBitmapContainerStack.Instance.Remove(aCont); 
end;

// start class Tl3IEBitmapContainer

procedure Tl3IEBitmapContainer.Release;
  {override;}
  {-}
begin
 Stream := nil;
 l3Free(f_IO);
 l3Free(f_Bitmap);
 DropRendered;
 f_CheckMetaFile := False;
 inherited;
end;

procedure Tl3IEBitmapContainer.DropRendered;
  {-}
begin
 RemoveContainer(Self);
 l3Free(f_Bitmap);
 l3Free(f_Rendered);
 l3Free(f_MetaFileRender);
 f_CheckMetaFile := False;
end;
  
function Tl3IEBitmapContainer.pm_GetIO: TImageEnIO;
  {-}
begin
 if (f_IO = nil) then
 begin
  f_IO := TImageEnIO.Create(nil);
  f_IO.Background := clWhite; // http://mdp.garant.ru/pages/viewpage.action?pageId=528448334
  // В Tl3Canvas.StretchDraw есть такое предположение:
  //  TBitmap(Graphic).TransparentColor := clWhite;
  // - т.к. обычно подложка белая
 end; // if (f_IO = nil) then
 Result := f_IO; 
end;
  
function Tl3IEBitmapContainer.pm_GetBitmap: TIEBitmap;
  {-}
begin
 if (f_Bitmap = nil) then
 begin
  f_Bitmap := TIEBitmap.Create;
  AddContainer(Self);
  //f_Bitmap.MinFileSize := 50 * 1024;
  IO.AttachedIEBitmap := f_Bitmap;
  if (Stream <> nil) then
  begin
   Stream.Seek(0, soBeginning);
   IO.LoadFromStream(Stream);
  end;//Stream <> nil
  //Stream := nil;
  // - отпускаем поток, т.к. из него все считали
 end;//f_Bitmap = nil
 Result := f_Bitmap;
end;

const
 cXGap = 0;
 // - т.к. при отрисовке конечный символ не входит в прямоугольник

function Tl3IEBitmapContainer.pm_GetWidth: Long;
  {-}
begin
 if (f_Bitmap = nil) then
 begin
  if (Stream = nil) then
   Result := 0
  else
  begin
   if not f_ParamsLoaded then
   begin
    Stream.Seek(0, soBeginning);
    IO.ParamsFromStream(Stream);
    f_ParamsLoaded := true;
   end;//not f_ParamsLoaded
   Result := IO.Params.Width + cXGap;
  end;//Stream = nil
 end//f_Bitmap = nil
 else
  Result := f_Bitmap.Width + cXGap;
end;

function Tl3IEBitmapContainer.pm_GetHeight: Long;
  {-}
begin
 if (f_Bitmap = nil) then
 begin
  if (Stream = nil) then
   Result := 0
  else
  begin
   if not f_ParamsLoaded then
   begin
    Stream.Seek(0, soBeginning);
    IO.ParamsFromStream(Stream);
    f_ParamsLoaded := true;
   end;//not f_ParamsLoaded
   Result := IO.Params.Height;
  end;//Stream = nil
 end//f_Bitmap = nil
 else
  Result := f_Bitmap.Height;
end;

function Tl3IEBitmapContainer.DPIX: Integer;
  {-}
begin
 if (f_DPI = 0) then
  Result := IO.Params.DPIX
 else
  Result := f_DPI;
 if (Result = 0) then
  Result := l3CrtIC.PixelsPerInchX;
end;

function Tl3IEBitmapContainer.DPIY: Integer;
  {-}
begin
 if (f_DPI = 0) then
  Result := IO.Params.DPIY
 else
  Result := f_DPI;
 if (Result = 0) then
  Result := l3CrtIC.PixelsPerInchY;
end;

function Tl3IEBitmapContainer.pm_GetInchWidth: Long;
  {-}
begin
 if (f_Bitmap = nil) then
 begin
  if (Stream = nil) then
   Result := 0
  else
  begin
   if not f_ParamsLoaded then
   begin
    Stream.Seek(0, soBeginning);
    IO.ParamsFromStream(Stream);
    f_ParamsLoaded := true;
   end;//not f_ParamsLoaded
   Result := l3MulDiv(IO.Params.Width + cXGap, l3Inch, DPIX);
  end;//Stream = nil
 end//f_Bitmap = nil
 else
  Result := l3MulDiv(f_Bitmap.Width + cXGap, l3Inch, DPIX);
end;

function Tl3IEBitmapContainer.pm_GetInchHeight: Long;
  {-}
begin
 if (f_Bitmap = nil) then
 begin
  if (Stream = nil) then
   Result := 0
  else
  begin
   if not f_ParamsLoaded then
   begin
    Stream.Seek(0, soBeginning);
    IO.ParamsFromStream(Stream);
    f_ParamsLoaded := true;
   end;//not f_ParamsLoaded
   Result := l3MulDiv(IO.Params.Height, l3Inch, DPIY);
  end;//Stream = nil
 end//f_Bitmap = nil
 else
  Result := l3MulDiv(f_Bitmap.Height, l3Inch, DPIY);
end;

procedure Tl3IEBitmapContainer.pm_SetStream(aStream: TStream);
  {-}
begin
 l3Set(f_Stream, aStream);
end;

procedure Tl3IEBitmapContainer.StretchDraw(const aRect: Tl3Rect; const aCanvas: Il3Canvas);
  {-}
var
 l_R      : Tl3SRect;
 l_Width  : Long;
 l_Height : Long;
 l_MF     : Tl3MetaFile;
 l_Filter : TResampleFilter;
begin
 l_MF := Get_MetaFileRender(aCanvas.DC);
 if l_MF <> nil then
  aCanvas.StretchDraw(aRect, l_MF)
 else
 if (Bitmap <> nil) then
 begin
  try
   l_R := aCanvas.WO(aRect);
   if aCanvas.Printing then
   begin
    aCanvas.FillRect(aRect);
    Bitmap.RenderToCanvas(aCanvas.Canvas,
                          //0, 0,
                          l_R.Left, l_R.Top,
                          l_R.Right - l_R.Left,
                          l_R.Bottom - l_R.Top,
                          // - херово у меня с графикой, но так ПРАВИЛЬНО работает!
                          rfNone,
                          1.0);
   end//aCanvas.Printing
   else
   begin
    // - с проверками ниже я что-то нихера не разобрался, но так ПРАВИЛЬНО работает!
    if (l_R.Left < 0) then
     l_Width := l_R.Right - l_R.Left
    else
     l_Width := l_R.Right{ - l_R.Left};
    if (l_R.Top < 0) then
     l_Height := l_R.Bottom - l_R.Top
    else
     l_Height := l_R.Bottom{ - l_R.Top};
    try
     if (f_Rendered = nil) OR
        (Abs(l_Width - f_Rendered.Width) > 2) OR
        // - 2 чтобы учесть ошибку округления
        (Abs(l_Height - f_Rendered.Height) > 2) then
     begin
      if (f_Rendered = nil) then
      begin
       AddContainer(Self);
       f_Rendered := Tl3Bitmap.Create;
       f_Rendered.PixelFormat := pf24bit;
      end;//f_Rendered = nil
      f_Rendered.Width := l_Width;
      f_Rendered.Height := l_Height;
      if (l_Width = Width) AND (l_Height = Height) then
       l_Filter := rfNone
      else
       l_Filter := rfFastLinear;//rfLanczos3;
      {$IfDef evRenderDirectly}
      Bitmap.RenderToTBitmap(f_Rendered,
                             0, 0, l_Width, l_Height,
                             0, 0, Bitmap.Width, Bitmap.Height,
                             false,
                             l_Filter);
      {$Else evRenderDirectly}
      Bitmap.RenderToCanvas(f_Rendered.Canvas,
                            0, 0, l_Width, l_Height,
                            l_Filter,
                            1.0);
      {$EndIf evRenderDirectly}
     end;//l_Width <> f_Width
     aCanvas.StretchDraw(aRect, f_Rendered);
    except
     on E : EOutOfResources do
     begin
      aCanvas.FillRect(aRect);
      aCanvas.TextOut(aRect.TopLeft.Add(l3Point1(evInchMul div 10)), l3PCharLen(E.Message));
     end;//on E : EOutOfResources
    end;//try..except
   end;//aCanvas.Printing
  except
   on E : Exception do
   begin
    aCanvas.FillRect(aRect);
    aCanvas.TextOut(aRect.TopLeft.Add(l3Point1(evInchMul div 10)), l3PCharLen(E.Message));
   end;//on E : Exception
  end;//try..except
 end//Bitmap <> nil
 else
  aCanvas.FillRect(aRect);
end;

function Tl3IEBitmapContainer.GetDPI: Integer;
  {-}
begin
 Result := DPIX;
end;

procedure Tl3IEBitmapContainer.SetDPI(aValue: Integer);
  {-}
begin
 if (f_DPI <> aValue) then
 begin
  f_DPI := aValue;
  DropRendered;
 end;//f_DPI <> aValue
end;

procedure Tl3IEBitmapContainer.SaveToClipboardFormat(var AFormat: Word; var AData: THandle; var APalette: HPALETTE);
  {-}
begin
 AData := _CopyBitmaptoDIBEx(Bitmap,0,0,0,0);
 AFormat := CF_DIB;
 APalette := 0;
end;
  
procedure Tl3IEBitmapContainer.Il3Bitmap_AssignTo(P: TObject);
  //override;
  {-}
begin
 if (P Is TBitmap) then
  Bitmap.CopyToTBitmap(TBitmap(P))
 else
 if (P Is TIEBitmap) then
  TIEBitmap(P).Assign(Bitmap); 
end;

procedure Tl3IEBitmapContainer.Il3Bitmap_Assign(P: TPersistent);
  //override;
  {-}
begin
 Bitmap.Assign(P)
end;

function Tl3IEBitmapContainer.Get_MetaFileRender(aHandle: HDC): Tl3MetaFile;
begin
 if (f_MetaFileRender = nil) and not f_CheckMetaFile and (Stream <> nil) then
 begin
  f_CheckMetaFile := True;
  f_MetaFileRender := Tl3Metafile.TryMakeFromStream(Stream);
  if f_MetaFileRender <> nil then
   AddContainer(Self);
 end;//f_Bitmap = nil
 Result := f_MetaFileRender;
end;

end.

