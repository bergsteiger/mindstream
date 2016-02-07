unit l3Core;

{$IfDef DesignTimeLibrary}
{.$WEAKPACKAGEUNIT ON}
{$EndIf DesignTimeLibrary}
 
{$Include l3Define.inc}

interface

uses
  Types,
  Messages,
  Classes,
  Graphics,
  Windows
  ;

type
 HPALETTE = Windows.HPALETTE;

 HMETAFILE = Windows.HMETAFILE;

 HGLOBAL = Windows.HGLOBAL;

 TFontName = Graphics.TFontName;
  {* Гарнитура шрифта. }

 TFontPitch = Graphics.TFontPitch;

 TFontStyles = Graphics.TFontStyles;

 hFont = Windows.HFONT;

 TFont = Graphics.TFont;

 VCLBitmap = Graphics.TBitmap;
  {* Картинка. }

 TPoint = Types.TPoint;
  {* Точка. }

 TRect = Types.TRect;

 TMessage = Messages.TMessage;

 Tl3Position = type System.Integer;
  {* Позиция. }

 Tl3Inch = type System.Integer;
  {* Дюйм. }

 Tl3Color = Graphics.TColor;
  {* Цвет. }

 VCLCanvas = Graphics.TCanvas;

 VCLGraphic = Graphics.TGraphic;
  {* Картинка. }

const
  { Цвета }
 clDefault = Graphics.clDefault;
  { Цвет по-умолчанию. }

type
 PTextMetric = Windows.PTextMetric;

 THandle = Windows.THandle;

 hRgn = Windows.hRgn;
  {* Хэндл региона. }

 WinBool = Windows.BOOL;

 LCID = Windows.LCID;

 PMsg = Windows.PMsg;

 hDC = Windows.hDC;

 hWnd = Windows.hWnd;

 WPARAM = Windows.WPARAM;

 LPARAM = Windows.LPARAM;

 TComponent = Classes.TComponent;

 TStrings = Classes.TStrings;

 TShiftState = Classes.TShiftState;

 TPersistent = Classes.TPersistent;

 DWORD = System.Cardinal;

 PInteger = Windows.PInteger;

 RtlDateTime = System.TDateTime;

const
  { Алиасы для значений Classes.TShiftState }
 ssShift = Classes.ssShift;
 ssAlt = Classes.ssAlt;
 ssCtrl = Classes.ssCtrl;
 ssLeft = Classes.ssLeft;
 ssRight = Classes.ssRight;
 ssMiddle = Classes.ssMiddle;
 ssDouble = Classes.ssDouble;
  { Алиасы для значений Graphics.TFontPitch }
 fpDefault = Graphics.fpDefault;
  { The font pitch is set to the default value, which depends on the font specified in the font object's Name property. }
 fpVariable = Graphics.fpVariable;
  { The font pitch is set to variable. The characters in the font have different widths. }
 fpFixed = Graphics.fpFixed;
  { The font pitch is set to fixed. All characters in the font have the same width. }

implementation

end.