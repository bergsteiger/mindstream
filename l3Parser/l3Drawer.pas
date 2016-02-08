unit l3Drawer;

{ "”ниверсальный отрисовщик", использующий по возможности функции GDI+ }

{ $Id: l3Drawer.pas,v 1.19 2015/06/02 17:05:54 lulin Exp $ }

// $Log: l3Drawer.pas,v $
// Revision 1.19  2015/06/02 17:05:54  lulin
// - рисуем на модели.
//
// Revision 1.18  2011/05/18 12:09:16  lulin
// {RequestLink:266409354}.
//
// Revision 1.17  2011/02/01 16:12:17  lulin
// {RequestLink:252512758}.
//
// Revision 1.16  2011/02/01 15:37:32  lulin
// {RequestLink:252512758}.
// - рисуем закруглЄнный край.
//
// Revision 1.15  2011/02/01 12:45:36  lulin
// {RequestLink:252512758}.
// - рисуем рамку региона средствами GDI+.
//
// Revision 1.14  2011/01/31 18:47:58  lulin
// {RequestLink:252512758}.
// - инкапсулируем метод рисовани€ рамки вокруг региона в утилитый объект.
//
// Revision 1.13  2009/06/26 07:23:15  lulin
// - удалена лишн€€ переменна€.
//
// Revision 1.12  2009/03/25 13:57:09  lulin
// [$140281673]. ќткручиваем от DLL дл€ сервера использование GDI+.
//
// Revision 1.11  2008/08/05 13:08:25  lulin
// - <K>: 99221842.
//
// Revision 1.10  2008/07/15 19:06:59  lulin
// - пытаемс€ боротьс€ с рисованием за пределами области отсечени€, <K>: 99221842.
//
// Revision 1.9  2008/06/27 10:08:17  lulin
// - bug fix: знак корн€ иногда рисовалс€ неправильнам цветом, т.к. в GDI+ компоненты цвета переставлены местами относительно GDI.
//
// Revision 1.8  2008/06/26 10:50:50  lulin
// - написан комментарий.
//
// Revision 1.7  2008/01/18 10:31:16  fireton
// -bug fix: не учитывалс€ тот факт, что при изменении стил€ кисти может сброситьс€ ее цвет
//
// Revision 1.6  2007/11/13 10:23:27  lulin
// - cleanup.
//
// Revision 1.5  2007/11/13 09:53:17  lulin
// - bug fix: не освобождались объекты.
//
// Revision 1.4  2007/11/13 09:42:12  lulin
// - избавл€емс€ от предупреждени€ компил€тора.
//
// Revision 1.3  2007/11/12 17:28:31  lulin
// - пр€чем ненужное свойство.
//
// Revision 1.2  2007/11/08 13:23:55  fireton
// - упразднил l3_dmAuto
//
// Revision 1.1  2007/11/06 09:34:31  fireton
// - отрисовка формул с применением GDI+
//

interface

{$Include l3Define.inc}

uses
  Windows,
  Graphics,

  {$IfNDef noGDIPlus}
  GDIPOBJ,
  {$EndIf  noGDIPlus}

  l3Base,
  l3ProtoObject
  ;

type
 Tl3DrawerMode = ({$IfNDef noGDIPlus}
                  l3_dmGDIPlus,
                  {$EndIf  noGDIPlus}
                  l3_dmGDI);

