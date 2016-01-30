unit l3Units;
{* Модуль описывающий работу с различными единицами измерения. }

{ Библиотека "Эверест" }
{ Автор: Люлин А.В. ©  }
{ Модуль: l3Units - работа с различными единицами измерения}
{ Начат: 12.12.96 }
{ $Id: l3Units.pas,v 1.32 2014/05/20 16:49:24 lulin Exp $ }

// $Log: l3Units.pas,v $
// Revision 1.32  2014/05/20 16:49:24  lulin
// - пытаемся восстановить компилируемость под XE.
//
// Revision 1.31  2014/05/20 16:18:07  lulin
// - пытаемся восстановить компилируемость под XE.
//
// Revision 1.30  2014/05/20 15:51:49  lulin
// - пытаемся восстановить компилируемость под XE.
//
// Revision 1.29  2013/05/24 15:59:50  lulin
// - пытаемся портироваться под XE4.
//
// Revision 1.28  2012/06/14 10:19:19  dinishev
// {Requestlink:371197572}
//
// Revision 1.27  2011/11/01 10:12:14  lulin
// {RequestLink:290953660}
//
// Revision 1.26  2011/10/14 15:23:34  dinishev
// {Requestlink:281520291}
//
// Revision 1.25  2011/07/20 11:16:03  lulin
// {RequestLink:228688745}.
//
// Revision 1.24  2010/01/19 20:16:33  lulin
// {RequestLink:178717800}. Заготовочка.
//
// Revision 1.23  2008/08/26 11:22:08  lulin
// - чистка кода.
//
// Revision 1.22  2008/02/27 17:25:04  lulin
// - подгоняем код под модель.
//
// Revision 1.21  2007/11/28 13:59:46  dinishev
// Bug fix: возникало переполнение
//
// Revision 1.20  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.19  2007/04/02 06:17:55  lulin
// - убрана неправильная зависимость.
//
// Revision 1.18  2006/11/03 11:00:47  lulin
// - объединил с веткой 6.4.
//
// Revision 1.17.4.1  2006/10/20 09:40:45  lulin
// - cleanup.
//
// Revision 1.17  2006/06/06 13:47:57  lulin
// - стараемся уменьшить число вызовов GDI.
//
// Revision 1.16  2005/05/27 12:06:04  lulin
// - убраны лишние зависимости.
//
// Revision 1.15  2005/05/26 16:01:48  lulin
// - избавил базовую канву вывода от знания о константах Эвереста.
//
// Revision 1.14  2005/05/24 12:48:20  lulin
// - для канвы используем интерфейс, а не объект.
//
// Revision 1.13  2005/04/16 11:41:27  lulin
// - слил с веткой. Теперь из ветки можно вытягивать ТОЛЬКО Everest.
//
// Revision 1.12.2.1  2005/04/13 10:20:04  lulin
// - cleanup.
//
// Revision 1.12  2005/02/22 12:27:44  lulin
// - рефакторинг работы с Tl3Point и Tl3Rect.
//
// Revision 1.11  2004/12/04 11:40:38  mmorozov
// new: overload function l3SRect;
//
// Revision 1.10  2003/11/13 11:53:48  law
// - new method: Tl3Point.IsNull.
//
// Revision 1.9  2003/09/17 14:12:59  law
// - bug fix: integer overflow, кода отрисовывается закрывающееся окно (OIT500004649).
//
// Revision 1.8  2003/05/22 13:10:10  law
// - cleanup.
//
// Revision 1.7  2003/05/21 15:55:59  law
// - new behavior: правую границу блока рисуем "в бесконечности".
//
// Revision 1.6  2003/04/15 13:26:49  law
// - new unit: evUnits.
//
// Revision 1.5  2002/09/18 07:24:03  law
// - cleanup: evDefine.inc -> l3Define.inc.
//
// Revision 1.4  2002/07/23 15:26:58  law
// - rename proc: evRectBnd -> l3RectBnd.
//
// Revision 1.3  2002/07/11 12:03:15  law
// - rename proc: evPoint -> l3Point, evRect -> l3Rect.
//
// Revision 1.2  2002/07/11 07:06:21  law
// - new behavior: защита от экспериментаторов и пидарасов.
//
// Revision 1.1  2002/07/09 12:49:23  law
// - rename unit: evUnits -> l3Units.
//
// Revision 1.34  2002/07/09 11:12:42  law
// - new type: Tl3Inch.
//
// Revision 1.33  2002/01/08 13:54:14  law
// - rename type: TevOrientation -> Tl3Orientation.
//
// Revision 1.32  2002/01/05 11:09:36  law
// - cleanup.
//
// Revision 1.31  2001/11/23 17:25:21  law
// - cleanup.
//
// Revision 1.30  2001/09/19 15:55:21  law
// - new behavior: начата работа над возможностью сворачивать и разворачивать блоки документа.
//
// Revision 1.29  2001/09/07 08:53:02  law
// - rename procedures: evPointX -> l3PointX, evPointY -> l3PointY.
//
// Revision 1.28  2001/08/31 12:59:06  law
// - comments & cleanup.
//
// Revision 1.27  2001/08/31 08:50:07  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.26  2001/07/27 15:46:04  law
// - comments: xHelpGen.
//
// Revision 1.25  2001/04/20 14:03:52  law
// - cleanup: def_cm* => def_inch*, evCm2Pixel -> evCm2Inch.
//
// Revision 1.24  2001/04/20 11:19:14  law
// - new const: добавлены константы def_inch*.
//
// Revision 1.23  2001/04/05 08:57:37  law
// - cleanup: использование модулей WinTypes и WinProcs заменен на Windows.
//
// Revision 1.22  2001/03/27 08:01:58  law
// - TevPoint -> Tl3Point, TevRect -> Tl3Rect.
//
// Revision 1.21  2001/03/11 17:08:22  law
// - дописаны комментарии для XHelpGen.
//
// Revision 1.20  2001/02/27 17:11:35  law
// - дописаны комментарии.
//
// Revision 1.19  2000/12/15 15:10:39  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  Windows,
  
  //l3Types,
  l3Interfaces
  ;

