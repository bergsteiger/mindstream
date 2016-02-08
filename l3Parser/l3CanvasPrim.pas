unit l3CanvasPrim;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3InternalInterfaces,
  l3Units,
  l3Defaults,
  l3LongintList,
  Windows,
  l3ProtoObject,
  l3RectList,
  l3PrinterInterfaces
  ;

type
 Tl3OpenPageResult = (
   l3_oprNo
 , l3_oprYes
 , l3_oprEndDoc
 );//Tl3OpenPageResult

 Tl3DrawFlag = (
   ev_dfDrawCursor
 , ev_dfDrawRegion
 , ev_dfDrawSpecial
 , ev_dfPrinting
 , ev_dfSelfStarted
 , ev_dfPrinted
 );//Tl3DrawFlag

 TevDrawFlags = set of Tl3DrawFlag;

 TevDCFlag = (
  {* флаги способа получения Handle канвы }
   ev_dcfCanvas
 , ev_dcfGot
 , ev_dcfCreated
 , ev_dcfLinked
 );//TevDCFlag

 Tl3DeviceCaps = record
  {* Информация об устройстве вывода }
   rLOGPIXELSX : Integer;
   rLOGPIXELSY : Integer;
   rHORZRES : Integer;
   rVERTRES : Integer;
   rPHYSICALWIDTH : Integer;
   rPHYSICALHEIGHT : Integer;
   rPHYSICALOFFSETX : Integer;
   rPHYSICALOFFSETY : Integer;
   rIsAssigned : Boolean;
 end;//Tl3DeviceCaps

 Tl3CanvasPrim = class(Tl3ProtoObject, Il3PageSetup)
 private
 // private fields
   f_Margins : Tl3_Rect;
   f_ClipRects : Tl3RectList;
    {* Стек прямоугольников отсечения}
   f_LineSpacingStack : Tl3LongintList;
   f_Flags : TevDrawFlags;
    {* Поле для свойства Flags}
   f_OnDrawSub : TevDrawSubEvent;
    {* Поле для свойства OnDrawSub}
   f_CanDrawSubs : Boolean;
    {* Поле для свойства CanDrawSubs}
   f_PixelsPerInchX : Integer;
    {* Поле для свойства PixelsPerInchX}
   f_PixelsPerInchY : Integer;
    {* Поле для свойства PixelsPerInchY}
 protected
 // property methods
   function pm_GetPrinting: Boolean;
   procedure pm_SetPrinting(aValue: Boolean);
   function pm_GetCanDrawSubs: Boolean;
   function pm_GetPixelsPerInchX: Integer;
   function pm_GetPixelsPerInchY: Integer;
   function pm_GetWindowOrg: Tl3Point; virtual; abstract;
   procedure pm_SetWindowOrg(const aValue: Tl3Point); virtual; abstract;
   function pm_GetGlobalClipRect: Tl3Rect; virtual; abstract;
   function pm_GetClipRect: Tl3Rect; virtual; abstract;
   procedure pm_SetClipRect(const aValue: Tl3Rect); virtual; abstract;
   function pm_GetDC: hDC; virtual; abstract;
   function pm_GetSWindowOrg: Tl3SPoint; virtual; abstract;
   procedure pm_SetSWindowOrg(const aValue: Tl3SPoint); virtual; abstract;
 protected
 // realized methods
   function pm_GetPageNumber: Integer;
   function pm_GetPageWidthNumber: Integer;
   function Get_Width: Tl3Inch;
   function Get_Height: Tl3Inch;
   function pm_GetPaperWidth: Tl3Inch;
   function pm_GetPaperHeight: Tl3Inch;
   function pm_GetMargins: Tl3_Rect;
   procedure pm_SetMargins(const aValue: Tl3_Rect);
   function Get_IsPagesCounter: Boolean;
   function Get_OverallPageNumber: Integer;
   function Get_InitialDCOffset: Tl3Point;
   procedure Set_ClipRegion(const aValue: Il3Region);
   function Get_LineSpacing: Integer;
   procedure Set_LineSpacing(aValue: Integer);
   function Get_InitialDCOffsetStored: Tl3Point;
 public
 // realized methods
   function DP2LP(const aP: Tl3_SPoint): Tl3Point;
     {* Преобразует точку в пикселях в точку в дюймах }
   function PushClipRect: Tl3Rect;
   procedure PopClipRect;
   procedure PushLineSpacing;
   procedure PopLineSpacing;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 protected
 // protected fields
   f_Printer : Il3Printer;
   f_DeviceCaps : Tl3DeviceCaps;
   f_PageNumber : Integer;
   f_PageWidthNumber : Integer;
   f_OverallPageNumber : Integer;
   f_InitialDCOffset : Tl3Point;
   f_ClipRectInited : Boolean;
   f_LineSpacing : Integer;
   f_InitialDCOffsetStored : Tl3Point;
 protected
 // protected methods
   function CalcPrintableArea: Tl3_Rect;
   procedure DrawSub(aSubTarget: TObject;
     const R: Tl3Rect;
     LayerHandle: Integer;
     aSub: TObject);
   procedure UpdatePixelsPerInch;
   function GetIsPagesCounter: Boolean; virtual;
   function GetGlobalClipRectWithZoom: Tl3Rect; virtual;
   function DoGetPageSetupWidth: Tl3Inch; virtual;
   function DoGetPageSetupHeight: Tl3Inch; virtual;
   function DoGetDrawEnabled: Boolean; virtual;
   function DeviceCaps(anIndex: Integer): Integer; virtual; abstract;
   function GetPrinting: Boolean; virtual;
   function AsIl3Canvas: Il3Canvas; virtual; abstract;
   procedure AssignDeviceCaps; virtual; abstract;
     {* Инициализировать информацию об устройстве }
   function DoGetPaperWidth: Tl3Inch; virtual;
 protected
 // protected properties
   property Printing: Boolean
     read pm_GetPrinting
     write pm_SetPrinting;
   property Flags: TevDrawFlags
     read f_Flags
     write f_Flags;
   property CanDrawSubs: Boolean
     read pm_GetCanDrawSubs;
   property GlobalClipRect: Tl3Rect
     read pm_GetGlobalClipRect;
   property ClipRect: Tl3Rect
     read pm_GetClipRect
     write pm_SetClipRect;
   property DC: hDC
     read pm_GetDC;
   property SWindowOrg: Tl3SPoint
     read pm_GetSWindowOrg
     write pm_SetSWindowOrg;
 public
 // public properties
   property OnDrawSub: TevDrawSubEvent
     read f_OnDrawSub
     write f_OnDrawSub;
   property PixelsPerInchX: Integer
     read pm_GetPixelsPerInchX;
   property PixelsPerInchY: Integer
     read pm_GetPixelsPerInchY;
   property WindowOrg: Tl3Point
     read pm_GetWindowOrg
     write pm_SetWindowOrg;
 end;//Tl3CanvasPrim

  {$If defined(nsTest)}
