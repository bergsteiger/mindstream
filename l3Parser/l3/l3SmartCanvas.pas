unit l3SmartCanvas;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3SmartCanvas -             }
{ Начат: 28.07.2005 20:34             }
{ $Id: l3SmartCanvas.pas,v 1.37 2012/11/01 09:42:57 lulin Exp $ }

// $Log: l3SmartCanvas.pas,v $
// Revision 1.37  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.36  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.35  2011/11/29 17:34:24  lulin
// {RequestLink:232098711}.
// - делим дерево редакций на группы.
//
// Revision 1.34  2011/03/18 14:38:59  lulin
// {RequestLink:257820387}.
// - чистим код.
// - пытаемся бороться с цветом кнопки в которую попадает мышь.
//
// Revision 1.33  2011/03/05 15:02:00  lulin
// {RequestLink:228688510}.
//
// Revision 1.32  2011/03/05 14:42:06  lulin
// {RequestLink:228688510}.
//
// Revision 1.31  2010/12/14 16:40:46  lulin
// {RequestLink:228688602}.
// - переносим правила работы в более подходящую карточку.
//
// Revision 1.30  2008/03/20 09:48:40  lulin
// - cleanup.
//
// Revision 1.29  2008/02/14 17:09:15  lulin
// - cleanup.
//
// Revision 1.28  2008/02/07 14:44:45  lulin
// - класс _Tl3LongintList переехал в собственный модуль.
//
// Revision 1.27  2007/12/24 13:25:49  lulin
// - модуль l3InternalInterfaces полностью перенесен на модель.
//
// Revision 1.26  2007/10/31 14:00:36  oman
// - fix: Неправильно вычисляли высоту иконки
//
// Revision 1.25  2007/05/15 13:33:48  lulin
// - bug fix: контролы неправильно рисовались в классической теме.
//
// Revision 1.24  2007/05/15 13:14:30  lulin
// - изменяем внешний вид стрелочек у выпадающих элементов (CQ OIT5-25211).
//
// Revision 1.23  2006/12/15 11:30:48  lulin
// - добавлена картинка со счетчиком ссылок.
//
// Revision 1.22  2006/09/14 13:08:30  oman
// clenup - убран лишний параметр
//
// Revision 1.21  2006/09/05 11:14:18  oman
// - fix: Более корректная отрисовка PictureLabel
//
// Revision 1.20  2006/06/01 14:11:02  dinishev
// Возможность частичной отрисовки рамки
//
// Revision 1.19  2006/05/24 07:38:55  dinishev
// Cleanup
//
// Revision 1.18  2006/04/26 15:49:04  dinishev
// Подправлена отрисовка иконки в пояснительном тексте
//
// Revision 1.17  2006/03/13 16:11:02  dinishev
// Убрана отрисовка кнопки для КЗ с консультациями
//
// Revision 1.16  2006/03/02 16:11:50  dinishev
// Bug fix: Портится КЗ при перемещении красной медали
//
// Revision 1.15  2006/03/02 07:10:58  lulin
// - откатил Димины изменения, из-за которых не собироалось.
//
// Revision 1.13  2005/11/24 16:37:25  dinishev
// Поддерживаем эффект прокрутки в подсказке
//
// Revision 1.12  2005/11/16 18:45:47  dinishev
// Упрощенный метод для рисования кнопок
//
// Revision 1.11  2005/10/11 16:16:22  dinishev
// Убрана лишняя закраска прямоугольника кнопки
//
// Revision 1.10  2005/10/06 17:09:53  dinishev
// Новая версия отрисовки текста в КЗ
//
// Revision 1.9  2005/10/06 16:15:39  dinishev
// Упрощенная отрисовка кнопки
//
// Revision 1.8  2005/09/28 12:18:47  dinishev
// Возможность рисовать задизейбленные иконки                
//
// Revision 1.7  2005/09/27 15:47:32  dinishev
// Cleanup
//
// Revision 1.6  2005/09/21 13:52:57  dinishev
// Поддержка свойства Enabled (текст в контролах не редакторуется, отрисовываются серым цветом (без заливки))
//
// Revision 1.5  2005/08/30 16:07:19  lulin
// - сделана директива для включения/выключения тем.
//
// Revision 1.4  2005/08/30 09:54:40  dinishev
// По другому сделана отрисовка иконок на кнопках.
//
// Revision 1.3  2005/08/10 16:21:10  dinishev
// no message
//
// Revision 1.2  2005/07/29 11:06:24  lulin
// - удален ненужный модуль.
//
// Revision 1.1  2005/07/28 18:47:21  lulin
// - реализован интерфейс Il3SmartCanvas.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3Types,
  l3Units,
  l3InternalInterfaces,
  l3LongintList,
  l3CacheableBase,

  l3Base,

  Graphics
  ;

