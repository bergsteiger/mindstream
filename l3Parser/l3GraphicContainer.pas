unit l3GraphicContainer;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3GraphicContainer -        }
{ Начат: 22.10.2007 15:11             }
{ $Id: l3GraphicContainer.pas,v 1.20 2014/03/12 11:45:41 lulin Exp $ }

// $Log: l3GraphicContainer.pas,v $
// Revision 1.20  2014/03/12 11:45:41  lulin
// - выделяем базового предка.
//
// Revision 1.19  2014/02/13 10:12:59  lulin
// - рефакторим безликие списки.
//
// Revision 1.18  2011/05/18 17:46:00  lulin
// {RequestLink:266409354}.
//
// Revision 1.17  2009/01/12 11:21:05  lulin
// - bug fix: был AV из-за непарности скобок добавления/удаления.
//
// Revision 1.16  2008/10/07 12:51:52  lulin
// - <K>: 120722459.
//
// Revision 1.15  2008/07/15 20:49:12  lulin
// - при рисовании формулы учитываем выделение.
//
// Revision 1.14  2008/07/15 20:23:35  lulin
// - при рисовании формулы учитываем выделение.
//
// Revision 1.13  2008/07/15 18:32:33  lulin
// - рефакторинг отрисовки формул - код обобщён.
//
// Revision 1.12  2008/07/15 17:12:03  lulin
// - обобщаем механизм кеширования.
// - кешируем и сбрасываем только те контейнеры, которые могут восстановиться.
//
// Revision 1.11  2008/07/15 16:53:43  lulin
// - продолжаем бороться с <K>: 102957837.
//
// Revision 1.10  2007/11/12 17:00:55  lulin
// - попытка рисования формул без кеширования (пока безуспешно).
//
// Revision 1.9  2007/11/12 14:40:09  lulin
// - выделены промежуточные классы.
//
// Revision 1.8  2007/10/22 13:51:33  lulin
// - метафайл копируем в буфер обмена напрямую, а не через битмап.
//
// Revision 1.7  2007/10/22 13:01:49  lulin
// - фабричный метод перенесен на базовый класс.
//
// Revision 1.6  2007/10/22 12:51:41  lulin
// - базовый контейнер теперь полностью реализует интерфейс картинки.
//
// Revision 1.5  2007/10/22 12:36:55  lulin
// - теперь контейнер умеет сам создавать/освобождать канву для заполнения.
//
// Revision 1.4  2007/10/22 12:25:03  lulin
// - еще обобщили код.
//
// Revision 1.3  2007/10/22 11:57:11  lulin
// - выделен еще один базовый контейнер графики.
//
// Revision 1.2  2007/10/22 11:37:03  lulin
// - недосохранили.
//
// Revision 1.1  2007/10/22 11:31:34  lulin
// - выделен базовый контейнер графики.
//

{$Include l3Define.inc }

interface

uses
  Classes,
  Graphics,

  l3Core,
  l3Units,
  l3Interfaces,
  l3InternalInterfaces,
  l3Base,
  l3ProtoObject,
  l3Variant
  ;