var
   g_PrintingLineSpacing : Integer = def_PrintingLineSpacing;
  {$IfEnd} //nsTest

implementation

uses
  l3MinMax,
  l3Math,
  l3Const,
  SysUtils
  ;

// start class Tl3CanvasPrim

function Tl3CanvasPrim.CalcPrintableArea: Tl3_Rect;
//#UC START# *4A4CBD130121_4A4CB79A02C6_var*
var
 l_Ofs  : Tl3Point;
 l_OfsB : Tl3Point;
//#UC END# *4A4CBD130121_4A4CB79A02C6_var*
begin
//#UC START# *4A4CBD130121_4A4CB79A02C6_impl*
 if Printing then
 begin
  l_Ofs := DP2LP(l3SPoint(DeviceCaps(PHYSICALOFFSETX),
                          DeviceCaps(PHYSICALOFFSETY)));
  l_Ofs.X := Max(l_Ofs.X, f_Margins.Left);
  l_Ofs.Y := Max(l_Ofs.Y, f_Margins.Top);
  l_OfsB := DP2LP(l3SPoint(DeviceCaps(PHYSICALWIDTH) - DeviceCaps(HORZRES),
                                  DeviceCaps(PHYSICALHEIGHT) - DeviceCaps(VERTRES))).Sub(l_Ofs);
  l_OfsB.X := Max(l_OfsB.X, f_Margins.Right);
  Result := l3Rect(l_Ofs, l_OfsB);
 end//Printing
 else
  Result := l3Rect(0, 0, 0, 0);