type
  Tl3SmartCanvas = class(Tl3CacheableBase, Il3SmartCanvas)
    private
    // internal fields
      f_Canvas : Il3Canvas;
      f_BCs    : Tl3LongintList;
    protected
    // interface methods
      // Il3SmartCanvas
      procedure DrawEdit(const R          : Tl3SRect;
                         anEnabled        : Boolean;
                         aFocused         : Boolean;
                         aReadOnly        : Boolean;
                         anIs3D           : Boolean;
                         aPartDraw        : Boolean;      
                         var aBorderWidth : Integer);
        {* - Отрисовка поля редактора. }
      procedure DrawCheckOrRadio(aDrawCheck : Boolean;
                                 const R    : Tl3SRect;
                                 aState     : Tl3CheckBoxState;
                                 anEnabled  : Boolean;
                                 aFlat      : Boolean);
        {-}
      procedure DrawComboBox(const R   : Tl3SRect;
                             aBtnWidth : Integer;
                             anEnabled : Boolean;
                             aFocused  : Boolean;
                             aReadOnly : Boolean;
                             anIs3D    : Boolean;
                             aPartDraw : Boolean;      
                             aDown     : Boolean);
        {-}
      procedure DrawSpinEditBox(const R   : Tl3SRect;
                                aBtnWidth : Integer;
                                anEnabled : Boolean;
                                aFocused  : Boolean;
                                aReadOnly : Boolean;
                                aPartDraw : Boolean;
                                anIs3D    : Boolean);
        {-}
      procedure DrawButton(const ACaption  : Tl3PCharLen;
                           const R         : Tl3SRect;
                           anEnabled       : Boolean;
                           aFlat           : Boolean;
                           aTransparent    : Boolean;
                           aMouseInControl : Boolean;
                           aState          : Tl3ButtonState;
                           aColor          : Tl3Color;
                           const aImgList  : Il3ImageList;
                           aIndex    : Integer);
        {-}
      procedure DrawPictureButton(const aRect     : Tl3SRect;                                  
                                  aMouseInControl : Boolean;
                                  anEnabled       : Boolean;
                                  aState          : Tl3ButtonState;
                                  aColor          : Tl3Color;
                                  const aImgList  : Il3ImageList;
                                  aIndex    : Integer);
        {-} 
      procedure DrawHelpControl(const aRect      : Tl3SRect;
                                aColor           : Tl3Color;
                                const aImgList   : Il3ImageList;
                                aIndex     : Integer);
        {-} 
      procedure DrawSpinButtons(const R   : Tl3SRect;
                                anEnabled : Boolean;
                                aFlat     : Boolean);
        {-}
      procedure DrawElipsisEdit(const R           : Tl3SRect;
                                aBtnWidth         : Integer;
                                anEnabled         : Boolean;
                                aFocused          : Boolean;
                                aReadOnly         : Boolean;
                                anIs3D            : Boolean;
                                aPartDraw         : Boolean;
                                const aImgList    : Il3ImageList;
                                aImageIndex : Integer);
        {-}
      procedure DrawCollapsedPanel(const aCaption : Tl3PCharLen;
                                   var R          : Tl3SRect;
                                   anEnabled      : Boolean;
                                   aCollapsed     : Boolean;
                                   aUpper         : Boolean;
                                   aDown          : Boolean;
                                   aBtnVisible    : Boolean;
                                   aColor         : Tl3Color;
                                   anAlignment    : Tl3Alignment;
                                   const aImgList : Il3ImageList;
                                   aNeedFrame     : Boolean);
        {-}
    protected
    // internal methods
      procedure PushBC;
        {-}
      procedure PopBC;
        {-}
      procedure DrawButtonText(const aCaption : Tl3PCharLen;
                               aTextBounds    : Tl3SRect;
                               aState         : Tl3ButtonState;
                               aBiDiFlags     : LongInt;
                               anAlignment    : Tl3Alignment = l3_taCenter;
                               aColor         : Tl3Color = clBtnFace);
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(const aCanvas: Il3Canvas);
        reintroduce;
        {-}
      class function Make(const aCanvas: Il3Canvas): Il3SmartCanvas;
        reintroduce;
        {-}
    public
    // public properties
      property Canvas : Il3Canvas
        read f_Canvas;
        {-}
  end;//Tl3SmartCanvas

implementation

{$IfDef Delphi7}
 {$Define NeedThemes}
{$EndIf Delphi7}

uses
  Windows,

  SysUtils,
  
  Classes,
  
  {$IfDef NeedThemes}
  Themes,
  {$ENDIF NeedThemes}

  Controls,
  Buttons,
  ExtCtrls,

  l3String,
  l3MinMax,
  l3Bitmap,

  Types,

  ElVCLUtils
  ;

const
 DownStyles   : array[Boolean] of Integer = (BDR_RAISEDINNER, BDR_SUNKENOUTER);
 FillStyles   : array[Boolean] of Integer = (BF_MIDDLE, 0);
 FullRectEdge : array[Boolean] of Integer = (BF_RIGHT	or BF_BOTTOMLEFT,  BF_RECT);
 PictureSizes : array[Boolean] of Integer = (16, 32);
  
// start class Tl3SmartCanvas

constructor Tl3SmartCanvas.Create(const aCanvas: Il3Canvas);
  //reintroduce;
  {-}
begin
 Assert(aCanvas <> nil);
 inherited Create;
 f_Canvas := aCanvas;
end;

class function Tl3SmartCanvas.Make(const aCanvas: Il3Canvas): Il3SmartCanvas;
  //reintroduce;
  {-}
var
 l_Canvas : Tl3SmartCanvas;
begin
 l_Canvas := Create(aCanvas);
 try
  Result := l_Canvas;
 finally
  l3Free(l_Canvas);
 end;//try..finally
end;

procedure Tl3SmartCanvas.Cleanup;
  //override;
  {-}
begin
 l3Free(f_BCs);
 f_Canvas := nil;
 inherited;
end;

procedure Tl3SmartCanvas.PushBC;
  {-}
begin
 if (f_BCs = nil) then
  f_BCs := Tl3LongintList.Make;
 f_BCs.Add(Canvas.BackColor);
end;

procedure Tl3SmartCanvas.PopBC;
  {-}
begin
 with f_BCs do
  Canvas.BackColor := Tl3Color(Delete(Hi));
end;