type
  Tl3SPoint = Tl3_SPoint;

  Tl3_SRect = {$IfDef XE4}packed record{$Else}packed object{$EndIf}
    public
    {public fields}
      R : packed record
        Case Byte of
         0: (Left, Top, Right, Bottom : Integer);
         1: (TopLeft, BottomRight: Tl3SPoint);
         2: (bRt: array [Boolean] of Tl3SPoint);
         3: (WR: Windows.TRect);
      end;{R}
    public
    // public properties
      property Left: Integer
        read R.Left
        write R.Left;
        {-}
      property Right: Integer
        read R.Right
        write R.Right;
        {-}
      property Top: Integer
        read R.Top
        write R.Top;
        {-}
      property Bottom: Integer
        read R.Bottom
        write R.Bottom;
        {-}
      property TopLeft: Tl3SPoint
        read R.TopLeft
        write R.TopLeft;
        {-}
      property BottomRight: Tl3SPoint
        read R.BottomRight
        write R.BottomRight;
        {-}
    public
    // public methods
      procedure InitPoint(const P1, P2: TPoint);
        {* - инициализирует прямоугольник типом TPoint. }
      procedure InitRect(const Rect: Windows.TRect);
        {* - инициализирует прямоугольник типом Windows.TRect. }
      function  IntersectsWith(const Rt: Tl3_SRect): Boolean;
        {* - проверяет пересечение Self с Rt. }
      function  InitClientRect(Wnd: hWnd): Boolean;
        {* - инициализирует прямоугольник клиентской областью Wnd. }
      procedure OffsetPt(const Pt: Tl3SPoint);
        {* - сдвинуть прямоугольник на Pt. }
      procedure Offset(aX, aY: Integer);
        {* - сдвинуть прямоугольник на (X, Y). }
      function  ContainsPt(const Pt: Tl3SPoint): Boolean;
        {* - содержит ли прямоугольник точку Pt. }
      procedure InflatePt(const Pt: Tl3SPoint);
        {* - увеличивает размеры прямоугольника на P. }
      procedure Inflate(X, Y: Integer);
        {* - увеличивает размеры прямоугольника на (X, Y). }
      procedure Inflate1(X: Integer);
        {* - увеличивает размеры прямоугольника на (X, X). }
      function  IsEmpty: Boolean;
        {* - проверяет не пустой ли прямоугольник. }
      function  Invert(DC: hDC): Boolean;
        {* - инвертировать прямоугольник на DC. }
      function  CreateRgn: hRgn;
        {* - создать регион содержащий данный прямоугольник. }
      function  EQ(const Rt: Tl3_SRect): Boolean;
        {* - проверяет равенство двух прямоугольников. }
      procedure MakeZoom(Z: Integer);
        {* - увеличивает координаты прямоугольника на Z %. }
      procedure MakeDezoom(Z: Integer);
        {* - уменьшает координаты прямоугольника на Z %. }
      function  Invalidate(Wnd: hWnd; Erase: Boolean): Boolean;
        {* - метит прямоугольник в окне Wnd для обновления. }
      function  GetRgn(Rgn: hRgn): Integer;
        {* - инициализирует прямоугольник максимальными размерами региона Rgn. }
      function  IntersectClip(DC: hDC): Integer;
        {* - устанавливает область отсечения контексту DC.}
      function  GetClip(DC: hDC): Boolean;
        {* -инициализирут прямоугольник значением области отсечения. }
      function  AddPt(const Pt: Tl3SPoint): Tl3_SRect;
        {* - сдвинуть прямоугольник на Pt и вернуть Result. }
      function  SubPt(const Pt: Tl3SPoint): Tl3_SRect;
        {* - сдвинуть прямоугольник на -Pt и вернуть Result. }
  end;//Tl3_SRect

  Tl3SRect = Tl3_SRect;

  Tl3Point = Tl3_Point;

  Tl3Rect = Tl3_Rect;