type
  Tl3PrimGraphicContainer = class(Tl3Variant{Tl3ProtoObject}, IUnknown, Il3Bitmap)
    protected
    // property methods
      function  pm_GetWidth: Integer;
        virtual;
        abstract;
        {-}
      function  pm_GetHeight: Integer;
        virtual;
        abstract;
        {-}
      function  pm_GetInchWidth: Integer;
        virtual;
        {-}
      function  pm_GetInchHeight: Integer;
        virtual;
        {-}
      procedure Il3Bitmap_AssignTo(P: TObject);
        virtual;
        abstract;
        {-}
      procedure Il3Bitmap_Assign(P: TPersistent);
        virtual;
        abstract;
        {-}
      function  IsMF: Boolean;
        virtual;
        {-}
      procedure Il3Bitmap.AssignTo = Il3Bitmap_AssignTo;
        {-}
      procedure Il3Bitmap.Assign = Il3Bitmap_Assign;
        {-}
    public
    // public methods
      class function Make: Il3Bitmap;
        {-}
      procedure SaveToClipboardFormat(var AFormat: Word; var AData: THandle; var APalette: HPALETTE);
        virtual;
        abstract;
        {-}
      procedure StretchDraw(const R: Tl3Rect; const aCanvas: Il3Canvas);
        virtual;
        abstract;
        {-}
    public
    // public properties
      property Width: Integer
        read pm_GetWidth;
        {-}
      property Height: Integer
        read pm_GetHeight;
        {-}
      property InchWidth: Integer
        read pm_GetInchWidth;
        {-}
      property InchHeight: Integer
        read pm_GetInchHeight;
        {-}
  end;//Tl3PrimGraphicContainer

  Tl3SizeableGraphicContainerPrim = class(Tl3PrimGraphicContainer)
    protected
    // internal fields
      f_Renderer : Il3Renderer;
    protected
    // property methods
      procedure pm_SetWidth(aValue: Integer);
        virtual;
        abstract;
        {-}
      procedure pm_SetHeight(aValue: Integer);
        virtual;
        abstract;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      procedure SetParams(const anExpr : Il3Renderer;
                          const aFont  : Il3Font);
        {-}
    public
    // public properties
      property Width: Integer
        read pm_GetWidth
        write pm_SetWidth;
        {-}
      property Height: Integer
        read pm_GetHeight
        write pm_SetHeight;
        {-}
  end;//Tl3SizeableGraphicContainerPrim

  Tl3SizeableGraphicContainer = class(Tl3SizeableGraphicContainerPrim)
    private
    // internal fields
      f_Width  : Integer;
      f_Height : Integer;
    protected
    // property methods
      function  pm_GetInchWidth: Integer;
        override;
        {-}
      function  pm_GetInchHeight: Integer;
        override;
        {-}
      function  pm_GetWidth: Integer;
        override;
      procedure pm_SetWidth(aValue: Integer);
        override;
        {-}
      function  pm_GetHeight: Integer;
        override;
      procedure pm_SetHeight(aValue: Integer);
        override;
        {-}
  end;//Tl3SizeableGraphicContainer

  Tl3GraphicContainer = class(Tl3SizeableGraphicContainerPrim)
    private
    // internal fields
      f_Graphic  : TGraphic;
    private
    // internal fields
      f_Width  : Integer;
      f_Height : Integer;
      f_RenderColor : TColor;
    protected
    // property methods
      function  pm_GetWidth: Integer;
        override;
      procedure pm_SetWidth(aValue: Integer);
        override;
        {-}
      function  pm_GetHeight: Integer;
        override;
      procedure pm_SetHeight(aValue: Integer);
        override;
        {-}
      procedure Il3Bitmap_Assign(P: TPersistent);
        override;
        {-}
      procedure Il3Bitmap_AssignTo(P: TObject);
        override;
        {-}
      procedure DropRendered;
        {-}
      procedure Cleanup;
        override;
        {-}  
    public
    // public methods
      function  Graphic: TGraphic;
        {-}
      function  MakeGraphic: TGraphic;
        virtual;
        abstract;
        {-}
      procedure StretchDraw(const R: Tl3Rect; const aCanvas: Il3Canvas);
        override;
        {-}
      procedure SaveToClipboardFormat(var AFormat: Word; var AData: THandle; var APalette: HPALETTE);
        override;
        {-}
      function  CanvasToFill: TCanvas;
        virtual;
        abstract;
        {-}
      procedure FreeCanvas(var C: TCanvas);
        virtual;
        abstract;
        {-}
  end;//Tl3GraphicContainer

implementation

uses
  SysUtils,
  
  l3ScreenIC,
  l3ObjectList,
  l3GraphicContainerStack
  ;

// start class Tl3PrimGraphicContainer  

class function Tl3PrimGraphicContainer.Make: Il3Bitmap;
  {-}
var
 l_B : Tl3PrimGraphicContainer;
begin
 l_B := Create;
 try
  Result := l_B;
 finally
  l3Free(l_B);
 end;//try..finally
end;

function Tl3PrimGraphicContainer.IsMF: Boolean;
  //virtual;
  {-}
begin
 Result := false;
end;

function Tl3PrimGraphicContainer.pm_GetInchWidth: Integer;
  {-}
begin
 Result := l3CrtIC.DP2LP(PointX(Width)).X;
end;

function Tl3PrimGraphicContainer.pm_GetInchHeight: Integer;
  {-}
begin
 Result := l3CrtIC.DP2LP(PointY(Height)).Y;
end;

procedure AddContainer(aCont: Tl3GraphicContainer);
var
 l_List : Tl3ObjectList;
begin
 l_List := Tl3GraphicContainerStack.Instance;
 if (l_List.IndexOf(aCont) >= 0) then
  Exit; 
 if (l_List.Count > 10) then
  Tl3GraphicContainer(l_List.First).DropRendered;
 l_List.Add(aCont);
end;

procedure RemoveContainer(aCont: Tl3GraphicContainer);
begin
 if Tl3GraphicContainerStack.Exists then
  Tl3GraphicContainerStack.Instance.Remove(aCont);
end;

// start class Tl3GraphicContainer

procedure Tl3GraphicContainer.Cleanup;
  //override;
  {-}
begin
 DropRendered;
 inherited;
end;

procedure Tl3GraphicContainer.DropRendered;
  {-}
begin
 if (f_Graphic <> nil) then
 begin
  RemoveContainer(Self);
  l3Free(f_Graphic);
 end;//f_Graphic <> nil