const
 ActiveArray: array [Boolean] of Integer = (DFCS_INACTIVE, 0);
 DownArray: array [Boolean] of Integer = (0, DFCS_PUSHED);
 FlatArray: array [Boolean] of Integer = (0, DFCS_FLAT);
 ThemeBorderArray: array [Boolean] of Integer = (BDR_SUNKENOUTER, BDR_SUNKENINNER);
 ThemeFlatArray: array [Boolean] of Integer = (BF_FLAT, 0);
 Alignments: array[Tl3Alignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
 DefIconWidth  = 16;
 DefIconHeight = 16;
 
{.$DEFINE CHECKSUPPTHEMEAPP}
//Проверять флаг ThemesEnabled, а не ThemesAviliable, нужно исключительно для
//тестирование тем под приложением, с выключенными темами.

type
  THackThemeServices = class(TObject)
  private
    FNewComCtrls,
    FThemesAvailable,
    FUseThemes: Boolean;
  end;

function _TE: Boolean;
begin
 {$IFDEF CHECKSUPPTHEMEAPP}
 Result := ThemeServices.ThemesEnabled;
 {$ELSE}
 Result := ThemeServices.ThemesAvailable AND THackThemeServices(ThemeServices).FUseThemes;
 {$ENDIF CHECKSUPPTHEMEAPP}
end;

procedure Tl3SmartCanvas.DrawEdit(const R          : Tl3SRect;
                                  anEnabled        : Boolean;
                                  aFocused         : Boolean;
                                  aReadOnly        : Boolean;
                                  anIs3D           : Boolean;
                                  aPartDraw        : Boolean;
                                  var aBorderWidth : Integer);
  {-}
var
 l_FrameRect : Tl3SRect;
{$IfDef NeedThemes}
 Details: TThemedElementDetails;
{$ENDIF}
begin
{$IfDef NeedThemes}
 if _TE then
 begin
  if anEnabled then
   if AReadOnly then
    Details := ThemeServices.GetElementDetails(teEditTextReadOnly)
   else
    if AFocused then
     Details := ThemeServices.GetElementDetails(teEditTextFocused)
    else
     Details := ThemeServices.GetElementDetails(teEditTextNormal)
  else
   Details := ThemeServices.GetElementDetails(teEditTextDisabled);
  ThemeServices.DrawEdge(Canvas.DC, Details, R.R.WR, ThemeBorderArray[anIs3D],
    BF_RECT or ThemeFlatArray[anIs3D]);
  if anIs3D then
   aBorderWidth := 2
  else
   aBorderWidth := 1;
 end//_TE
 else
{$ENDIF NeedThemes} 
 begin
  if anIs3D then
  begin
   l_FrameRect := R;
   DrawEdge(Canvas.DC, l_FrameRect.R.WR, ThemeBorderArray[anEnabled], FullRectEdge[not aPartDraw]);   
   aBorderWidth := 2;
  end
  else
   aBorderWidth := 1;
 end;//_TE
end;

var
 FCheckWidth  : Integer;
 FCheckHeight : Integer;

procedure GetCheckSize;
begin
 with Tl3Bitmap.Create do
 try
  Handle := LoadBitmap(0, PChar(OBM_CHECKBOXES));
  FCheckWidth := Width div 4;
  FCheckHeight := Height div 3;
 finally
  Free;
 end;//try..finally
end;

procedure Tl3SmartCanvas.DrawCheckOrRadio(aDrawCheck : Boolean;
                                          const R    : Tl3SRect;
                                          aState     : Tl3CheckBoxState;
                                          anEnabled  : Boolean;
                                          aFlat      : Boolean);
  {-}
const
 RadioCheckArray: array [Boolean] of Integer = (DFCS_BUTTONRADIO, DFCS_BUTTONCHECK);
var
 DrawState      : Integer;
 DrawRect       : Tl3SRect;
 OldBrushStyle  : TBrushStyle;
 OldPenColor    : Tl3Color;
 Rgn, SaveRgn   : HRgn;
{$IfDef NeedThemes}
 ElementDetails : TThemedElementDetails;
{$ENDIF NeedThemes}
begin
 SaveRgn := 0;
 DrawRect.Left := R.Left + (R.Right - R.Left - FCheckWidth) div 2;
 DrawRect.Top := R.Top + (R.Bottom - R.Top - FCheckHeight) div 2;
 DrawRect.Right := DrawRect.Left + FCheckWidth;
 DrawRect.Bottom := DrawRect.Top + FCheckHeight;
 if AFlat then
 begin
  { Remember current clipping region }
  SaveRgn := CreateRectRgn(0, 0, 0, 0);
  GetClipRgn(Canvas.DC, SaveRgn);
  { Clip 3d-style checkbox to prevent flicker }
  with DrawRect do
   Rgn := CreateRectRgn(Left + 2, Top + 2, Right - 2, Bottom - 2);
  SelectClipRgn(Canvas.DC, Rgn);
  DeleteObject(Rgn);
 end;//if AFlat then

{$IfDef NeedThemes}
 if _TE then
 begin
  if aDrawCheck then
   case aState of
    l3_cbChecked:
     if anEnabled then
      ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxCheckedNormal)
     else
      ElementDetails :=
       ThemeServices.GetElementDetails(tbCheckBoxCheckedDisabled);
    l3_cbUnchecked:
     if anEnabled then
      ElementDetails :=
       ThemeServices.GetElementDetails(tbCheckBoxUncheckedNormal)
     else
      ElementDetails :=
       ThemeServices.GetElementDetails(tbCheckBoxUncheckedDisabled)
    else // cbGrayed
     if anEnabled then
      ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxMixedNormal)
     else
      ElementDetails :=
       ThemeServices.GetElementDetails(tbCheckBoxMixedDisabled);
   end//case aState
  else
   case AState of
    l3_cbChecked:
     if anEnabled then
      ElementDetails := ThemeServices.GetElementDetails(tbRadioButtonCheckedNormal)
     else
      ElementDetails :=
       ThemeServices.GetElementDetails(tbRadioButtonCheckedDisabled);
    l3_cbUnchecked:
     if anEnabled then
      ElementDetails :=
       ThemeServices.GetElementDetails(tbRadioButtonUncheckedNormal)
     else
      ElementDetails :=
       ThemeServices.GetElementDetails(tbRadioButtonUncheckedDisabled);
   end;//case AState
  ThemeServices.DrawElement(Canvas.DC, ElementDetails, R.R.WR);
 end//_TE
 else
{$ENDIF NeedThemes}
 begin
  case AState of
   l3_cbChecked:
    DrawState := RadioCheckArray[aDrawCheck] or DFCS_CHECKED;
   l3_cbUnchecked:
    DrawState := RadioCheckArray[aDrawCheck];
   else // cbGrayed
   if aDrawCheck then
    DrawState := DFCS_BUTTON3STATE or DFCS_CHECKED
   else
    DrawState := 0;
  end;//case AState
  if not anEnabled then
   DrawState := DrawState or DFCS_INACTIVE;
  DrawFrameControl(Canvas.DC, R.R.WR, DFC_BUTTON, DrawState);
 end;//ThemeServices.ThemesEnabled

 if AFlat then
 begin
  SelectClipRgn(Canvas.DC, SaveRgn);
  DeleteObject(SaveRgn);
  { Draw flat rectangle in-place of clipped 3d checkbox above }
  PushBC;
  try
   with Canvas.Canvas do
   begin
    OldBrushStyle := Brush.Style;
    OldPenColor := Pen.Color;
    Brush.Style := bsClear;
    Pen.Color := clBtnShadow;
    with DrawRect do
     Rectangle(Left + 1, Top + 1, Right - 1, Bottom - 1);
    Brush.Style := OldBrushStyle;
    Pen.Color := OldPenColor;
   end;//with Canvas.Canvas
  finally
   PopBC;
  end;//try..finally
 end;//AFlat