function l3Point(X, Y: Integer): Tl3Point;
function l3Rect(aLeft, aTop, aRight, aBottom: Integer): Tl3Rect;
  overload;
function l3Rect(const TopLeft, BottomRight: Tl3_Point): Tl3Rect;
  overload;
function l3RectBnd(const TopLeft, Extent: Tl3_Point): Tl3Rect;
function l3SRectBnd(const TopLeft, Extent: Tl3_SPoint): Tl3SRect;
function l3SPoint(X, Y: Integer): Tl3SPoint;
  {* - "конструктор" для Tl3SPoint. }
function l3SBounds(ALeft, ATop, AWidth, AHeight: Integer): Tl3SRect;
  {-}
function l3SRect(Left, Top, Right, Bottom: Integer): Tl3SRect;
  overload;
function l3SRect(const TopLeft, BottomRight: Tl3SPoint): Tl3SRect;
  overload;
function l3SRect(aRect : TRect) : Tl3SRect;
  overload;
function l3Point1(X: Integer): Tl3Point;
function l3PointX(X: Integer): Tl3Point;
function l3PointY(Y: Integer): Tl3Point;
function l3PointD0(A, B: Integer; D: Boolean): Tl3Point;
function Point1(X: Integer): Tl3SPoint;
function PointX(X: Integer): Tl3SPoint;
function PointY(Y: Integer): Tl3SPoint;

function evInchZoom(Zoom: Integer; Inch: Integer): Integer;
function evInchDezoom(Zoom: Integer; Inch: Integer): Integer;

function evPixelZoom(Zoom: Integer; Pixel: Integer): Integer;
function evPixelDezoom(Zoom: Integer; Pixel: Integer): Integer;

function l3IntersectRect(const SR1, SR2: Tl3Rect): Tl3Rect;
  overload;