type
 Tl3Drawer = class(Tl3ProtoObject)
 private
  f_Canvas     : TCanvas;
  {$IfNDef noGDIPlus}
  f_GPGraphics : TGPGraphics;
  f_GPPen      : TGPPen;
  f_GPBrush    : TGPSolidBrush;
  {$EndIf  noGDIPlus}
  f_Mode: Tl3DrawerMode;
  f_FreeCanvas : Boolean;
  function AutoDetectDrawMode: Tl3DrawerMode;
  procedure pm_SetCanvas(const Value: TCanvas);
  procedure FreeGDIPlusObjects;
  procedure InitGDIPlusObjects;
  function pm_GetPenColor: TColor;
  function pm_GetBrushColor: TColor;
  procedure pm_SetPenColor(const Value: TColor);
  procedure pm_SetBrushColor(const Value: TColor);
 protected
 // internal methods
  procedure Cleanup;
    override;
    {-}
 public
  // methods
  constructor Create(aCanvas: TCanvas; aMode: Tl3DrawerMode = {$IfNDef noGDIPlus}l3_dmGDIPlus{$Else}l3_dmGDI{$EndIf});
    reintroduce;
    overload;
  constructor Create(aDC : HDC; aMode: Tl3DrawerMode = {$IfNDef noGDIPlus}l3_dmGDIPlus{$Else}l3_dmGDI{$EndIf});
    reintroduce;
    overload;
  procedure DrawLine(const X1, Y1, X2, Y2: Integer);
  procedure DrawEllipse(const X1, Y1, X2, Y2: Integer);
  procedure DrawRect(const X1, Y1, X2, Y2: Integer);
  procedure DrawPolygon(const Points: array of TPoint);
  procedure FillEllipse(const X1, Y1, X2, Y2: Integer);
  procedure FillRect(const X1, Y1, X2, Y2: Integer);
  procedure FillPolygon(const Points: array of TPoint);
  procedure FrameRegion(aRgn : HRgn; aFrameWidth : Integer; aColor : TColor);
  procedure FillRegion(aRgn : HRgn; aColor : TColor);
  procedure DrawArc(x, y, width, height, startAngle, sweepAngle: Single; aFrameWidth : Integer; aColor : TColor);
 protected
  // properties
  property Canvas: TCanvas read f_Canvas write pm_SetCanvas;
 public
  // properties
  property PenColor: TColor read pm_GetPenColor write pm_SetPenColor;
  property BrushColor: TColor read pm_GetBrushColor write pm_SetBrushColor;
  property Mode: Tl3DrawerMode read f_Mode;
 end;//Tl3Drawer

implementation

uses
  SysUtils,

  {$IfNDef noGDIPlus}
  GDIPAPI,
  {$EndIf  noGDIPlus}

  l3Canvas
  ;

{$IfNDef noGDIPlus}
function ColorToGPColor(aColor: TColor): TGPColor;
var
 R : TRGB absolute aColor;
begin
 aColor := ColorToRGB(aColor);
 Result := MakeColor(R.R, R.G, R.B);
end;
{$EndIf  noGDIPlus}

// start class Tl3Drawer

constructor Tl3Drawer.Create(aCanvas: TCanvas; aMode: Tl3DrawerMode);
begin
 inherited Create;
 {$IfNDef noGDIPlus}
 if aMode = l3_dmGDIPlus then
  f_Mode := AutoDetectDrawMode
 else
 {$EndIf  noGDIPlus}
  f_Mode := aMode;
 Canvas := aCanvas;
 f_FreeCanvas := false;
end;

constructor Tl3Drawer.Create(aDC : HDC; aMode: Tl3DrawerMode = {$IfNDef noGDIPlus}l3_dmGDIPlus{$Else}l3_dmGDI{$EndIf});
  //reintroduce;
  //overload;
var
 l_Canvas : TCanvas;
begin
 l_Canvas := TCanvas.Create;
 l_Canvas.Handle := aDC;
 Create(l_Canvas, aMode);
 f_FreeCanvas := true;
end;
  
procedure Tl3Drawer.Cleanup;
  //override;
  {-}
begin
 FreeGDIPlusObjects;
 if f_FreeCanvas then
  FreeAndNil(f_Canvas); 
 inherited;
end;