end;

procedure Tl3SmartCanvas.DrawComboBox(const R   : Tl3SRect;
                                      aBtnWidth : Integer;
                                      anEnabled : Boolean;
                                      aFocused  : Boolean;
                                      aReadOnly : Boolean;
                                      anIs3D    : Boolean;
                                      aPartDraw : Boolean;
                                      aDown     : Boolean);
  {-}
var
 l_EditRect    : Tl3SRect;
 l_BtnRect     : Tl3SRect;
{$IfDef NeedThemes}
 Details       : TThemedElementDetails;
{$ENDIF NeedThemes}
 l_BorderWidth : Integer;
begin
 l_EditRect := R;
 l_EditRect.Right := l_EditRect.Right - aBtnWidth;
 DrawEdit(R, anEnabled, aFocused, aReadOnly, anIs3D, aPartDraw, l_BorderWidth);
 if anIs3D then
  l_BtnRect := l3SRect(l_EditRect.Right + l_BorderWidth, R.Top + l_BorderWidth, 
    R.Right - l_BorderWidth, R.Bottom - l_BorderWidth)
 else
  l_BtnRect := l3SRect(l_EditRect.Right + l_BorderWidth, R.Top, 
    R.Right - l_BorderWidth, R.Bottom);
{$IfDef NeedThemes}
 if _TE then
 begin
(*  if anEnabled then
   if aDown then
    Details := ThemeServices.GetElementDetails(tcDropDownButtonPressed)
   else
   Details := ThemeServices.GetElementDetails(tcDropDownButtonNormal)
  else
    Details := ThemeServices.GetElementDetails(tcDropDownButtonDisabled);
  ThemeServices.DrawElement(Canvas.DC, Details, l_BtnRect.R.WR);*)
  if anEnabled then
  begin
   if aDown then
    Details := ThemeServices.GetElementDetails(tbPushButtonPressed)
   else
    Details := ThemeServices.GetElementDetails(tbPushButtonNormal);
  end//anEnabled
  else
   Details := ThemeServices.GetElementDetails(tbPushButtonDisabled);
  l_BtnRect.Left := l_BtnRect.Left - 3;  
  ThemeServices.DrawElement(Canvas.DC, Details, l_BtnRect.R.WR);
  //l_BtnRect.Left := l_BtnRect.Left + 1;  
  DrawArrow(Canvas.Canvas, eadDown, l_BtnRect.R.WR, clBlack, anEnabled);
 end//_TE
 else
{$ENDIF NeedThemes}
  DrawFrameControl(Canvas.DC, l_BtnRect.R.WR, DFC_SCROLL, DFCS_SCROLLDOWN or
    ActiveArray[anEnabled] or DownArray[aDown]);
end;

procedure Tl3SmartCanvas.DrawSpinEditBox(const R   : Tl3SRect;
                                         aBtnWidth : Integer;
                                         anEnabled : Boolean;
                                         aFocused  : Boolean;
                                         aReadOnly : Boolean;
                                         aPartDraw : Boolean;
                                         anIs3D    : Boolean);
  {-}
var
 l_EditRect    : Tl3SRect;
 l_BtnRect     : Tl3SRect;
 l_BorderWidth : Integer;
begin
 l_EditRect := R;
 l_EditRect.Right := l_EditRect.Right - aBtnWidth;
 DrawEdit(R, anEnabled, aFocused, aReadOnly, anIs3D, aPartDraw, l_BorderWidth);
 l_BtnRect := l3SRect(l_EditRect.Right + l_BorderWidth, 
   R.Top + l_BorderWidth,
   R.Right - l_BorderWidth, 
   R.Bottom - l_BorderWidth);
 DrawSpinButtons(l_BtnRect, anEnabled, anIs3D);
end;

procedure Tl3SmartCanvas.DrawButtonText(const aCaption : Tl3PCharLen;
                                        aTextBounds    : Tl3SRect;
                                        aState         : Tl3ButtonState;
                                        aBiDiFlags     : LongInt;
                                        anAlignment    : Tl3Alignment = l3_taCenter;
                                        aColor         : Tl3Color = clBtnFace);
  {-}
begin
 PushBC;
 try
  Canvas.BackColor := aColor;
  if (aState = l3_bsDisabled) then
  begin
   OffsetRect(aTextBounds.R.WR, 1, 1);
   Canvas.Font.ForeColor := clBtnHighlight;
   Canvas.DrawText(aCaption, aTextBounds.R.WR, 
     Alignments[anAlignment] or DT_VCENTER or aBiDiFlags);
   OffsetRect(aTextBounds.R.WR, -1, -1);
   Canvas.Font.ForeColor := clBtnShadow;
   Canvas.DrawText(aCaption, aTextBounds.R.WR, 
     Alignments[anAlignment] or DT_VCENTER or aBiDiFlags);
  end//State = l3_bsDisabled
  else
   Canvas.DrawText(aCaption, aTextBounds.R.WR, 
     Alignments[anAlignment] or DT_LEFT or aBiDiFlags);
 finally
  PopBC;
 end;//try..finally
end;

function UseRightToLeftReading(BiDiMode: TBiDiMode): Boolean;
begin
  Result := SysLocale.MiddleEast and (BiDiMode <> bdLeftToRight);
end;

function DrawTextBiDiModeFlagsReadingOnly(BiDiMode: TBiDiMode): Longint;
begin
  if UseRightToLeftReading(BiDiMode) then
    Result := DT_RTLREADING
  else
    Result := 0;
end;