//#UC END# *4A4CBD130121_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.CalcPrintableArea

procedure Tl3CanvasPrim.DrawSub(aSubTarget: TObject;
  const R: Tl3Rect;
  LayerHandle: Integer;
  aSub: TObject);
//#UC START# *4A4CC1410062_4A4CB79A02C6_var*
//#UC END# *4A4CC1410062_4A4CB79A02C6_var*
begin
//#UC START# *4A4CC1410062_4A4CB79A02C6_impl*
 if CanDrawSubs then
  f_OnDrawSub(aSubTarget, AsIl3Canvas, R, LayerHandle, aSub);
//#UC END# *4A4CC1410062_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.DrawSub

procedure Tl3CanvasPrim.UpdatePixelsPerInch;
//#UC START# *4A4CCE400004_4A4CB79A02C6_var*
//#UC END# *4A4CCE400004_4A4CB79A02C6_var*
begin
//#UC START# *4A4CCE400004_4A4CB79A02C6_impl*
 f_PixelsPerInchX := DeviceCaps(LOGPIXELSX);
 f_PixelsPerInchY := DeviceCaps(LOGPIXELSY);
 {-обновляем разрешение}
//#UC END# *4A4CCE400004_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.UpdatePixelsPerInch

function Tl3CanvasPrim.GetIsPagesCounter: Boolean;
//#UC START# *4CB32D4C030E_4A4CB79A02C6_var*
//#UC END# *4CB32D4C030E_4A4CB79A02C6_var*
begin
//#UC START# *4CB32D4C030E_4A4CB79A02C6_impl*
 Result := false;
//#UC END# *4CB32D4C030E_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.GetIsPagesCounter

function Tl3CanvasPrim.GetGlobalClipRectWithZoom: Tl3Rect;
//#UC START# *4E98521202B5_4A4CB79A02C6_var*
//#UC END# *4E98521202B5_4A4CB79A02C6_var*
begin
//#UC START# *4E98521202B5_4A4CB79A02C6_impl*
 Result := GlobalClipRect;
//#UC END# *4E98521202B5_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.GetGlobalClipRectWithZoom

function Tl3CanvasPrim.pm_GetPrinting: Boolean;
//#UC START# *4A4CBF0003DF_4A4CB79A02C6get_var*
//#UC END# *4A4CBF0003DF_4A4CB79A02C6get_var*
begin
//#UC START# *4A4CBF0003DF_4A4CB79A02C6get_impl*
 Result := GetPrinting;
//#UC END# *4A4CBF0003DF_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.pm_GetPrinting

procedure Tl3CanvasPrim.pm_SetPrinting(aValue: Boolean);
//#UC START# *4A4CBF0003DF_4A4CB79A02C6set_var*
//#UC END# *4A4CBF0003DF_4A4CB79A02C6set_var*
begin
//#UC START# *4A4CBF0003DF_4A4CB79A02C6set_impl*
 if aValue then
 begin
  Include(f_Flags, ev_dfPrinting);
  Exclude(f_Flags, ev_dfDrawSpecial);
  OnDrawSub := nil;
 end//aValue 
 else
  Exclude(f_Flags, ev_dfPrinting);
//#UC END# *4A4CBF0003DF_4A4CB79A02C6set_impl*
end;//Tl3CanvasPrim.pm_SetPrinting

function Tl3CanvasPrim.pm_GetCanDrawSubs: Boolean;
//#UC START# *4A4CC10D01A1_4A4CB79A02C6get_var*
//#UC END# *4A4CC10D01A1_4A4CB79A02C6get_var*
begin
//#UC START# *4A4CC10D01A1_4A4CB79A02C6get_impl*
 Result := DoGetDrawEnabled AND Assigned(f_OnDrawSub);
