unit l3VirtualCanvas;

{ Библиотека "Application Framework"  - Теперь L3}
{ Начал: Люлин А.В.                  }
{ Модуль: afwVirtualCanvas - Теперь L3        }
{ Начат: 21.11.2005 08:38            }
{ $Id: l3VirtualCanvas.pas,v 1.15 2012/05/12 13:28:02 kostitsin Exp $ }

// $Log: l3VirtualCanvas.pas,v $
// Revision 1.15  2012/05/12 13:28:02  kostitsin
// [$362130929]
//
// Revision 1.14  2011/05/17 14:55:22  lulin
// {RequestLink:266409354}.
//
// Revision 1.13  2010/12/29 18:06:51  lulin
// {RequestLink:172988589}.
//
// Revision 1.12  2010/12/08 19:04:29  lulin
// {RequestLink:228688602}.
// - закругляем край у строки ввода.
//
// Revision 1.11  2009/07/02 15:26:46  lulin
// - выделяем базового предка.
//
// Revision 1.10  2009/07/01 14:04:07  lulin
// - убрана ненужная функциональность.
//
// Revision 1.9  2008/08/25 13:32:51  lulin
// - чистка кода.
//
// Revision 1.8  2008/03/19 13:40:58  lulin
// - <K>: 87589297.
//
// Revision 1.7  2008/02/27 17:25:04  lulin
// - подгоняем код под модель.
//
// Revision 1.6  2007/08/27 16:24:29  lulin
// - не инициализировалась секция размерами канвы. В результате форматировались по неправильной ширине (CQ OIT5-26509, <K>-40763690).
//
// Revision 1.5  2007/02/09 13:12:11  oman
// - fix: При рисовании на виртуальной канве неверно возвращали
//  размер канвы
//
// Revision 1.4  2006/11/27 10:06:54  lulin
// - cleanup.
//
// Revision 1.3  2006/10/11 14:40:56  lulin
// - не запоминали текущий правый нижний угол. Сейчас - запиминаем. Код вроде правильный, но от ошибок почему-то не избавил - ЦК22945, 22952, 22867, 22937, 22939, 22981.
//
// Revision 1.2  2006/09/25 08:55:16  lulin
// - автоматизирован процесс подсчета размеров листьевых параграфов.
//
// Revision 1.1  2006/09/22 06:01:30  oman
// - fix: VirtualCanvas переехал из _afw в l3
//
// Revision 1.6  2006/02/26 12:09:55  lulin
// - при показе курсора используем его координаты в пикселях.
//
// Revision 1.5  2006/02/14 12:12:35  lulin
// - облегчаем функциональность виртуальной канвы.
//
// Revision 1.4  2006/02/14 11:46:22  lulin
// - облегчаем функциональность виртуальной канвы.
//
// Revision 1.3  2006/02/14 10:35:26  lulin
// - виртуальная канва теперь обходится без изпользования метафайла.
//
// Revision 1.2  2006/02/14 09:21:24  lulin
// - для виртуальной канвы не вызываем реальной функции рисования.
//
// Revision 1.1  2005/11/21 05:50:00  lulin
// - виртуальная канва перенесена в отдельный модуль.
//

{$Include l3Define.inc }

interface

uses
  Types,
  
  Graphics,

  l3Interfaces,
  l3Types,
  l3Units,
  l3InternalInterfaces,
  l3Canvas
  ;

type
  Tl3VirtualCanvas = class(Tl3Canvas)
    private
    // internal fields
      f_Extent : Tl3Point;
    protected
    // internal methods
      function DoGetPaperWidth: Tl3Inch;
        override;
        {-}
      function DoGetPageSetupWidth: Tl3Inch;
        override;
        {-}
      function DoGetPageSetupHeight: Tl3Inch;
        override;
        {-}
      function  pm_GetGlobalClipRect: Tl3Rect;
        override;
        {-}
      function  DoGetClientRect: Tl3Rect;
        override;
        {-}
      function  GetPrinting: Boolean;
        override;
        {-}
      function  IsVirtual: Boolean;
        override;
        {-}
      procedure SetCanvas(Value: TCanvas; Alien: Boolean);
        override;
        {-}
      class function IsCacheable: Boolean;
        override;
        {-}
      procedure FillRectPrim(const R: TRect);
        override;
        {-}
      procedure FillEmptyRect(const R: Tl3Rect);
        override;
        {-}
      procedure FillEmptyRect(const R: Tl3SRect);
        override;
        {-}
      procedure DoAddRectPrim(const aRect: Tl3SRect);
        override;
        {-}
      procedure AddRgn(const aRgn: Il3Region);
        override;
        {-}
      function  KerningTextExtent(const S : Tl3PCharLenPrim): Tl3Point;
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(const anExtent: Tl3_Point);
        reintroduce;
        virtual;
        {-}
      class function Make(const anExtent: Tl3_Point): Il3Canvas;
        {-}
  end;//Tl3VirtualCanvas