function l3IntersectRect(const SR1, SR2: Tl3SRect): Tl3SRect;
  overload;
  {* - пересекает два прямоугольника. }

const
 l3Point0 : Tl3Point = (P: (X: 0; Y: 0));
 l3Point_1 : Tl3Point = (P: (X: -1; Y: -1));
 l3SPoint0 : Tl3SPoint = (P: (X: 0; Y: 0));
 l3Rect0  : Tl3Rect = (R: (Left: 0; Top: 0; Right: 0; Bottom: 0));
 l3SRect1 : Tl3SRect = (R: (Left: 0; Top: 0; Right: 1; Bottom: 1));
 l3SRect0 : Tl3SRect = (R: (Left: 0; Top: 0; Right: 0; Bottom: 0));

implementation

uses
  l3MinMax,
  l3Math,
  l3Const,
  l3Base
  ;

function l3IntersectRect(const SR1, SR2: Tl3Rect): Tl3Rect;
  {* - пересекает два прямоугольника. }
var
 l_Res : Boolean;
begin
 with Result do
 begin
  R.Top := Max(SR1.R.Top, SR2.R.Top);
  R.Bottom := Min(SR1.R.Bottom, SR2.R.Bottom);
  l_Res := (R.Top < R.Bottom);
  if l_Res then
  begin
   R.Left := Max(SR1.R.Left, SR2.R.Left);
   R.Right := Min(SR1.R.Right, SR2.R.Right);
   l_Res := (R.Left < R.Right);
  end;//l_Res
 end;//with Result
 if not l_Res then
  l3FillChar(Result, SizeOf(Result));
end;

function l3IntersectRect(const SR1, SR2: Tl3SRect): Tl3SRect;
  {* - пересекает два прямоугольника. }
begin
 Windows.IntersectRect(Result.R.WR, SR1.R.WR, SR2.R.WR);
end;

function evInchZoom(Zoom: Integer; Inch: Integer): Integer;
  {-}
begin
 if (Zoom <> 100) then
  Result := l3MulDiv(Inch, Zoom, 100)
 else
  Result := Inch;
end;

function evInchDezoom(Zoom: Integer; Inch: Integer): Integer;
  {-}
begin
 if (Zoom <> 100) AND (Zoom > 0) then
  Result := l3MulDiv(Inch, 100, Zoom)
 else
  Result := Inch;
end;

function evPixelZoom(Zoom: Integer; Pixel: Integer): Integer;
  {-}
begin
 if (Zoom <> 100) then
  Result := l3MulDiv(Pixel, Zoom, 100)
 else
  Result := Pixel;
end;

function evPixelDezoom(Zoom: Integer; Pixel: Integer): Integer;
  {-}
begin
 if (Zoom <> 100) AND (Zoom > 0) then
  Result := l3MulDiv(Pixel, 100, Zoom)
 else
  Result := Pixel;
end;

function l3Point(X, Y: Integer): Tl3Point;
begin
 Result.X := X;
 Result.Y := Y;
end;

function l3Point1(X: Integer): Tl3Point;
begin
 Result.P.X := X;
 Result.P.Y := X;
end;

function l3PointX(X: Integer): Tl3Point;
begin
 Result.P.X := X;
 Result.P.Y := 0;
end;

function l3PointY(Y: Integer): Tl3Point;
begin
 Result.P.X := 0;
 Result.P.Y := Y;
end;

function l3PointD0(A, B: Integer; D: Boolean): Tl3Point;
begin
 Result.P.bPt[D] := A;
 Result.P.bPt[not D] := B;
end;

function Point1(X: Integer): Tl3SPoint;
begin
 Result.P.X := X;
 Result.P.Y := X;
end;

function PointX(X: Integer): Tl3SPoint;
begin
 Result.P.X := X;
 Result.P.Y := 0;
end;

function PointY(Y: Integer): Tl3SPoint;
begin
 Result.P.X := 0;
 Result.P.Y := Y;