function DrawTextBiDiModeFlags(Flags                   : Longint;
                               UseRightToLeftAlignment : Boolean;
                               BiDiMode                : TBiDiMode): Longint;
begin
  Result := Flags;
  { do not change center alignment }
  if UseRightToLeftAlignment then
   if Result and DT_RIGHT = DT_RIGHT then
    Result := Result and not DT_RIGHT { removing DT_RIGHT, makes it DT_LEFT }
   else 
    if not (Result and DT_CENTER = DT_CENTER) then
     Result := Result or DT_RIGHT;
  Result := Result or DrawTextBiDiModeFlagsReadingOnly(BiDiMode);
end;

procedure Tl3SmartCanvas.DrawButton(const ACaption  : Tl3PCharLen;
                                    const R         : Tl3SRect;
                                    anEnabled       : Boolean;
                                    aFlat           : Boolean;
                                    aTransparent    : Boolean;
                                    aMouseInControl : Boolean;
                                    aState          : Tl3ButtonState;
                                    aColor          : Tl3Color;
                                    const aImgList  : Il3ImageList;
                                    aIndex    : Integer);
  {-}

 procedure DrawButtonGlyph(const GlyphPos : Tl3SPoint;
                           const AImgList : Il3ImageList;
                           AIndex         : Integer;
                           State          : Tl3ButtonState{;
                           Transparent    : Boolean});
 {$IfDef NeedThemes}
(* var
   Details : TThemedElementDetails;
   Button  : TThemedButton;
   R       : Tl3SRect;*)
 {$ENDIF}
 begin//DrawButtonGlyph
   if (AImgList = nil) or (AIndex < 0) then Exit;
   if (AImgList.Count <= AIndex) or (AImgList.Width = 0) or (AImgList.Height = 0) then
     Exit;
   with GlyphPos do
   begin
   {$IfDef NeedThemes}
    if _TE then
    begin
(*     R.TopLeft := GlyphPos;
     R.Right := R.Left + AImgList.Width;
     R.Bottom := R.Top + AImgList.Height;
     case State of
      l3_bsDisabled:
       Button := tbPushButtonDisabled;
      l3_bsDown,
      l3_bsExclusive:
       Button := tbPushButtonPressed;
     else
      // bsUp
      Button := tbPushButtonNormal;
     end;
     Details := ThemeServices.GetElementDetails(Button);*)
     //ThemeServices.DrawIcon(Canvas.DC, Details, R.R.WR, aImgList.Handle, AIndex);
     AImgList.Draw(Canvas, X-1, Y, AIndex, l3_dsTransparent, l3_itImage, anEnabled)
    end
    else
   {$ENDIF NeedThemes}
     AImgList.Draw(Canvas, X, Y, AIndex, l3_dsTransparent, l3_itImage, anEnabled)
   end;
 end;//DrawButtonGlyph

 procedure CalcButtonLayout(const Client   : Tl3SRect; 
                            const Offset   : Tl3SPoint;
                            const ACaption : Tl3PCharLen;
                            Layout         : TButtonLayout;
                            Margin         : Integer;
                            Spacing        : Integer;
                            var GlyphPos   : Tl3SPoint;
                            var TextBounds : Tl3SRect;
                            BiDiFlags      : LongInt;
                            State          : Tl3ButtonState);
 var
  TextPos: Tl3SPoint;
  ClientSize, GlyphSize, TextSize: Tl3SPoint;
  TotalSize: Tl3SPoint;
 begin//CalcButtonLayout
  if (BiDiFlags and DT_RIGHT) = DT_RIGHT then
   if Layout = blGlyphLeft then Layout := blGlyphRight
   else
    if Layout = blGlyphRight then Layout := blGlyphLeft;
  { calculate the item sizes }
  ClientSize := l3SPoint(Client.Right - Client.Left,
    Client.Bottom - Client.Top);
  if (AImgList <> nil) and (AIndex > -1) and (AImgList.Count > AIndex) then
   GlyphSize := l3SPoint(AImgList.Width, AImgList.Height)
  else
   GlyphSize := l3SPoint(0, 0);
  with Canvas do
   if ACaption.SLen > 0 then
   begin
    TextBounds := l3SRect(0, 0, Client.Right - Client.Left, 0);
    DrawText(ACaption, TextBounds.R.WR, DT_CALCRECT or DT_LEFT or BiDiFlags);
    TextSize := l3SPoint(TextBounds.Right - TextBounds.Left, TextBounds.Bottom -
     TextBounds.Top);
   end//if ACaption.SLen > 0 then
   else 
   begin
    TextBounds := l3SRect(0, 0, 0, 0);
    TextSize := l3SPoint(0, 0);
   end;//else (if ACaption.SLen > 0 then)                   
  { If the layout has the glyph on the right or the left, then both the
    text and the glyph are centered vertically.  If the glyph is on the top
    or the bottom, then both the text and the glyph are centered horizontally.}
  if Layout in [blGlyphLeft, blGlyphRight] then
  begin
   GlyphPos.Y := (ClientSize.Y - GlyphSize.Y + 1) div 2;
   TextPos.Y := (ClientSize.Y - TextSize.Y + 1) div 2;
  end//if Layout in [blGlyphLeft, blGlyphRight] then
  else
  begin
   GlyphPos.X := (ClientSize.X - GlyphSize.X + 1) div 2;
   TextPos.X := (ClientSize.X - TextSize.X + 1) div 2;
  end;//else (if Layout in [blGlyphLeft, blGlyphRight] then)
  { if there is no text or no bitmap, then Spacing is irrelevant }
  if (TextSize.X = 0) or (GlyphSize.X = 0) then
   Spacing := 0;
  { adjust Margin and Spacing }
  if (Margin = -1) then
  begin
   if (Spacing = -1) then
   begin
    TotalSize := l3SPoint(GlyphSize.X + TextSize.X, GlyphSize.Y + TextSize.Y);
    if Layout in [blGlyphLeft, blGlyphRight] then
     Margin := (ClientSize.X - TotalSize.X) div 3
    else
     Margin := (ClientSize.Y - TotalSize.Y) div 3;
    Spacing := Margin;
   end//if Spacing = -1 then
   else
   begin
    TotalSize := l3SPoint(GlyphSize.X + Spacing + TextSize.X, GlyphSize.Y +
     Spacing + TextSize.Y);
    if Layout in [blGlyphLeft, blGlyphRight] then
     Margin := (ClientSize.X - TotalSize.X + 1) div 2
    else
     Margin := (ClientSize.Y - TotalSize.Y + 1) div 2;
   end;//else (if Spacing = -1 then)
  end//if Margin = -1 then
  else
  begin
   if (Spacing = -1) then
   begin
    TotalSize := l3SPoint(ClientSize.X - (Margin + GlyphSize.X), ClientSize.Y -
     (Margin + GlyphSize.Y));
    if Layout in [blGlyphLeft, blGlyphRight] then
     Spacing := (TotalSize.X - TextSize.X) div 2
    else
     Spacing := (TotalSize.Y - TextSize.Y) div 2;
   end;//if Spacing = -1 then
  end;//else (//if Margin = -1 then)
  case Layout of
   blGlyphLeft:
   begin
    GlyphPos.X := Margin;
    TextPos.X := GlyphPos.X + GlyphSize.X + Spacing;
   end;//blGlyphLeft
   blGlyphRight:
   begin
    GlyphPos.X := ClientSize.X - Margin - GlyphSize.X;
    TextPos.X := GlyphPos.X - Spacing - TextSize.X;
   end;//blGlyphRight
   blGlyphTop:
   begin
    GlyphPos.Y := Margin;
    TextPos.Y := GlyphPos.Y + GlyphSize.Y + Spacing;
   end;//blGlyphTop
   blGlyphBottom:
   begin
    GlyphPos.Y := ClientSize.Y - Margin - GlyphSize.Y;
    TextPos.Y := GlyphPos.Y - Spacing - TextSize.Y;
   end;//blGlyphBottom
   else
    Assert(false); 
  end;//Layout
  { fixup the result variables }
  GlyphPos.Inc(l3SPoint(Client.Left + Offset.X, Client.Top + Offset.Y));
  { Themed text is not shifted, but gets a different color. }
{$IfDef NeedThemes}
  if _TE then
   OffsetRect(TextBounds.R.WR, TextPos.X + Client.Left, TextPos.Y + Client.Top)
  else
{$ENDIF NeedThemes}
   OffsetRect(TextBounds.R.WR, TextPos.X + Client.Left + Offset.X, 
     TextPos.Y + Client.Top + Offset.Y);
 end;//CalcButtonLayout

 function InternalDraw(const Client   : Tl3SRect;
                       const Offset   : Tl3SPoint;
                       const ACaption : Tl3PCharLen;
                       Layout         : TButtonLayout;
                       Margin         : Integer;
                       Spacing        : Integer;
                       AState         : Tl3ButtonState;
                       {Transparent    : Boolean;}
                       BiDiFlags      : LongInt): Tl3SRect;
 var
  GlyphPos : Tl3SPoint;
 begin//InternalDraw
  CalcButtonLayout(Client, Offset, ACaption, Layout, Margin, Spacing, GlyphPos, 
    Result, BiDiFlags, AState);
  DrawButtonGlyph(GlyphPos, AImgList, AIndex, AState{, Transparent});
  DrawButtonText(ACaption, Result, AState, BiDiFlags);
 end;//InternalDraw