function Tl3Drawer.AutoDetectDrawMode: Tl3DrawerMode;
begin
 {$IfDef Nemesis}
 if (Win32Platform = VER_PLATFORM_WIN32_NT) AND (Win32MajorVersion < 6) then
  Result := l3_dmGDI
 else
 {$EndIf Nemesis}
 {$IfNDef noGDIPlus}
 if IsGDIPlus then
  Result := l3_dmGDIPlus
 else
 {$EndIf  noGDIPlus}
  Result := l3_dmGDI;
end;

procedure Tl3Drawer.DrawEllipse(const X1, Y1, X2, Y2: Integer);
var
 l_OldBrushStyle: TBrushStyle;
 l_OldBrushColor: TColor;
begin
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus: f_GPGraphics.DrawEllipse(f_GPPen, X1, Y1, X2-X1, Y2-Y1);
  {$EndIf  noGDIPlus}
  l3_dmGDI:
   with f_Canvas do
   begin
    l_OldBrushStyle := Brush.Style;
    l_OldBrushColor := Brush.Color;
    try
     Brush.Style := bsClear;
     Ellipse(X1, Y1, X2, Y2);
    finally
     Brush.Style := l_OldBrushStyle;
     Brush.Color := l_OldBrushColor;
    end;
   end;
 end;
end;

procedure Tl3Drawer.DrawRect(const X1, Y1, X2, Y2: Integer);
var
 l_OldBrushStyle: TBrushStyle;
 l_OldBrushColor: TColor;
begin
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus: f_GPGraphics.DrawRectangle(f_GPPen, X1, Y1, X2-X1, Y2-Y1);
  {$EndIf  noGDIPlus}
  l3_dmGDI:
   with f_Canvas do
   begin
    l_OldBrushStyle := Brush.Style;
    l_OldBrushColor := Brush.Color;
    try
     Brush.Style := bsClear;
     Rectangle(X1, Y1, X2, Y2);
    finally
     Brush.Style := l_OldBrushStyle;
     Brush.Color := l_OldBrushColor;
    end;
   end;
 end;
end;

procedure Tl3Drawer.DrawLine(const X1, Y1, X2, Y2: Integer);
begin
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus: f_GPGraphics.DrawLine(f_GPPen, X1, Y1, X2, Y2);
  {$EndIf  noGDIPlus}
  l3_dmGDI:
   with f_Canvas do
   begin
    MoveTo(X1, Y1);
    LineTo(X2, Y2);
   end;
 end;
end;

procedure Tl3Drawer.DrawPolygon(const Points: array of TPoint);
var
 l_OldBrushStyle: TBrushStyle;
 l_OldBrushColor: TColor;
begin
 {$IfNDef noGDIPlus}
 Assert(SizeOf(TPoint) = SizeOf(TGPPoint));
 {$EndIf  noGDIPlus}
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus: f_GPGraphics.DrawPolygon(f_GPPen, PGPPoint(@Points), High(Points) + 1);
  {$EndIf  noGDIPlus}
  l3_dmGDI:
   with f_Canvas do
   begin
    l_OldBrushStyle := Brush.Style;
    l_OldBrushColor := Brush.Color; // потому что, сбрасыва€ стиль, мы сбрасываем и цвет (долбанный WinAPI)
    try
     Brush.Style := bsClear;
     Polygon(Points);
    finally
     Brush.Style := l_OldBrushStyle;
     Brush.Color := l_OldBrushColor;
    end;
   end;
 end;
end;

procedure Tl3Drawer.FillEllipse(const X1, Y1, X2, Y2: Integer);
var
 l_OldBrushStyle: TBrushStyle;
 l_OldPenColor: TColor;
begin
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus: f_GPGraphics.FillEllipse(f_GPBrush, X1, Y1, X2-X1, Y2-Y1);
  {$EndIf  noGDIPlus}
  l3_dmGDI:
   with f_Canvas do
   begin
    l_OldBrushStyle := Brush.Style;
    l_OldPenColor := Pen.Color;
    try
     Brush.Style := bsSolid;
     Pen.Color := BrushColor;
     Ellipse(X1, Y1, X2, Y2);
    finally
     Pen.Color := l_OldPenColor;
     Brush.Style := l_OldBrushStyle;
    end;
   end;
 end;