end;

function l3Rect(aLeft, aTop, aRight, aBottom: Integer): Tl3Rect;
begin
 Result.R.Left := aLeft;
 Result.R.Right := aRight;
 Result.R.Top := aTop;
 Result.R.Bottom := aBottom;
end;

function l3Rect(const TopLeft, BottomRight: Tl3_Point): Tl3Rect;
begin
 Result.R.TopLeft := TopLeft;
 Result.R.BottomRight := BottomRight;
end;

function l3RectBnd(const TopLeft, Extent: Tl3_Point): Tl3Rect;
begin
 Result.R.TopLeft := TopLeft;
 Result.R.BottomRight := Tl3Point(TopLeft).Add(Extent);
end;

function l3SRectBnd(const TopLeft, Extent: Tl3_SPoint): Tl3SRect;
begin
 Result.R.TopLeft := Tl3SPoint(TopLeft);
 Result.R.BottomRight := Tl3SPoint(TopLeft).Add(Extent);
end;

function l3SPoint(X, Y: Integer): Tl3SPoint;
begin
 Result.P.X := X;
 Result.P.Y := Y;
end;

function l3SBounds(ALeft, ATop, AWidth, AHeight: Integer): Tl3SRect;
begin
  with Result do
  begin
    Left := ALeft;
    Top := ATop;
    Right := ALeft + AWidth;
    Bottom :=  ATop + AHeight;
  end;
end;

function l3SRect(Left, Top, Right, Bottom: Integer): Tl3SRect;
begin
 Result.R.Left := Left;
 Result.R.Top := Top;
 Result.R.Right := Right;
 Result.R.Bottom := Bottom;
end;

function l3SRect(const TopLeft, BottomRight: Tl3SPoint): Tl3SRect;
begin
 Result.R.TopLeft := TopLeft;
 Result.R.BottomRight := BottomRight;
end;

function l3SRect(aRect : TRect) : Tl3SRect;
// overload;
begin
 Result.R.Left := aRect.Left;
 Result.R.Top := aRect.Top;
 Result.R.Right := aRect.Right;
 Result.R.Bottom := aRect.Bottom;
end;

// start object Tl3SRect

procedure Tl3SRect.InitPoint(const P1, P2: TPoint);
  {-инициализирует прямоугольник типом TPoint}
begin
 R.Left   := P1.X;
 R.Top    := P1.Y;
 R.Right  := P2.X;
 R.Bottom := P2.Y;
end;

procedure Tl3SRect.InitRect(const Rect: Windows.TRect);
  {-инициализирует прямоугольник типом Windows.TRect}
begin
 R.WR := Rect;
end;

function Tl3SRect.IntersectsWith(const Rt: Tl3_SRect): Boolean;
  {-проверяет пересечение Self с Rt}
var
 OutR : Windows.TRect;
begin
 Result := Boolean(Windows.IntersectRect(OutR, R.WR, Rt.R.WR));
end;

function Tl3SRect.InitClientRect(Wnd: hWnd): Boolean;
  {-инициализирует прямоугольник клиентской областью Wnd}
begin
 Windows.GetClientRect(Wnd, R.WR);
 Result := true;
end;

procedure Tl3SRect.OffsetPt(const Pt: Tl3SPoint);
  {-сдвинуть прямоугольник на Pt}
begin
 R.TopLeft.Inc(Pt);
 R.BottomRight.Inc(Pt);
end;

procedure Tl3SRect.Offset(aX, aY: Integer);
  {-сдвинуть прямоугольник на (X, Y)}
begin
 Inc(R.Top, aY);
 Inc(R.Bottom, aY);
 Inc(R.Left, aX);
 Inc(R.Right, aX);
end;

function Tl3SRect.ContainsPt(const Pt: Tl3SPoint): Boolean;
  {-содержит ли прямоугольник точку Pt}
begin
 Result := Windows.PtInRect(Self.R.WR, TPoint(Pt));