var
  l_OldPenColor : Tl3Color;
{$IfDef NeedThemes}
 Button     : TThemedButton;
 ToolButton : TThemedToolBar;
 Details    : TThemedElementDetails;
{$ENDIF NeedThemes}
 Offset     : Tl3SPoint;
 DrawFlags  : Integer;
 PaintRect  : Tl3SRect;
begin
 PushBC;
 try
  with Canvas.Canvas do
   l_OldPenColor := Pen.Color;
  if not anEnabled then
   AState := l3_bsDisabled
  else
   if AState = l3_bsDisabled then
    AState := l3_bsUp;
 {$IfDef NeedThemes}
  if _TE then
  begin
   if not anEnabled then
    Button := tbPushButtonDisabled
   else
   if AState in [l3_bsDown, l3_bsExclusive] then
    Button := tbPushButtonPressed
   else
   if AMouseInControl then
    Button := tbPushButtonHot
   else
    Button := tbPushButtonNormal;
   ToolButton := ttbToolbarDontCare;
   if AFlat then
   begin
    case Button of
     tbPushButtonDisabled:
      Toolbutton := ttbButtonDisabled;
     tbPushButtonPressed:
      Toolbutton := ttbButtonPressed;
     tbPushButtonHot:
      Toolbutton := ttbButtonHot;
     tbPushButtonNormal:
      Toolbutton := ttbButtonNormal;
     else
      Assert(false); 
    end;//case Button
   end;//AFlat
   PaintRect := R;
   if (ToolButton = ttbToolbarDontCare) then
    Details := ThemeServices.GetElementDetails(Button)
   else
    Details := ThemeServices.GetElementDetails(ToolButton);
   Canvas.BackColor := aColor;  
   ThemeServices.DrawElement(Canvas.DC, Details, PaintRect.R.WR);
   PaintRect.R.WR := ThemeServices.ContentRect(Canvas.DC, Details, PaintRect.R.WR);
   if (Button = tbPushButtonPressed) then
   begin
    // A pressed speed button has a white text. This applies however only to flat buttons.
    if (ToolButton <> ttbToolbarDontCare) then
     Canvas.Font.ForeColor := clHighlightText;
    Offset := l3SPoint(1, 0);
   end//if Button = tbPushButtonPressed then
   else
    Offset := l3SPoint(0, 0);
   InternalDraw(PaintRect, Offset, ACaption, blGlyphLeft, -1, 4, AState,
    {ATransparent,} DrawTextBiDiModeFlags(0, False, bdLeftToRight));
  end//_TE
  else
 {$ENDIF NeedThemes} 
  begin
   PaintRect := R;
   if not AFlat then
   begin
    DrawFlags := DFCS_BUTTONPUSH or DFCS_ADJUSTRECT;
    if AState in [l3_bsDown, l3_bsExclusive] then
     DrawFlags := DrawFlags or DFCS_PUSHED;
    DrawFrameControl(Canvas.DC, PaintRect.R.WR, DFC_BUTTON, DrawFlags);
   end//if not AFlat then
   else
   begin
    if (AState in [l3_bsDown, l3_bsExclusive]) or
     (AMouseInControl and (AState <> l3_bsDisabled)) then
     DrawEdge(Canvas.DC, PaintRect.R.WR,
              DownStyles[AState in [l3_bsDown, l3_bsExclusive]],
              FillStyles[ATransparent] or BF_RECT);
    {else
    if not ATransparent then
     with Canvas do
     begin
      BackColor := AColor;
      FillRect(PaintRect);
     end;//with Canvas }
    PaintRect.Inflate(-1, -1);
   end;//else (if not AFlat then)
   if AState in [l3_bsDown, l3_bsExclusive] then
   begin
    if (AState = l3_bsExclusive) and (not AFlat or not AMouseInControl) then
    with Canvas do
    begin
     Canvas.Brush.Bitmap := AllocPatternBitmap(clBtnFace, clBtnHighlight);
     FillRect(PaintRect);
    end;//with Canvas
    Offset.X := 1;
    Offset.Y := 1;
   end//if AState in [bsDown, bsExclusive] then
   else
   begin
    Offset.X := 0;
    Offset.Y := 0;
   end;//else if AState in [bsDown, bsExclusive] then
   InternalDraw(PaintRect, Offset, ACaption, blGlyphLeft, -1,
    4, AState, {ATransparent,} DrawTextBiDiModeFlags(0, False, bdLeftToRight));
  end;//_TE
  with Canvas.Canvas do
   Pen.Color := l_OldPenColor;
 finally
  PopBC;
 end;//try..finally
end;

procedure Tl3SmartCanvas.DrawSpinButtons(const R   : Tl3SRect;
                                         anEnabled,
                                         aFlat     : Boolean);
  {-}
var
 UpRect         : Tl3SRect;
 DownRect       : Tl3SRect;
 l_Height       : Integer;
{$IfDef NeedThemes}
 ElementDetails : TThemedElementDetails;
{$ENDIF NeedThemes}
begin
  l_Height := (R.Bottom - R.Top) div 2;
  if (R.Bottom - R.Top) = l_Height * 2 then
    Dec(l_Height);
  UpRect := l3SRect(R.Left, R.Top, R.Right, R.Top + l_Height);
  DownRect := l3SRect(R.Left, R.Bottom - l_Height, R.Right, R.Bottom);
{$IfDef NeedThemes}
  if _TE then
  begin
   if anEnabled then
    ElementDetails := ThemeServices.GetElementDetails(tsUpNormal)
   else
    ElementDetails := ThemeServices.GetElementDetails(tsUpDisabled);
   ThemeServices.DrawElement(Canvas.DC, ElementDetails, UpRect.R.WR);
   if anEnabled then
    ElementDetails := ThemeServices.GetElementDetails(tsDownNormal)
   else
    ElementDetails := ThemeServices.GetElementDetails(tsDownDisabled);
   ThemeServices.DrawElement(Canvas.DC, ElementDetails, DownRect.R.WR);
  end//_TE
  else
{$ENDIF NeedThemes}
  begin
   DrawFrameControl(Canvas.DC, UpRect.R.WR, DFC_SCROLL, 
     DFCS_SCROLLUP or ActiveArray[anEnabled] or FlatArray[AFlat]);
   DrawFrameControl(Canvas.DC, DownRect.R.WR, DFC_SCROLL, 
     DFCS_SCROLLDOWN or ActiveArray[anEnabled] or FlatArray[AFlat]);
  end;
end;

procedure Tl3SmartCanvas.DrawElipsisEdit(const R           : Tl3SRect;
                                         aBtnWidth         : Integer;
                                         anEnabled         : Boolean;
                                         aFocused          : Boolean;
                                         aReadOnly         : Boolean;
                                         anIs3D            : Boolean;
                                         aPartDraw         : Boolean;
                                         const aImgList    : Il3ImageList;
                                         aImageIndex : Integer);
  {-}
var
 l_EditRect    : Tl3SRect;
 l_BtnRect     : Tl3SRect;
 l_BorderWidth : Integer;
begin
 PushBC;
 try
  l_EditRect := R;
  l_EditRect.Right := l_EditRect.Right - aBtnWidth;
  DrawEdit(R, anEnabled, aFocused, aReadOnly, anIs3D, aPartDraw, l_BorderWidth);
  l_BtnRect := l3SRect(l_EditRect.Right + l_BorderWidth, R.Top + l_BorderWidth,
   R.Right - l_BorderWidth, R.Bottom - l_BorderWidth);
  DrawButton(l3PCharLen(), l_BtnRect, anEnabled, False, False, False,
   l3_bsUp, clWindow, aImgList, aImageIndex);
 finally
  PopBC;
 end;//try..finally
end;

procedure Tl3SmartCanvas.DrawCollapsedPanel(const aCaption : Tl3PCharLen;
                                            var R          : Tl3SRect;
                                            anEnabled      : Boolean; 
                                            aCollapsed     : Boolean;
                                            aUpper         : Boolean;
                                            aDown          : Boolean;
                                            aBtnVisible    : Boolean;
                                            aColor         : Tl3Color;
                                            anAlignment    : Tl3Alignment;
                                            const aImgList : Il3ImageList;
                                            aNeedFrame     : Boolean);
  {-}
var
 TopColor    : Tl3Color;
 BottomColor : Tl3Color;

  procedure AdjustColors(Bevel: TBevelCut);
  begin//AdjustColors
   TopColor := aColor;
   BottomColor := aColor;
(*   TopColor := clBtnHighlight;
   if (Bevel = bvLowered) then
    TopColor := clBtnShadow;
   BottomColor := clBtnShadow;
   if (Bevel = bvLowered) then
    BottomColor := clBtnHighlight;*)
  end;//AdjustColors

const
{$IFDEF Nemesis}
 ImgIndexArr: array [Boolean] of Integer = (1, 0);
 //ImgIndexArr: array [Boolean] of Integer = (114, 113);
{$Else  Nemesis}
 ImgIndexArr: array [Boolean] of Integer = (0, 1);
{$ENDIF Nemesis}
 StateUpperIndex: array [Boolean] of Tl3ButtonState = (l3_bsUp, l3_bsDown);
var
 ARect       : Tl3SRect;
 l_Rect      : Tl3SRect;
 l_FlatRect  : Tl3SRect;
 GliphPos    : Tl3SPoint;
 FontHeight  : Integer;
 l_Point     : Tl3Point;
begin
 ARect := R;
 ARect.Right := ARect.Right - 1;
 AdjustColors(bvRaised);//Отрисовывается только аналог панели в Немезисе
 if aNeedFrame then
 begin
  Frame3D(Canvas.Canvas, ARect.R.WR, TopColor, BottomColor, 1);
  Frame3D(Canvas.Canvas, ARect.R.WR, TopColor, BottomColor, 1);
 end;//aNeedFrame
// Frame3D(Canvas.Canvas, ARect.R.WR, clBtnFace, clBtnFace, 1);
 with Canvas do
 begin
  BackColor := aColor;
(*  {$IfDef NeedThemes}
  if not _TE then
   BackColor := clBtnFace;
  {$ELSE}
   BackColor := clBtnFace;
  {$ENDIF NeedThemes}*)
  Canvas.Brush.Style := bsClear;
  FontHeight := Canvas.TextHeight('W');
  with ARect do
  begin
   Top := ((Bottom + Top) - FontHeight) div 2;
   Bottom := Top + FontHeight;
  end;//with ARect
  DrawButtonText(ACaption, ARect, Tl3ButtonState(not anEnabled),
    DrawTextBiDiModeFlags(0, False, bdLeftToRight), l3_taLeftJustify, aColor);
  if (AImgList <> nil) then
  begin
   GliphPos.Y := (R.Bottom - AImgList.Height) div 2;
   GliphPos.X := R.Right - AImgList.Width - 2;
  end//AImgList <> nil
  else
  begin
   GliphPos.Y := (R.Bottom - DefIconHeight) div 2;
   GliphPos.X := R.Right - DefIconWidth - 2;
  end;//AImgList <> nil
  l_FlatRect := l3SRect(GliphPos.X + 2, R.Top + 2, R.Right - 2, R.Bottom - 2);
  if aBtnVisible then 
   DrawButton(l3PCharLen(''), l_FlatRect, anEnabled, True, False, AUpper,
     StateUpperIndex[ADown], AColor, AImgList, ImgIndexArr[ACollapsed]);
  l_Rect := R;
  l_Point := TextExtent(aCaption);
  l_Rect.Right := l_Rect.Left + LP2DP(l_Point).X + 5;
  R := l_Rect;
 end;//Canvas
end;

procedure Tl3SmartCanvas.DrawPictureButton(const aRect: Tl3SRect;
  aMouseInControl, anEnabled: Boolean; aState: Tl3ButtonState;
  aColor: Tl3Color; const aImgList: Il3ImageList; aIndex: Integer);
var
 l_OldPenColor : Tl3Color;
 l_PaintRect   : TRect;
 l_Y           : Integer;
 l_X           : Integer;
begin  
 PushBC;
 try
  with Canvas.Canvas do
   l_OldPenColor := Pen.Color;
  if not anEnabled then
   AState := l3_bsDisabled
  else
   if AState = l3_bsDisabled then
    AState := l3_bsUp;  
  l_PaintRect := aRect.R.WR;
  if (AState in [l3_bsDown, l3_bsExclusive]) or
   (AMouseInControl and (AState <> l3_bsDisabled)) then
   DrawEdge(Canvas.DC, l_PaintRect,
            DownStyles[AState in [l3_bsDown, l3_bsExclusive]], BF_RECT);
  if AImgList <> nil then
  begin
   l_Y := l_PaintRect.Top + (l_PaintRect.Bottom - l_PaintRect.Top 
     - AImgList.Height) div 2; 
   l_X := l_PaintRect.Left + (l_PaintRect.Right - l_PaintRect.Left 
     - AImgList.Width) div 2;  
    AImgList.Draw(Canvas, l_X, l_Y, AIndex, l3_dsTransparent, l3_itImage, 
      anEnabled);   
  end;   
  with Canvas.Canvas do
   Pen.Color := l_OldPenColor;
 finally
  PopBC;
 end;//try..finally
end;

procedure Tl3SmartCanvas.DrawHelpControl(const aRect      : Tl3SRect;
                                         aColor           : Tl3Color;
                                         const aImgList   : Il3ImageList;
                                         aIndex     : Integer);
var
 l_OldPenColor: Tl3Color;
 l_PaintRect: TRect;
 l_RectHeight: Integer;
 l_Idx: Boolean;
 l_Y           : array [Boolean] of Integer;
begin
 PushBC;
 try
  with Canvas.Canvas do
   l_OldPenColor := Pen.Color;
  l_PaintRect := aRect.R.WR;
  l_RectHeight := l_PaintRect.Bottom-l_PaintRect.Top - 2;
  //DrawEdge(Canvas.DC, l_PaintRect, EDGE_ETCHED, FullRectEdge[{l_Delta <= 0}True]);
  for l_Idx := Low(Boolean) to High(Boolean) do
   l_Y[l_Idx] := l_PaintRect.Top + min(5,(l_RectHeight-PictureSizes[l_Idx]) div 2);
  if (AImgList <> nil) and (l_RectHeight >= PictureSizes[False]) then
  begin
   AImgList.BigSize := l_Y[True] >= l_PaintRect.Top;
   AImgList.Draw(Canvas, l_PaintRect.Left + 10, l_Y[AImgList.BigSize], AIndex, l3_dsTransparent,
     l3_itImage, True);
  end;//AImgList <> nil
  with Canvas.Canvas do
   Pen.Color := l_OldPenColor;
 finally
  PopBC;
 end;//try..finally
end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3SmartCanvas.pas initialization enter'); {$EndIf}
 GetCheckSize;

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3SmartCanvas.pas initialization leave'); {$EndIf}
end.