implementation

uses
  l3Base,
  l3CanvasPrim
  ;

// start class Tl3VirtualCanvas

constructor Tl3VirtualCanvas.Create(const anExtent: Tl3_Point);
  //override;
  {-}
begin
 f_Extent := Tl3Point(anExtent);
 inherited Create;
 SectionExtent := l3Point(f_Extent.X, SectionExtent.Y);
 BeginPaint;
 DrawEnabled := true;
 MakeScreenDC;
end;

class function Tl3VirtualCanvas.Make(const anExtent: Tl3_Point): Il3Canvas;
  {-}
var
 l_Canvas : Tl3VirtualCanvas;
begin
 l_Canvas := Create(anExtent);
 try
  Result := l_Canvas;
 finally
  l3Free(l_Canvas);
 end;//try..finally
end;

procedure Tl3VirtualCanvas.Cleanup;
  //override;
  {-}
begin
 EndPaint;
 inherited;
end;

procedure Tl3VirtualCanvas.FillRectPrim(const R: TRect);
  //override;
  {-}
begin
end;

procedure Tl3VirtualCanvas.FillEmptyRect(const R: Tl3Rect);
  //override;
  {-}
begin
 RecordRegionBottomPrim(LR2DR(R.SubPt(WindowOrg)).BottomRight);
end;

procedure Tl3VirtualCanvas.FillEmptyRect(const R: Tl3SRect);
  //override;
  {-}
begin
 RecordRegionBottomPrim(R.SubPt(SWindowOrg).BottomRight);
end;

procedure Tl3VirtualCanvas.DoAddRectPrim(const aRect: Tl3SRect);
  //override;
  {-}
begin
end;

procedure Tl3VirtualCanvas.AddRgn(const aRgn: Il3Region);
  //override;
  {-}
begin
end;

function Tl3VirtualCanvas.KerningTextExtent(const S : Tl3PCharLenPrim): Tl3Point;
  //override;
  {-}
begin
 Result := TextExtent(S);
end;

class function Tl3VirtualCanvas.IsCacheable: Boolean;
  //override;
  {-}
begin
 Result := true;
end;

function Tl3VirtualCanvas.pm_GetGlobalClipRect: Tl3Rect;
  //override;
  {-}
begin
 Result := DoGetClientRect;
end;

function Tl3VirtualCanvas.DoGetClientRect: Tl3Rect;
  //override;
  {-}
begin
 Result := l3RectBnd(l3Point0, f_Extent);
end;

function Tl3VirtualCanvas.GetPrinting: Boolean;
  //override;
  {-}
begin
 Result := false;//true;
end;

function Tl3VirtualCanvas.IsVirtual: Boolean;
  //override;
  {-}
begin
 Result := true;
end;

procedure Tl3VirtualCanvas.SetCanvas(Value: TCanvas; Alien: Boolean);
  //override;
  {-}
begin
 if (f_DCFlag = ev_dcfLinked) then
  SetDC(0, ev_dcfCanvas);
 inherited;
end;

function Tl3VirtualCanvas.DoGetPaperWidth: Tl3Inch;
  //override;
  {-}
begin
 Result := f_Extent.X;
end;

function Tl3VirtualCanvas.DoGetPageSetupWidth: Tl3Inch;
begin
 Result := f_Extent.X;
end;

function Tl3VirtualCanvas.DoGetPageSetupHeight: Tl3Inch;
begin
 Result := f_Extent.Y;
end;

end.