end;

procedure Tl3SRect.InflatePt(const Pt: Tl3SPoint);
  {-увеличивает размеры прямоугольника на P}
begin
 R.TopLeft.Dec(Pt);
 R.BottomRight.Inc(Pt);
end;

procedure Tl3SRect.Inflate(X, Y: Integer);
  {-увеличивает размеры прямоугольника на (X, Y)}
begin
 Dec(R.Left, X);
 Inc(R.Right, X);
 Dec(R.Top, Y);
 Inc(R.Bottom, Y);
end;

procedure Tl3SRect.Inflate1(X: Integer);
  {-увеличивает размеры прямоугольника на (X, X)}
begin
 Dec(R.Left, X);
 Inc(R.Right, X);
 Dec(R.Top, X);
 Inc(R.Bottom, X);
end;

function Tl3SRect.IsEmpty: Boolean;
  {-проверяет не пустой ли прямоугольник}
begin
 Result := Windows.IsRectEmpty(R.WR);
end;

function Tl3SRect.Invert(DC: hDC): Boolean;
  {-инвертировать прямоугольник на DC}
begin
 Windows.InvertRect(DC, R.WR);
 Result := true;
end;

function Tl3SRect.CreateRgn: hRgn;
  {-создать регион содержащий данный прямоугольник}
begin
 Result := Windows.CreateRectRgnIndirect(R.WR);
 if (Result <> 0) then
  l3System.IncRgnCount;
end;

function Tl3SRect.EQ(const Rt: Tl3_SRect): Boolean;
  {-проверяет равенство двух прямоугольников}
begin
 Result := Windows.EqualRect(R.WR, Rt.R.WR);
end;

procedure Tl3SRect.MakeZoom(Z: Integer);
  {-увеличивает координаты прямоугольника на Z %}
begin
 R.TopLeft.MakeZoom(Z);
 R.BottomRight.MakeZoom(Z);
end;

procedure Tl3SRect.MakeDezoom(Z: Integer);
  {-уменьшает координаты прямоугольника на Z %}
begin
 R.TopLeft.MakeDezoom(Z);
 R.BottomRight.MakeDezoom(Z);
end;

function Tl3SRect.Invalidate(Wnd: hWnd; Erase: Boolean): Boolean;
  {-}
begin
 Windows.InvalidateRect(Wnd, @Self, Erase);
 Result := true;
end;

function Tl3SRect.GetRgn(Rgn: hRgn): Integer;
  {-инициализирует прямоугольник максимальными размерами региона Rgn}
begin
 Result := Windows.GetRgnBox(Rgn, R.WR);
end;

function Tl3SRect.IntersectClip(DC: hDC): Integer;
  {-устанавливает область отсечения контексту DC}
begin
 with R do
  Result := Windows.IntersectClipRect(DC, Left, Top, Right, Bottom);
end;

function Tl3SRect.GetClip(DC: hDC): Boolean;
  {-инициализирут прямоугольник значением области отсечения}
begin
 Result := (GetClipBox(DC, R.WR) <> Windows.ERROR);
end;

function Tl3SRect.AddPt(const Pt: Tl3SPoint): Tl3SRect;
  {-сдвинуть прямоугольник на Pt и вернуть Result}
begin
 Result.R.Left := R.Left + Pt.P.X;
 Result.R.Right := R.Right + Pt.P.X;
 Result.R.Top := R.Top + Pt.P.Y;
 Result.R.Bottom := R.Bottom + Pt.P.Y;
end;

function Tl3SRect.SubPt(const Pt: Tl3SPoint): Tl3SRect;
  {-сдвинуть прямоугольник на -Pt и вернуть Result}
begin
 Result.R.Left := R.Left - Pt.P.X;
 Result.R.Right := R.Right - Pt.P.X;
 Result.R.Top := R.Top - Pt.P.Y;
 Result.R.Bottom := R.Bottom - Pt.P.Y;
end;

end.