//#UC END# *4A4CC10D01A1_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.pm_GetCanDrawSubs

function Tl3CanvasPrim.pm_GetPixelsPerInchX: Integer;
//#UC START# *4A4CC95D0147_4A4CB79A02C6get_var*
//#UC END# *4A4CC95D0147_4A4CB79A02C6get_var*
begin
//#UC START# *4A4CC95D0147_4A4CB79A02C6get_impl*
 Result := f_PixelsPerInchX;
 if (Result = 0) then 
 begin
  f_PixelsPerInchX := DeviceCaps(LOGPIXELSX);
  Result := f_PixelsPerInchX;
 end;
//#UC END# *4A4CC95D0147_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.pm_GetPixelsPerInchX

function Tl3CanvasPrim.pm_GetPixelsPerInchY: Integer;
//#UC START# *4A4CC9830334_4A4CB79A02C6get_var*
//#UC END# *4A4CC9830334_4A4CB79A02C6get_var*
begin
//#UC START# *4A4CC9830334_4A4CB79A02C6get_impl*
 Result := f_PixelsPerInchY;
 if (Result = 0) then
 begin
  f_PixelsPerInchY := DeviceCaps(LOGPIXELSY);
  Result := f_PixelsPerInchY;
 end;//Result = 0
//#UC END# *4A4CC9830334_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.pm_GetPixelsPerInchY

function Tl3CanvasPrim.DoGetPageSetupWidth: Tl3Inch;
//#UC START# *4A4CBCD002EA_4A4CB79A02C6_var*
//#UC END# *4A4CBCD002EA_4A4CB79A02C6_var*
begin
//#UC START# *4A4CBCD002EA_4A4CB79A02C6_impl*
 if Printing AND (f_Printer <> nil) AND not f_Printer.HasPrinter then
  Result := DP2LP(PointX(DeviceCaps(PHYSICALWIDTH))).X
 else
  Result := DP2LP(PointX(DeviceCaps(HORZRES))).X;
//#UC END# *4A4CBCD002EA_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.DoGetPageSetupWidth

function Tl3CanvasPrim.DoGetPageSetupHeight: Tl3Inch;
//#UC START# *4A4CBCDD0244_4A4CB79A02C6_var*
//#UC END# *4A4CBCDD0244_4A4CB79A02C6_var*
begin
//#UC START# *4A4CBCDD0244_4A4CB79A02C6_impl*
 if Printing AND (f_Printer <> nil) AND not f_Printer.HasPrinter then
  Result := DP2LP(PointY(DeviceCaps(PHYSICALHEIGHT))).Y
 else
  Result := DP2LP(PointY(DeviceCaps(VERTRES))).Y;
//#UC END# *4A4CBCDD0244_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.DoGetPageSetupHeight

function Tl3CanvasPrim.DoGetDrawEnabled: Boolean;
//#UC START# *4A4CC195011E_4A4CB79A02C6_var*
//#UC END# *4A4CC195011E_4A4CB79A02C6_var*
begin
//#UC START# *4A4CC195011E_4A4CB79A02C6_impl*
 Result := (ev_dfDrawRegion In f_Flags);
//#UC END# *4A4CC195011E_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.DoGetDrawEnabled

function Tl3CanvasPrim.GetPrinting: Boolean;
//#UC START# *4A4CCCE900E8_4A4CB79A02C6_var*
//#UC END# *4A4CCCE900E8_4A4CB79A02C6_var*
begin
//#UC START# *4A4CCCE900E8_4A4CB79A02C6_impl*
 Result := (ev_dfPrinting in f_Flags);
//#UC END# *4A4CCCE900E8_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.GetPrinting

function Tl3CanvasPrim.DoGetPaperWidth: Tl3Inch;
//#UC START# *4D1B61130223_4A4CB79A02C6_var*
//#UC END# *4D1B61130223_4A4CB79A02C6_var*
begin
//#UC START# *4D1B61130223_4A4CB79A02C6_impl*
 Result := DP2LP(PointX(DeviceCaps(PHYSICALWIDTH))).X;