end;

procedure Tl3Drawer.FillRect(const X1, Y1, X2, Y2: Integer);
var
 l_OldBrushStyle: TBrushStyle;
 l_OldPenColor: TColor;
begin
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus: f_GPGraphics.FillRectangle(f_GPBrush, X1, Y1, X2-X1, Y2-Y1);
  {$EndIf  noGDIPlus}
  l3_dmGDI:
   with f_Canvas do
   begin
    l_OldBrushStyle := Brush.Style;
    l_OldPenColor := Pen.Color;
    try
     Brush.Style := bsSolid;
     Pen.Color := BrushColor;
     Rectangle(X1, Y1, X2, Y2);
    finally
     Pen.Color := l_OldPenColor;
     Brush.Style := l_OldBrushStyle;
    end;
   end;
 end;
end;

procedure Tl3Drawer.FillPolygon(const Points: array of TPoint);
var
 l_OldBrushStyle : TBrushStyle;
 l_OldBrushColor : TColor;
 l_OldPenColor   : TColor;
begin
 {$IfNDef noGDIPlus}
 Assert(SizeOf(TPoint) = SizeOf(TGPPoint));
 {$EndIf  noGDIPlus}
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus: f_GPGraphics.FillPolygon(f_GPBrush, PGPPoint(@Points), High(Points) + 1);
  {$EndIf  noGDIPlus}
  l3_dmGDI:
   with f_Canvas do
   begin
    l_OldBrushStyle := Brush.Style;
    l_OldBrushColor := Brush.Color;
    l_OldPenColor := Pen.Color;
    try
     Brush.Style := bsSolid;
     Pen.Color   := BrushColor;
     Polygon(Points);
    finally
     Brush.Style := l_OldBrushStyle;
     Brush.Color := l_OldBrushColor;
     Pen.Color   := l_OldPenColor;
    end;
   end;
 end;
end;

procedure Tl3Drawer.FrameRegion(aRgn : HRgn; aFrameWidth : Integer; aColor : TColor);

 {$IfNDef noGDIPlus}
 procedure DrawViaGDIPlus;
 var
//  l_M : TGPMatrix;
  l_R : TGPRegion;
(*  l_Count : Integer;
  l_Rects : PGPRect;
  l_Path  : TGPGraphicsPath;
  l_Pen    : TGPPen;*)
  l_B      : TGPRect;
 begin//DrawViaGDIPlus
  l_R := TGPRegion.Create(aRgn);
  try
   l_R.GetBounds(l_B, f_GPGraphics);
   Inc(aFrameWidth);
   l_B.X := l_B.X + aFrameWidth;
   l_B.Y := l_B.Y + aFrameWidth;
   l_B.Width := l_B.Width - 2 * aFrameWidth;
   l_B.Height := l_B.Height - 2 * aFrameWidth;
   if (l_R.Exclude(l_B) <> OK) then
    Assert(false);
   f_GPBrush.SetColor(ColorToGPColor(aColor));
   f_GPGraphics.FillRegion(f_GPBrush, l_R);