end;
  
function Tl3GraphicContainer.pm_GetWidth: Integer;
  {-}
begin
 if (f_Graphic <> nil) then
  Result := f_Graphic.Width
 else
  Result := f_Width;
end;

procedure Tl3GraphicContainer.pm_SetWidth(aValue: Integer);
  {-}
begin
 f_Width := aValue;
 if (f_Graphic <> nil) then
  f_Graphic.Width := aValue;
end;

function Tl3GraphicContainer.pm_GetHeight: Integer;
  {-}
begin
 if (f_Graphic <> nil) then
  Result := f_Graphic.Height
 else
  Result := f_Height;
end;

procedure Tl3GraphicContainer.pm_SetHeight(aValue: Integer);
  {-}
begin
 f_Height := aValue;
 if (f_Graphic <> nil) then
  f_Graphic.Height := aValue;
end;

procedure Tl3GraphicContainer.Il3Bitmap_Assign(P: TPersistent);
  //override;
  {-}
begin
 Graphic.Assign(P)
end;

procedure Tl3GraphicContainer.Il3Bitmap_AssignTo(P: TObject);
  //override;
  {-}
begin
 if (P Is TPersistent) then
  TPersistent(P).Assign(Graphic);
end;

function Tl3GraphicContainer.Graphic: TGraphic;
  {-}
var
 l_C : TCanvas;  
begin
 if (f_Graphic = nil) then
 begin
  f_Graphic := MakeGraphic;
  f_Graphic.Width := f_Width;
  f_Graphic.Height := f_Height;
  AddContainer(Self);
  if (f_Renderer <> nil) then
  begin
   l_C := CanvasToFill;
   try
    f_Renderer.Render(l_C, nil);
    f_RenderColor := clWhite;
   finally
    FreeCanvas(l_C);
   end;//try..finally
  end;//f_Renderer <> nil
 end;//f_Grapchic = nil)
 Result := f_Graphic;
end;

procedure Tl3GraphicContainer.StretchDraw(const R: Tl3Rect; const aCanvas: Il3Canvas);
  {-}
var
 l_C : TCanvas;  
begin
 if (f_Renderer <> nil) then
 begin
  aCanvas.EffectiveColors.CheckColors;
  if (f_RenderColor <> aCanvas.Canvas.Brush.Color) then
  begin
   f_RenderColor := aCanvas.Canvas.Brush.Color;
   l_C := CanvasToFill;
   try
    f_Renderer.Render(l_C, aCanvas.EffectiveColors);
   finally
    FreeCanvas(l_C);
   end;//try..finally
  end;//f_RenderColor <> aCanvas.Canvas.Brush.Color
 end;//f_Renderer <> nil
 aCanvas.StretchDraw(R, Graphic);
end;

procedure Tl3GraphicContainer.SaveToClipboardFormat(var AFormat: Word; var AData: THandle; var APalette: HPALETTE);
  {-}
begin
 Graphic.SaveToClipboardFormat(aFormat, aData, aPalette);
end;

// start class Tl3SizeableGraphicContainer

function Tl3SizeableGraphicContainer.pm_GetInchWidth: Integer;
  //override;
  {-}
begin
 Result := f_Width;
end;

function Tl3SizeableGraphicContainer.pm_GetInchHeight: Integer;
  //override;
  {-}
begin
 Result := f_Height;
end;

function Tl3SizeableGraphicContainer.pm_GetWidth: Integer;
  //override;
  {-}
begin
 Result := l3CrtIC.LP2DP(l3PointX(f_Width)).X;
end;

procedure Tl3SizeableGraphicContainer.pm_SetWidth(aValue: Integer);
  //override;
  {-}
begin
 f_Width := l3CrtIC.DP2LP(PointX(aValue)).X;
end;

function Tl3SizeableGraphicContainer.pm_GetHeight: Integer;
  //override;
  {-}
begin
 Result := l3CrtIC.LP2DP(l3PointY(f_Height)).Y;
end;

procedure Tl3SizeableGraphicContainer.pm_SetHeight(aValue: Integer);
  //override;
  {-}
begin
 f_Height := l3CrtIC.DP2LP(PointY(aValue)).Y;
end;

// start class Tl3SizeableGraphicContainerPrim

procedure Tl3SizeableGraphicContainerPrim.Cleanup;
  //override;
  {-}
begin
 inherited;
 f_Renderer := nil;
end;

procedure Tl3SizeableGraphicContainerPrim.SetParams(const anExpr : Il3Renderer;
                                            const aFont  : Il3Font);
  {-}
begin
 f_Renderer := anExpr;
 if (f_Renderer <> nil) then
  with f_Renderer.CalcExtent(aFont) do
  begin
   Width := X;
   Height := Y;
  end;//with f_Renderer.CalcExtent(aFont)
end;

end.