//#UC END# *4D1B61130223_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.DoGetPaperWidth

function Tl3CanvasPrim.pm_GetPageNumber: Integer;
//#UC START# *4728BE6A0392_4A4CB79A02C6get_var*
//#UC END# *4728BE6A0392_4A4CB79A02C6get_var*
begin
//#UC START# *4728BE6A0392_4A4CB79A02C6get_impl*
 if Printing then
  Result := f_PageNumber
 else
  Result := -1;
//#UC END# *4728BE6A0392_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.pm_GetPageNumber

function Tl3CanvasPrim.pm_GetPageWidthNumber: Integer;
//#UC START# *4728BE830080_4A4CB79A02C6get_var*
//#UC END# *4728BE830080_4A4CB79A02C6get_var*
begin
//#UC START# *4728BE830080_4A4CB79A02C6get_impl*
 if Printing then
  Result := f_PageWidthNumber
 else
  Result := 0;
//#UC END# *4728BE830080_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.pm_GetPageWidthNumber

function Tl3CanvasPrim.Get_Width: Tl3Inch;
//#UC START# *4A4CD82A0310_4A4CB79A02C6get_var*
//#UC END# *4A4CD82A0310_4A4CB79A02C6get_var*
begin
//#UC START# *4A4CD82A0310_4A4CB79A02C6get_impl*
 Result := DoGetPageSetupWidth;
//#UC END# *4A4CD82A0310_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.Get_Width

function Tl3CanvasPrim.Get_Height: Tl3Inch;
//#UC START# *4A4CD82E025B_4A4CB79A02C6get_var*
//#UC END# *4A4CD82E025B_4A4CB79A02C6get_var*
begin
//#UC START# *4A4CD82E025B_4A4CB79A02C6get_impl*
 Result := DoGetPageSetupHeight;
//#UC END# *4A4CD82E025B_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.Get_Height

function Tl3CanvasPrim.pm_GetPaperWidth: Tl3Inch;
//#UC START# *4A4CD8320146_4A4CB79A02C6get_var*
//#UC END# *4A4CD8320146_4A4CB79A02C6get_var*
begin
//#UC START# *4A4CD8320146_4A4CB79A02C6get_impl*
 Result := DoGetPaperWidth;
//#UC END# *4A4CD8320146_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.pm_GetPaperWidth

function Tl3CanvasPrim.pm_GetPaperHeight: Tl3Inch;
//#UC START# *4A4CD8350157_4A4CB79A02C6get_var*
//#UC END# *4A4CD8350157_4A4CB79A02C6get_var*
begin
//#UC START# *4A4CD8350157_4A4CB79A02C6get_impl*
 Result := DP2LP(PointY(DeviceCaps(PHYSICALHEIGHT))).Y;
//#UC END# *4A4CD8350157_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.pm_GetPaperHeight

function Tl3CanvasPrim.pm_GetMargins: Tl3_Rect;
//#UC START# *4A4CD83F0022_4A4CB79A02C6get_var*
var
 l_Ofs : Tl3Point;
//#UC END# *4A4CD83F0022_4A4CB79A02C6get_var*
begin
//#UC START# *4A4CD83F0022_4A4CB79A02C6get_impl*
 l_Ofs := DP2LP(l3SPoint(DeviceCaps(PHYSICALOFFSETX),
                         DeviceCaps(PHYSICALOFFSETY)));
 Result := f_Margins;
 Result.Left := Max(l_Ofs.X, Result.Left);
 Result.Top := Max(l_Ofs.Y, Result.Top);
 l_Ofs := DP2LP(l3SPoint(DeviceCaps(PHYSICALWIDTH) - DeviceCaps(HORZRES),
                         DeviceCaps(PHYSICALHEIGHT) - DeviceCaps(VERTRES))).Sub(l_Ofs);
 Result.Right := Max(l_Ofs.X, Result.Right);
//#UC END# *4A4CD83F0022_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.pm_GetMargins