(*   Exit;*)
(*   l_M := TGPMatrix.Create;
   try
    if (f_GPGraphics.GetTransform(l_M) <> OK) then
     Assert(false);
    l_Count := l_R.GetRegionScansCount(l_M);
    if (l_Count > 0) then
    begin
     GetMem(l_Rects, l_Count * SizeOf(TGPRect));
     try
      if (l_R.GetRegionScans(l_M, l_Rects, l_Count) <> OK) then
       Assert(false);
      l_Path := TGPGraphicsPath.Create;
      try
       if (l_Path.AddRectangles(l_Rects, l_Count) <> OK) then
        Assert(false);
       l_Path.Flatten; 
       l_Pen := TGPPen.Create(ColorToGPColor(aColor), aFrameWidth);
       try
        f_GPGraphics.DrawPath(l_Pen, l_Path);
       finally
        FreeAndNil(l_Pen);
       end;//try..finally
      finally
       FreeAndNil(l_Path);
      end;//try..finally
     finally
      FreeMem(l_Rects);
     end;//try..finally
    end;//l_Count > 0
   finally
    FreeAndNil(l_M);
   end;//try..finally*)
  finally
   FreeAndNil(l_R);
  end;//try..finally
 end;//DrawViaGDIPlus
 {$EndIf  noGDIPlus}

var
 l_DC : hDC;
 LBR  : TLogBrush;
 ABR  : HBRUSH;
 OBR  : HBRUSH;
begin
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus:
   DrawViaGDIPlus;
  {$EndIf  noGDIPlus}
  l3_dmGDI:
  begin
   l_DC := Canvas.Handle;
   Lbr.lbStyle := BS_SOLID;
   Lbr.lbColor := ColorToRgb(aColor);
   Lbr.lbHatch := 0;
   ABR := CreateBrushIndirect(Lbr);
   try
    OBR := SelectObject(l_DC, ABR);
    try
     FrameRgn(l_DC, aRgn, ABR, aFrameWidth, aFrameWidth);
    finally
     SelectObject(l_DC, OBR);
    end;//try..finally
   finally
    DeleteObject(ABR);
   end;//try..finally
  end;//l3_dmGDI
 end;//case f_Mode
end;

procedure Tl3Drawer.FillRegion(aRgn : HRgn; aColor : TColor);

 {$IfNDef noGDIPlus}
 procedure DrawViaGDIPlus;
 var
  l_R : TGPRegion;
 begin//DrawViaGDIPlus
  l_R := TGPRegion.Create(aRgn);
  try
   f_GPBrush.SetColor(ColorToGPColor(aColor));
   f_GPGraphics.FillRegion(f_GPBrush, l_R);
  finally
   FreeAndNil(l_R);
  end;//try..finally
 end;//DrawViaGDIPlus
 {$EndIf  noGDIPlus}

var
 LBR  : TLogBrush;
 ABR  : HBRUSH;
 OBR  : HBRUSH;
 l_DC : hDC;
begin
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus:
   DrawViaGDIPlus;
  {$EndIf  noGDIPlus}
  l3_dmGDI:
  begin
   l_DC := Canvas.Handle;
   Lbr.lbStyle := BS_SOLID;
   Lbr.lbColor := ColorToRgb(aColor);
   Lbr.lbHatch := 0;
   ABR := CreateBrushIndirect(Lbr);
   try
    OBR := SelectObject(l_DC, ABR);
    try
     FillRgn(l_DC, aRgn, ABR);
    finally
     SelectObject(l_DC, OBR);
    end;//try..finally
   finally
    DeleteObject(ABR);
   end;//try..finally
  end;//l3_dmGDI
 end;//case f_Mode
end;

procedure Tl3Drawer.DrawArc(x, y, width, height, startAngle, sweepAngle: Single; aFrameWidth : Integer; aColor : TColor);

 {$IfNDef noGDIPlus}
 procedure DrawViaGDIPlus;
 var
  l_Pen    : TGPPen;
 begin
  l_Pen := TGPPen.Create(ColorToGPColor(aColor), aFrameWidth);
  try
   f_GPGraphics.DrawArc(l_Pen, x, y, width, height, startAngle, sweepAngle);
  finally
   FreeAndNil(l_Pen);
  end;//try..finally
 end;
 {$EndIf  noGDIPlus}

begin
 case f_Mode of
  {$IfNDef noGDIPlus}
  l3_dmGDIPlus:
   DrawViaGDIPlus;
  {$EndIf  noGDIPlus}
  l3_dmGDI:
  begin
  end;//l3_dmGDI
 end;//case f_Mode
end;

procedure Tl3Drawer.FreeGDIPlusObjects;
begin
 {$IfNDef noGDIPlus}
 l3Free(f_GPGraphics);
 l3Free(f_GPPen);
 l3Free(f_GPBrush);
 {$EndIf  noGDIPlus}
end;

procedure Tl3Drawer.InitGDIPlusObjects;
{$IfNDef noGDIPlus}
var
 l_R   : TRect;
 l_GPR : TGPRect;
{$EndIf  noGDIPlus}
begin
 {$IfNDef noGDIPlus}
 if (f_Mode <> l3_dmGDIPlus) or (not Assigned(f_Canvas)) then
  Exit;
 f_GPGraphics := TGPGraphics.Create(f_Canvas.Handle);
 f_GPGraphics.SetSmoothingMode(SmoothingModeAntiAlias);
 f_GPPen := TGPPen.Create(ColorToGPColor(f_Canvas.Pen.Color), f_Canvas.Pen.Width);
 f_GPBrush := TGPSolidBrush.Create(ColorToGPColor(f_Canvas.Brush.Color));
 f_GPGraphics.SetPageUnit(UnitPixel);
 GetClipBox(f_Canvas.Handle, l_R);
 l_GPR.X := l_R.Left;
 l_GPR.Y := l_R.Top;
 l_GPR.Width := l_R.Right - l_R.Left;
 l_GPR.Height := l_R.Bottom - l_R.Top;
 f_GPGraphics.SetClip(l_GPR)
 {$EndIf noGDIPlus}
end;

function Tl3Drawer.pm_GetPenColor: TColor;
{$IfNDef noGDIPlus}
var
 l_GPColor: TGPColor;
{$EndIf  noGDIPlus}
begin
 Result := 0;
 {$IfNDef noGDIPlus}
 if (f_Mode = l3_dmGDIPlus) and Assigned(f_GPPen) then
 begin
  f_GPPen.GetColor(l_GPColor);
  Result := l_GPColor or $00FFFFFF; // strip "alpha" part
 end
 else
 {$EndIf noGDIPlus}
 if Assigned(f_Canvas) then
  Result := f_Canvas.Pen.Color;
end;

function Tl3Drawer.pm_GetBrushColor: TColor;
{$IfNDef noGDIPlus}
var
 l_GPColor: TGPColor;
{$EndIf noGDIPlus}
begin
 Result := 0;
 {$IfNDef noGDIPlus}
 if (f_Mode = l3_dmGDIPlus) and Assigned(f_GPBrush) then
 begin
  f_GPBrush.GetColor(l_GPColor);
  Result := l_GPColor and $00FFFFFF; // strip "alpha" part
 end
 else
 {$EndIf noGDIPlus}
 if Assigned(f_Canvas) then
  Result := f_Canvas.Brush.Color;
end;

procedure Tl3Drawer.pm_SetCanvas(const Value: TCanvas);
begin
 if f_Canvas <> Value then
 begin
  FreeGDIPlusObjects;
  f_Canvas := Value;
  InitGDIPlusObjects;
 end;
end;

procedure Tl3Drawer.pm_SetPenColor(const Value: TColor);
begin
 {$IfNDef noGDIPlus}
 if (f_Mode = l3_dmGDIPlus) and Assigned(f_GPPen) then
  f_GPPen.SetColor(ColorToGPColor(Value))
 else
 {$EndIf  noGDIPlus}
 if Assigned(f_Canvas) then
  f_Canvas.Pen.Color := Value;
end;

procedure Tl3Drawer.pm_SetBrushColor(const Value: TColor);
begin
 {$IfNDef noGDIPlus}
 if (f_Mode = l3_dmGDIPlus) and Assigned(f_GPBrush) then
  f_GPBrush.SetColor(ColorToGPColor(Value))
 else
 {$EndIf  noGDIPlus}
 if Assigned(f_Canvas) then
  f_Canvas.Brush.Color := Value; 
end;

end.