procedure Tl3CanvasPrim.pm_SetMargins(const aValue: Tl3_Rect);
//#UC START# *4A4CD83F0022_4A4CB79A02C6set_var*
//#UC END# *4A4CD83F0022_4A4CB79A02C6set_var*
begin
//#UC START# *4A4CD83F0022_4A4CB79A02C6set_impl*
 f_Margins := aValue;
//#UC END# *4A4CD83F0022_4A4CB79A02C6set_impl*
end;//Tl3CanvasPrim.pm_SetMargins

function Tl3CanvasPrim.DP2LP(const aP: Tl3_SPoint): Tl3Point;
//#UC START# *4A4CE0990013_4A4CB79A02C6_var*
//#UC END# *4A4CE0990013_4A4CB79A02C6_var*
begin
//#UC START# *4A4CE0990013_4A4CB79A02C6_impl*
 if (aP.X = MaxInt) then
  Result.X := aP.X
 else
  Result.X := l3MulDiv(aP.X, l3Inch, PixelsPerInchX);
 if (aP.Y = MaxInt) then
  Result.Y := aP.Y
 else
  Result.Y := l3MulDiv(aP.Y, l3Inch, PixelsPerInchY);
//#UC END# *4A4CE0990013_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.DP2LP

function Tl3CanvasPrim.Get_IsPagesCounter: Boolean;
//#UC START# *4CB32CEA01FE_4A4CB79A02C6get_var*
//#UC END# *4CB32CEA01FE_4A4CB79A02C6get_var*
begin
//#UC START# *4CB32CEA01FE_4A4CB79A02C6get_impl*
 Result := GetIsPagesCounter;
//#UC END# *4CB32CEA01FE_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.Get_IsPagesCounter

function Tl3CanvasPrim.Get_OverallPageNumber: Integer;
//#UC START# *4CC68B5D00CA_4A4CB79A02C6get_var*
//#UC END# *4CC68B5D00CA_4A4CB79A02C6get_var*
begin
//#UC START# *4CC68B5D00CA_4A4CB79A02C6get_impl*
 if Printing then
  Result := f_OverallPageNumber
 else
  Result := -1;
//#UC END# *4CC68B5D00CA_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.Get_OverallPageNumber

function Tl3CanvasPrim.Get_InitialDCOffset: Tl3Point;
//#UC START# *4E007CC302AE_4A4CB79A02C6get_var*
//#UC END# *4E007CC302AE_4A4CB79A02C6get_var*
begin
//#UC START# *4E007CC302AE_4A4CB79A02C6get_impl*
 Result := f_InitialDCOffset;
//#UC END# *4E007CC302AE_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.Get_InitialDCOffset

function Tl3CanvasPrim.PushClipRect: Tl3Rect;
//#UC START# *4E26F481005B_4A4CB79A02C6_var*
//#UC END# *4E26F481005B_4A4CB79A02C6_var*
begin
//#UC START# *4E26F481005B_4A4CB79A02C6_impl*
 if (f_ClipRects = nil) then
  f_ClipRects := Tl3RectList.Create;
 Result := GetGlobalClipRectWithZoom;
 f_ClipRects.Add(Result);
 Result := Result.AddPt(WindowOrg);
//#UC END# *4E26F481005B_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.PushClipRect

procedure Tl3CanvasPrim.PopClipRect;
//#UC START# *4E26F4920228_4A4CB79A02C6_var*
var
 l_ClipRect: Tl3Rect;
//#UC END# *4E26F4920228_4A4CB79A02C6_var*
begin
//#UC START# *4E26F4920228_4A4CB79A02C6_impl*
 ClipRect := f_ClipRects.Last.AddPt(WindowOrg);
 f_ClipRects.Delete(f_ClipRects.Hi);
//#UC END# *4E26F4920228_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.PopClipRect

procedure Tl3CanvasPrim.Set_ClipRegion(const aValue: Il3Region);
//#UC START# *4E27061B0140_4A4CB79A02C6set_var*
var
 l_R : Il3Region;
//#UC END# *4E27061B0140_4A4CB79A02C6set_var*
begin
//#UC START# *4E27061B0140_4A4CB79A02C6set_impl*
 l_R := aValue.Clone;
 l_R.Offset(SWindowOrg.Neg);
 SelectClipRgn(DC, l_R.Rgn);
 f_ClipRectInited := false;
//#UC END# *4E27061B0140_4A4CB79A02C6set_impl*
end;//Tl3CanvasPrim.Set_ClipRegion

function Tl3CanvasPrim.Get_LineSpacing: Integer;
//#UC START# *4E57A9F10230_4A4CB79A02C6get_var*
//#UC END# *4E57A9F10230_4A4CB79A02C6get_var*
begin
//#UC START# *4E57A9F10230_4A4CB79A02C6get_impl*
 Result := f_LineSpacing;
//#UC END# *4E57A9F10230_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.Get_LineSpacing

procedure Tl3CanvasPrim.Set_LineSpacing(aValue: Integer);
//#UC START# *4E57A9F10230_4A4CB79A02C6set_var*
//#UC END# *4E57A9F10230_4A4CB79A02C6set_var*
begin
//#UC START# *4E57A9F10230_4A4CB79A02C6set_impl*
 if (aValue <= 0) OR (aValue >= Pred(High(Integer))) then
  Exit; 
 f_LineSpacing := aValue;
//#UC END# *4E57A9F10230_4A4CB79A02C6set_impl*
end;//Tl3CanvasPrim.Set_LineSpacing

procedure Tl3CanvasPrim.PushLineSpacing;
//#UC START# *4E6894860139_4A4CB79A02C6_var*
//#UC END# *4E6894860139_4A4CB79A02C6_var*
begin
//#UC START# *4E6894860139_4A4CB79A02C6_impl*
 if (f_LineSpacingStack = nil) then
  f_LineSpacingStack := Tl3LongintList.Create;
 f_LineSpacingStack.Add(f_LineSpacing); 
//#UC END# *4E6894860139_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.PushLineSpacing

procedure Tl3CanvasPrim.PopLineSpacing;
//#UC START# *4E68949A0121_4A4CB79A02C6_var*
//#UC END# *4E68949A0121_4A4CB79A02C6_var*
begin
//#UC START# *4E68949A0121_4A4CB79A02C6_impl*
 Assert(f_LineSpacingStack <> nil);
 Set_LineSpacing(f_LineSpacingStack.Last);
 f_LineSpacingStack.Delete(f_LineSpacingStack.Hi);
//#UC END# *4E68949A0121_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.PopLineSpacing

function Tl3CanvasPrim.Get_InitialDCOffsetStored: Tl3Point;
//#UC START# *4F2AC2020377_4A4CB79A02C6get_var*
//#UC END# *4F2AC2020377_4A4CB79A02C6get_var*
begin
//#UC START# *4F2AC2020377_4A4CB79A02C6get_impl*
 Result := f_InitialDCOffsetStored;
//#UC END# *4F2AC2020377_4A4CB79A02C6get_impl*
end;//Tl3CanvasPrim.Get_InitialDCOffsetStored

procedure Tl3CanvasPrim.Cleanup;
//#UC START# *479731C50290_4A4CB79A02C6_var*
//#UC END# *479731C50290_4A4CB79A02C6_var*
begin
//#UC START# *479731C50290_4A4CB79A02C6_impl*
 f_Printer := nil;
 FreeAndNil(f_ClipRects);
 FreeAndNil(f_LineSpacingStack);
 inherited;
//#UC END# *479731C50290_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.Cleanup

procedure Tl3CanvasPrim.InitFields;
//#UC START# *47A042E100E2_4A4CB79A02C6_var*
//#UC END# *47A042E100E2_4A4CB79A02C6_var*
begin
//#UC START# *47A042E100E2_4A4CB79A02C6_impl*
 inherited;
 f_Margins := l3Rect(0, 0, 0, def_inchPaperBottom);
 f_DeviceCaps.rIsAssigned := false;
 f_LineSpacing := def_LineSpacing;
//#UC END# *47A042E100E2_4A4CB79A02C6_impl*
end;//Tl3CanvasPrim.InitFields

end.