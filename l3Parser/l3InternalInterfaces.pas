unit l3InternalInterfaces;
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3Types,
  l3Core,
  l3Units,
  l3PrinterInterfaces,
  Classes
  ;

type
 Il3Base = l3Interfaces.Il3Base;

 Il3ObjectWrap = interface(Il3Base)
  {* Обертка вокруг объекта. Шаманство. Надо избавляться. }
   ['{691F62FE-0591-496A-AE9B-E36CE787B014}']
   function GetObject: TObject;
     {* получить объект из обертки. }
 end;//Il3ObjectWrap

 Il3CommandTarget = interface(Il3Base)
  {* Устройство для выполнения команд пользовательского ввода. }
   ['{C86F6C05-5FD3-46A8-B93C-7F941E64306C}']
   function ProcessCommand(Cmd: Tl3OperationCode;
    aForce: Boolean;
    aCount: Integer): Boolean;
 end;//Il3CommandTarget

 Il3Region = interface(Il3Base)
  {* Регион. }
   ['{A41D0FB9-7718-474F-8838-0F89E31E497D}']
   function pm_GetRgn: Tl3Rgn;
   procedure pm_SetRgn(aValue: Tl3Rgn);
   function pm_GetRect: Tl3SRect;
   procedure pm_SetRect(const aValue: Tl3SRect);
   function pm_GetEmpty: Boolean;
   function Clone: Il3Region;
     {* Создает копию региона. }
   function CombineRect(const Rect: Tl3SRect;
    CombineMode: Integer): Integer;
     {* комбинирует регион с прямоугольником Rect. }
   function Combine(const Source: Il3Region;
    CombineMode: Integer): Integer;
     {* комбинирует регион с регионом Source. }
   function Offset(const P: Tl3SPoint): Integer;
     {* осуществляет сдвиг региона. }
   function ContainsRect(const aRect: Tl3SRect): Boolean;
     {* определяет находится ли aRect в данном регионе. }
   procedure Assign(const Source: Il3Region);
     {* присваивает региону Source. }
   property Rgn: Tl3Rgn
     read pm_GetRgn
     write pm_SetRgn;
     {* Windows handle региона. }
   property Rect: Tl3SRect
     read pm_GetRect
     write pm_SetRect;
     {* прямоугольник в который вписан регион. }
   property Empty: Boolean
     read pm_GetEmpty;
     {* пустой регион? }
 end;//Il3Region

 Tl3TextFormatFlag = (
  {* Выравнивание текста. }
   l3_tffLeft
 , l3_tffCenter
 , l3_tffRight
 );//Tl3TextFormatFlag

 Il3EffectiveColors = interface(Il3Base)
   ['{2ED99AA8-FE25-4CA4-AA56-D24EDFA91DBB}']
   function Get_FontColor: Tl3Color;
   function Get_Font: Il3Font;
   procedure CheckColors;
   property FontColor: Tl3Color
     read Get_FontColor;
   property Font: Il3Font
     read Get_Font;
 end;//Il3EffectiveColors

 Il3HAFMacroReplacer = interface(Il3Base)
   ['{D3D0DD5B-1F2F-445D-9C3F-0E0A99F71B97}']
   function Get_Parent: Il3HAFMacroReplacer;
   procedure Set_Parent(const aValue: Il3HAFMacroReplacer);
   function Replace(const aText: Il3CString): Il3CString;
   function UnfoldOne(const aMacroName: Il3CString): Il3CString;
   property Parent: Il3HAFMacroReplacer
     read Get_Parent
     write Set_Parent;
 end;//Il3HAFMacroReplacer

(*
 Ml3UnitsConverter = PureMixIn
  {* Методы для конвертации различных единиц измерения }
   function DP2LP(const aP: Tl3_SPoint): Tl3Point;
     {* Преобразует точку в пикселях в точку в дюймах }
 end;//Ml3UnitsConverter
*)

(*
 Ml3OutputDevice = PureMixIn
  {* Устройство вывода }
   function DeviceCaps(anIndex: Integer): Integer;
     {* возвращает свойства устройства рисования. }
 end;//Ml3OutputDevice
*)

 Tl3DrawingStyle = (
   l3_dsFocus
 , l3_dsSelected
 , l3_dsNormal
 , l3_dsTransparent
 );//Tl3DrawingStyle

 Tl3ImageType = (
   l3_itImage
 , l3_itMask
 );//Tl3ImageType

(*
 Ml3PageInfo = PureMixIn
  {* Информация о странице }
   function Get_IsPagesCounter: Boolean;
   property IsPagesCounter: Boolean
     read Get_IsPagesCounter;
 end;//Ml3PageInfo
*)

(*
 Ml3PageNumberInfo = PureMixIn
  {* Информация о номерах страницы }
   function pm_GetPageNumber: Integer;
   function pm_GetPageWidthNumber: Integer;
   function Get_OverallPageNumber: Integer;
   property PageNumber: Integer
     read pm_GetPageNumber;
     {* номер страницы в высоту. }
   property PageWidthNumber: Integer
     read pm_GetPageWidthNumber;
     {* номер страницы в ширину. }
   property OverallPageNumber: Integer
     read Get_OverallPageNumber;
 end;//Ml3PageNumberInfo
*)

 Tl3MouseResult = (
  {* результат обработки события мыши. }
   l3_mrNotHandled
 , l3_mrHandled
 , l3_mrHandledAndMoveLoopNeed
 );//Tl3MouseResult

 Il3MouseHandler = interface(Il3Base)
  {* Интерфейс для части объекта, обрабатывающей действия мышью. }
   ['{A07E25E8-8BC2-4380-AD10-56797D6E72A9}']
   function DoAction(const aClickContext: IUnknown;
    const aPt: Tl3Point;
    aButton: Tl3MouseButton;
    anAction: Tl3MouseAction;
    Keys: TShiftState): Tl3MouseResult;
     {* обрабатывает событие от мыши. }
 end;//Il3MouseHandler

(*
 Ml3CanvasInfo = PureMixIn
   function IsVirtual: Boolean;
 end;//Ml3CanvasInfo
*)

 Il3KeyDataListener = interface(Il3Base)
   ['{1F8789EB-2BD7-45B1-9D32-AC7166B3C971}']
   function ProcessKeyData(aKey: Byte;
    aShiftFlags: Byte): Boolean;
 end;//Il3KeyDataListener
 PIl3KeyDataListener = ^Il3KeyDataListener;


 Il3CommandPublisherInfo = interface(Il3Base)
   ['{A76B5904-5A7D-4604-8685-6EEAC802130B}']
   function IsCommandPublished(Cmd: Tl3OperationCode): Boolean;
 end;//Il3CommandPublisherInfo

 Il3Flush = interface(Il3Base)
   ['{A8A55A25-815C-43BA-A462-2AFA7DA0D93D}']
   function Flush: Boolean;
 end;//Il3Flush

(*
 Ml3WindowOrg = PureMixIn
   function Get_InitialDCOffset: Tl3Point;
   function Get_InitialDCOffsetStored: Tl3Point;
   property InitialDCOffset: Tl3Point
     read Get_InitialDCOffset;
   property InitialDCOffsetStored: Tl3Point
     read Get_InitialDCOffsetStored;
 end;//Ml3WindowOrg
*)

(*
 Ml3CanvasState = PureMixIn
   procedure Set_ClipRegion(const aValue: Il3Region);
   function PushClipRect: Tl3Rect;
   procedure PopClipRect;
   property ClipRegion: Il3Region
     write Set_ClipRegion;
 end;//Ml3CanvasState
*)

 Il3ActionControl = interface(Il3Base)
   ['{37288C7F-2AAB-4DC0-B676-9C74EDA7EF65}']
   function Get_ActionData(Action: Integer): Integer;
   procedure Set_ActionData(Action: Integer; aValue: Integer);
   property ActionData[Action: Integer]: Integer
     read Get_ActionData
     write Set_ActionData;
 end;//Il3ActionControl

 Il3Control = interface(Il3Base)
   ['{7F25486F-544E-4CD1-B058-C3EA068969F7}']
   function Get_Enabled: Boolean;
   procedure Set_Enabled(aValue: Boolean);
   property Enabled: Boolean
     read Get_Enabled
     write Set_Enabled;
 end;//Il3Control

 Il3StringList = interface(Il3List)
   ['{8B53FD66-D56F-4913-8945-2BD2D645DC70}']
   function pm_GetItems(anIndex: Integer): Tl3PCharLen;
   procedure pm_SetItems(anIndex: Integer; const aValue: Tl3PCharLen);
   property Items[anIndex: Integer]: Tl3PCharLen
     read pm_GetItems
     write pm_SetItems;
     default;
 end;//Il3StringList

(*
 Ml3TextProperties = PureMixIn
   function Get_LineSpacing: Integer;
   procedure Set_LineSpacing(aValue: Integer);
   procedure PushLineSpacing;
   procedure PopLineSpacing;
   property LineSpacing: Integer
     read Get_LineSpacing
     write Set_LineSpacing;
     {* Интерлиньяж в процентах от размера строки }
 end;//Ml3TextProperties
*)

 Tl3PageOrientationArray = array [Tl3PageOrientation] of Tl3PageOrientation;

 Il3HandledStringList = interface(Il3StringList)
   ['{CFC585AD-D7E7-4325-BF6B-E928E68165D7}']
   function pm_GetHandle(anIndex: Integer): Integer;
   procedure pm_SetHandle(anIndex: Integer; aValue: Integer);
   property Handle[anIndex: Integer]: Integer
     read pm_GetHandle
     write pm_SetHandle;
 end;//Il3HandledStringList

 Il3CharSkipper = interface(Il3Base)
   ['{DB25BBA5-10B9-4F2D-93EC-16351A7DFE81}']
   procedure Init(aString: TObject);
   function GetChar: AnsiChar;
   function Index: Integer;
 end;//Il3CharSkipper

 Il3StringFormatter = interface(Il3Base)
   ['{26768C5D-F8B0-44AE-AB15-1D2DFC8A3B63}']
   procedure FixWidth(aString: TObject;
    aDelta: Integer;
    var aSpacesCount: Integer);
     {* Форматирует строку по ширине, добавляя в ней aSpacesCount пробелов.
             Количество неиспользованных пробелов возвращается в aSpacesCount.
             Если возвращается 0, то строка не была изменена. 
             aDelta - количество символов в конце строки, которые можно 
             игнорировать при подсчете пробелов. }
 end;//Il3StringFormatter

 Il3FontInfo2 = interface(Il3Font)
   ['{3B86A55A-5E98-40CB-B2B4-212387320131}']
 end;//Il3FontInfo2

 Il3ViewStringList = interface(Il3Base)
   ['{96740AF4-AF0E-4024-BC7D-A16A1A028915}']
   function pm_GetCount: Integer;
   function pm_GetViewString(anIndex: Integer): Il3CString;
   property Count: Integer
     read pm_GetCount;
     {* число элементов в хранилище. }
   property ViewString[anIndex: Integer]: Il3CString
     read pm_GetViewString;
     default;
 end;//Il3ViewStringList

 Il3StorageSource = interface(Il3Base)
   ['{5164CBED-D742-4695-98DA-180B7CC128EE}']
   function pm_GetStorage: IStorage;
   property Storage: IStorage
     read pm_GetStorage;
 end;//Il3StorageSource

 Il3ActionProcessor = interface(Il3Base)
  {* Объект обработчик операций. }
   ['{4A710C7C-37ED-4FE1-9D71-DAE3600BA633}']
   function Process(Sender: TObject;
    Target: TObject;
    Action: Integer;
    Down: Boolean): Boolean;
     {* функция обработки операции. }
 end;//Il3ActionProcessor

 Il3Renderer = interface(Il3Base)
  {* Объект, рисующий картинку }
   ['{7AD269DC-BA07-488A-94D6-351661997993}']
   procedure Render(aCanvas: TCanvas;
    const aColors: Il3EffectiveColors);
     {* Отрисовать картинку }
   function CalcExtent(const aFont: Il3Font): Tl3_SPoint;
   procedure SetForWMF(aValue: Boolean);
 end;//Il3Renderer

(*
 Ml3CanvasInvert = PureMixIn
   function pm_GetInvert: Boolean;
   procedure BeginInvert;
   procedure EndInvert;
   property Invert: Boolean
     read pm_GetInvert;
 end;//Ml3CanvasInvert
*)

 Tl3FrameObjectBehaviour = (
   l3_fobNone
 , l3_fobPrinting
 , l3_fobIgnore
 );//Tl3FrameObjectBehaviour

 Il3AbortChecker = interface(Il3Base)
   ['{449D2C36-4C38-4A05-95ED-96C56BD43B81}']
   function IsAborted: Boolean;
 end;//Il3AbortChecker

 TspBlockType = (
   sp_btNone
 , sp_btText
 , sp_btBlock
 );//TspBlockType

 Il3FrameLines = interface;
 { - предварительное описание Il3FrameLines. }

 Il3InfoCanvas = interface(Il3Base)
  {* Информационная канва - только для получения метрик }
   ['{B5288390-13E8-4522-8C74-6CE46266FBA2}']
   function pm_GetDC: hDC;
   procedure pm_SetDC(aValue: hDC);
   function pm_GetPixelsPerInchX: Integer;
   function pm_GetPixelsPerInchY: Integer;
   function Get_PasswordChar: AnsiChar;
   procedure Set_PasswordChar(aValue: AnsiChar);
   function pm_GetPrinting: Boolean;
   function pm_GetZoom: Integer;
   procedure pm_SetZoom(aValue: Integer);
   function Get_Font: Il3Font;
   procedure Set_Font(const aValue: Il3Font);
   function pm_GetFrameLines: Il3FrameLines;
   function PxAverageCharWidth: Integer;
     {* средняя ширина символов контекста в пикселях. }
   function AverageCharWidth: Integer;
     {* средняя ширина символов контекста в дюймах. }
   function TextExtent(const S: Tl3WString;
    aNoTabs: Boolean = false): Tl3Point;
     {* возвращает длину строки текста в дюймах. }
   function Pos2Index(W: Integer;
    const S: Tl3PCharLen): Integer;
     {* находит индекс символа на рассоянии W дюймов от начала строки S. }
   function Pos2IndexQ(W: Integer;
    const S: Tl3PCharLen;
    var aNoTabs: Boolean): Integer;
     {* находит индекс символа на рассоянии W дюймов от начала строки S. }
   function AverageCharHeight: Integer;
     {* средняя высота символов контекста в дюймах. }
   function LP2DP(const P: Tl3_Point;
    NeedZoom: Boolean = false): Tl3SPoint;
     {* преобразует точку в дюймах в точку в пикселях. }
   function LR2DR(const R: Tl3Rect): Tl3SRect;
     {* преобразует прямоугольник в дюймах в прямоугольник в пикселях. }
   function DR2LR(const R: Tl3SRect): Tl3Rect;
     {* преобразует прямоугольник в пикселях в прямоугольник в дюймах. }
   procedure Lock;
     {* начать работу с канвой. }
   procedure Unlock;
     {* закончить работу с канвой. }
   function GetKerning(const aSt: Tl3WString;
    Kerning: PLong): Tl3Point;
     {* получить размеры строки и таблицу кернинга. }
   function OffsetRgn(const Rgn: Il3Region;
    const Pt: Tl3Point): Integer;
     {* сдвинуть регион. }
   function CaretExtent: Tl3Point;
     {* размеры курсора. }
   procedure StartTabs(out theTabInfo: Il3TabInfo;
    const aTabStops: Il3TabStops;
    aTabOffset: Integer = 0); overload; 
   procedure StartTabs(out theTabInfo: Il3TabInfo;
    const aTabInfo: Il3TabInfo); overload; 
   procedure FinishTabs(var aTabInfo: Il3TabInfo);
   function TabInfo: Il3TabInfo;
   function EQ(const aCanvas: Il3InfoCanvas): Boolean;
   function NearestColor(C: Tl3Color): Tl3Color;
   function DrawText(const aSt: Tl3WString;
    var R: TRect;
    aFormat: Cardinal;
    AFl: TObject = nil): Il3MultiLines;
     {* как ни глупо звучит, но это нужно на информационной канве, т.к. она вычисляет прямоугольник вывода. }
   procedure TabbedMultilineTextOut(const aSt: Tl3WString;
    const Tabs: Il3TabStops;
    var Rect: Tl3Rect;
    Precalculate: Boolean;
    aGap: Integer);
     {* как ни глупо звучит, но это нужно на информационной канве, т.к. она вычисляет прямоугольник вывода. }
   procedure PushBC;
   function TopBC: Tl3Color;
   procedure PopBC;
   procedure PushFC;
   procedure PopFC;
   function TextMetrics: PTextMetric;
   function AdjustMarginsByPrintableArea(const aMargins: Tl3_Rect): Tl3_Rect;
     {* Откорректировать поля с учетом непечатаемой области }
   function CheckConvertString(const aStr: Tl3PCharLen): Tl3PCharLen;
     {* преобразует строку для отображения форматирующей информации в режиме DrawSpecial. }
   function CheckOutString(const aStr: Tl3PCharLen): Tl3PCharLen;
   property DC: hDC
     read pm_GetDC
     write pm_SetDC;
     {* Handle контекста. }
   property PixelsPerInchX: Integer
     read pm_GetPixelsPerInchX;
   property PixelsPerInchY: Integer
     read pm_GetPixelsPerInchY;
   property PasswordChar: AnsiChar
     read Get_PasswordChar
     write Set_PasswordChar;
   property Printing: Boolean
     read pm_GetPrinting;
     {* печать? }
   property Zoom: Integer
     read pm_GetZoom
     write pm_SetZoom;
     {* масштаб. }
   property Font: Il3Font
     read Get_Font
     write Set_Font;
     {* текущий шрифт. }
   property FrameLines: Il3FrameLines
     read pm_GetFrameLines;
  // Ml3UnitsConverter
   function DP2LP(const aP: Tl3_SPoint): Tl3Point;
     {* Преобразует точку в пикселях в точку в дюймах }
  // Ml3OutputDevice
   function DeviceCaps(anIndex: Integer): Integer;
     {* возвращает свойства устройства рисования. }
  // Ml3PageInfo
   function Get_IsPagesCounter: Boolean;
   property IsPagesCounter: Boolean
     read Get_IsPagesCounter;
  // Ml3PageNumberInfo
   function pm_GetPageNumber: Integer;
   function pm_GetPageWidthNumber: Integer;
   function Get_OverallPageNumber: Integer;
   property PageNumber: Integer
     read pm_GetPageNumber;
     {* номер страницы в высоту. }
   property PageWidthNumber: Integer
     read pm_GetPageWidthNumber;
     {* номер страницы в ширину. }
   property OverallPageNumber: Integer
     read Get_OverallPageNumber;
  // Ml3CanvasInfo
   function IsVirtual: Boolean;
  // Ml3TextProperties
   function Get_LineSpacing: Integer;
   procedure Set_LineSpacing(aValue: Integer);
   procedure PushLineSpacing;
   procedure PopLineSpacing;
   property LineSpacing: Integer
     read Get_LineSpacing
     write Set_LineSpacing;
     {* Интерлиньяж в процентах от размера строки }
 end;//Il3InfoCanvas

 Il3HAFPainter = interface;
 { - предварительное описание Il3HAFPainter. }

 Il3Canvas = interface(Il3InfoCanvas)
  {* Канва для рисования }
   ['{F14964DA-11A9-490F-8D5C-A02BEAF85B84}']
   function pm_GetWindowOrg: Tl3Point;
   procedure pm_SetWindowOrg(const aValue: Tl3Point);
   function pm_GetSWindowOrg: Tl3SPoint;
   procedure pm_SetSWindowOrg(const aValue: Tl3SPoint);
   function pm_GetClipRect: Tl3Rect;
   procedure pm_SetClipRect(const aValue: Tl3Rect);
   function pm_GetGlobalClipRect: Tl3Rect;
   function pm_GetBackColor: Tl3Color;
   procedure pm_SetBackColor(aValue: Tl3Color);
   function pm_GetDrawEnabled: Boolean;
   procedure pm_SetDrawEnabled(aValue: Boolean);
   function pm_GetDrawSpecial: Boolean;
   function pm_GetCanDrawSubs: Boolean;
   function pm_GetShowCursor: Boolean;
   procedure pm_SetShowCursor(aValue: Boolean);
   function pm_GetFontIndexSet: Tl3FontIndexes;
   procedure pm_SetFontIndexSet(aValue: Tl3FontIndexes);
   function pm_GetPrinted: Boolean;
   procedure pm_SetPrinted(aValue: Boolean);
   function pm_GetPenWidth: Integer;
   function pm_GetPageOrientation: Tl3PageOrientation;
   procedure pm_SetPageOrientation(aValue: Tl3PageOrientation);
   function pm_GetSectionExtent: Tl3Point;
   procedure pm_SetSectionExtent(const aValue: Tl3Point);
   procedure pm_SetNotFocused(aValue: Boolean);
   function pm_GetRegionBottomRight: Tl3Point;
   function Get_EffectiveColors: Il3EffectiveColors;
   function pm_GetPageSetup: Il3PageSetup;
   procedure pm_SetPainter(const aValue: Il3HAFPainter);
   function pm_GetCanvas: TCanvas;
   function Get_AbortChecker: Il3AbortChecker;
   procedure Set_AbortChecker(const aValue: Il3AbortChecker);
   procedure MoveWindowOrg(const Delta: Tl3Point); overload; 
   procedure MoveWindowOrg(const Delta: Tl3SPoint); overload; 
   procedure FillForeRect(const R: Tl3SRect);
   procedure FillRect(const R: Tl3SRect); overload; 
   procedure FillRect(const R: Tl3Rect); overload; 
   procedure FillEmptyRect(const R: Tl3Rect); overload; 
   procedure FillEmptyRect(const R: Tl3SRect); overload; 
   function FillRgn(const Region: Il3Region): Boolean;
   function TextOut(const P: Tl3Point;
    const S: Tl3PCharLen;
    FC: Tl3Color = clDefault;
    BC: Tl3Color = clDefault): Tl3Point;
   procedure SetCaret(const Origin: Tl3Point;
    const Extent: Tl3Point;
    Hidden: Boolean = false);
   procedure IncCaret(aDeltaX: Integer);
   procedure BeginPaint;
   procedure StartObject(anObjectID: Integer);
   procedure SetPageTop;
   procedure EndPaint;
   function DrawRgnOrBlock: Boolean;
   function HasToDraw: Boolean;
   procedure StretchDraw(const R: Tl3Rect;
    Graphic: VCLGraphic);
   procedure DrawSub(aSubTarget: TObject;
    const R: Tl3Rect;
    LayerHandle: Integer;
    aSub: TObject);
   procedure ExtTextOut(const P: Tl3Point;
    const R: Tl3Rect;
    const S: Tl3WString;
    F: Tl3TextFormatFlag = l3_tffLeft;
    Dx: PInteger = nil); overload; 
   procedure ExtTextOut(const P: Tl3SPoint;
    const R: Tl3SRect;
    const S: Tl3WString;
    F: Tl3TextFormatFlag = l3_tffLeft;
    Dx: PInteger = nil); overload; 
   function CaretLineOut(const aSt: Tl3WString;
    LineHeight: Integer;
    aHidden: Boolean;
    var CaretPos: Integer): Tl3Point;
     {* выводит строку текста высотой LineHeight, со сдвигом курсора отрисовки. устанавливает курсор в CaretPos. возвращает размеры выведенной строки. }
   function StringOut(const P: Tl3Point;
    const Text: Tl3WString): Tl3Point;
   procedure TabbedTextOut(const P: Tl3Point;
    const R: Tl3Rect;
    const S: Tl3WString;
    const aTabStops: Il3TabStops); overload; 
   procedure TabbedTextOut(const P: Tl3SPoint;
    const R: Tl3SRect;
    const S: Tl3WString;
    const aTabStops: Il3TabStops); overload; 
   function NewPage(ByWidth: Boolean = false): Boolean;
     {* начать новую страницу. }
   procedure Line(const A: Tl3Point;
    const B: Tl3Point); overload; 
     {* нарисовать линию. }
   procedure Line(const A: Tl3SPoint;
    const B: Tl3SPoint); overload; 
     {* нарисовать линию. }
   procedure MoveTo(const Pt: Tl3Point); overload; 
   procedure LineTo(const Pt: Tl3Point); overload; 
   procedure MoveTo(const Pt: Tl3SPoint); overload; 
   procedure LineTo(const Pt: Tl3SPoint); overload; 
   function WO(const aRect: Tl3Rect): Tl3SRect; overload; 
   function WO(const aPt: Tl3Point): Tl3SPoint; overload; 
   function WO(const aPt: Tl3SPoint): Tl3SPoint; overload; 
   procedure DrawFocusRect(const aRect: Tl3SRect);
   procedure StartRegion;
   procedure FinishRegion;
   procedure PushWO;
   procedure PopWO;
   function GetClientRect: Tl3Rect;
   procedure StartDrawAAC(aType: TspBlockType);
   procedure EndDrawAAC(const R: Tl3Rect);
   procedure BeginDarkColor;
   procedure EndDarkColor;
   property WindowOrg: Tl3Point
     read pm_GetWindowOrg
     write pm_SetWindowOrg;
     {* смещение начала координат в дюймах. }
   property SWindowOrg: Tl3SPoint
     read pm_GetSWindowOrg
     write pm_SetSWindowOrg;
     {* смещение начала координат в пикселях. }
   property ClipRect: Tl3Rect
     read pm_GetClipRect
     write pm_SetClipRect;
     {* прямоугольник отсечения. }
   property GlobalClipRect: Tl3Rect
     read pm_GetGlobalClipRect;
   property BackColor: Tl3Color
     read pm_GetBackColor
     write pm_SetBackColor;
   property DrawEnabled: Boolean
     read pm_GetDrawEnabled
     write pm_SetDrawEnabled;
     {* разрешено рисование? }
   property DrawSpecial: Boolean
     read pm_GetDrawSpecial;
     {* рисовать спецсимволы? }
   property CanDrawSubs: Boolean
     read pm_GetCanDrawSubs;
     {* можем рисовать Sub'ы? }
   property ShowCursor: Boolean
     read pm_GetShowCursor
     write pm_SetShowCursor;
     {* отображать курсор? }
   property FontIndexSet: Tl3FontIndexes
     read pm_GetFontIndexSet
     write pm_SetFontIndexSet;
     {* текущий набор индексов шрифта. }
   property Printed: Boolean
     read pm_GetPrinted
     write pm_SetPrinted;
     {* все напечатано? }
   property PenWidth: Integer
     read pm_GetPenWidth;
     {* ширина пера. }
   property PageOrientation: Tl3PageOrientation
     read pm_GetPageOrientation
     write pm_SetPageOrientation;
     {* ориентация страницы. }
   property SectionExtent: Tl3Point
     read pm_GetSectionExtent
     write pm_SetSectionExtent;
     {* размеры текущего раздела с дюймах. }
   property NotFocused: Boolean
     write pm_SetNotFocused;
   property RegionBottomRight: Tl3Point
     read pm_GetRegionBottomRight;
   property EffectiveColors: Il3EffectiveColors
     read Get_EffectiveColors;
   property PageSetup: Il3PageSetup
     read pm_GetPageSetup;
   property Painter: Il3HAFPainter
     write pm_SetPainter;
   property Canvas: TCanvas
     read pm_GetCanvas;
   property AbortChecker: Il3AbortChecker
     read Get_AbortChecker
     write Set_AbortChecker;
  // Ml3WindowOrg
   function Get_InitialDCOffset: Tl3Point;
   function Get_InitialDCOffsetStored: Tl3Point;
   property InitialDCOffset: Tl3Point
     read Get_InitialDCOffset;
   property InitialDCOffsetStored: Tl3Point
     read Get_InitialDCOffsetStored;
  // Ml3CanvasState
   procedure Set_ClipRegion(const aValue: Il3Region);
   function PushClipRect: Tl3Rect;
   procedure PopClipRect;
   property ClipRegion: Il3Region
     write Set_ClipRegion;
  // Ml3CanvasInvert
   function pm_GetInvert: Boolean;
   procedure BeginInvert;
   procedure EndInvert;
   property Invert: Boolean
     read pm_GetInvert;
 end;//Il3Canvas

 Il3CStringList = interface(Il3List)
   ['{F7BD6D08-43A8-4C7B-AF1B-BA0233E5CA55}']
   function pm_GetItems(anIndex: Integer): Il3CString;
   property Items[anIndex: Integer]: Il3CString
     read pm_GetItems;
     default;
 end;//Il3CStringList

 Tl3AskClearClipboardProc = procedure (var aResult: Integer) of object;

 Il3HAFPainter = interface(Il3Base)
   ['{5237593E-C8A3-4298-A62C-7AC17464D22C}']
   function Get_MacroReplacer: Il3HAFMacroReplacer;
   function DocumentName: Il3CString;
   function NeedPagesCount: Boolean;
   procedure SetPagesCount(aValue: Integer);
   procedure StartPage(const CN: Il3Canvas;
    aTop: Boolean);
   property MacroReplacer: Il3HAFMacroReplacer
     read Get_MacroReplacer;
 end;//Il3HAFPainter

  Tl3FrameAnalizeType = (
    laAddOnly
  , laDoNothing
  , laDelayAlignLowLine
  , laCheckOnly
  );//Tl3FrameAnalizeType

(*
 Ml3FrameLines = PureMixIn
  {* Интерфейс выравнивателя линий для объектов с рамками. Линии располагаются в двух массивах (вертикальных и горизонтальных линий) }
   function Get_FinishedFO(aFrameObjID: Integer): Boolean;
   procedure Set_FinishedFO(aFrameObjID: Integer; aValue: Boolean);
   procedure StartFrameObject(anBehaviour: Tl3FrameObjectBehaviour;
    aFrameObjID: Integer;
    const aColorArray: Tl3LinesColorArray);
     {* Скобки для отрисовки "сложных" объектов с рамками - таблиц. }
   procedure FinishFrameObject(anObjectID: Integer;
    aAlignValue: Integer);
     {* Скобки для отрисовки "сложных" объектов с рамками - таблиц. }
   procedure AddFrame(const aCanvas: Il3Canvas;
    anObjectID: Integer;
    const aFrame: Tl3Frame;
    anAnalizeType: Tl3FrameAnalizeType);
     {* Учесть рамку (продлить одну или несколько линий или создать новую). }
   procedure AlignBoundary(anObjectID: Integer;
    const aFrame: Tl3Frame;
    anIsSingle: Boolean);
     {* Применить выравнивающие ограничения. }
   procedure DrawAllLines(const aCanvas: Il3Canvas;
    anObjectID: Integer);
     {* Нарисовать выровненные рамки. anObjectID = -1 выводить все линии, 
          если anObjectID > -1, то выводим линии только для одного объекта. 
          Пока в качестве anObjectID передается PID параграфа (таблицы и т.п.) }
   procedure DrawFrame(const aCanvas: Il3Canvas;
    const aFrame: Tl3Frame;
    const aText: Il3FrameTextPainter);
     {* Отрисовывает рамку. }
   function GetLineWidth(aFrameObjID: Integer): Integer;
     {* Возвращает ширину линии для указанного объекта. }
   function ReadAlignData(anObjectID: Integer): Il3IntegerList;
     {* Прочитать массив данных для сохранения }
   procedure WriteAlignData(anObjectID: Integer;
    const aData: Il3IntegerList);
     {* Записать данные о выравнивании }
   {$If defined(nsTest)}
   procedure SetNeedLogging(anObjectID: Integer;
    aNeedLog: Boolean);
     {* Метод для тестов. Выставляет флаг объекту о необходимости записи в лог. }
   {$IfEnd} //nsTest
   {$If defined(nsTest)}
   procedure ClearFrameObject(aFrameObjID: Integer);
   {$IfEnd} //nsTest
   property FinishedFO[aFrameObjID: Integer]: Boolean
     read Get_FinishedFO
     write Set_FinishedFO;
     {* Флаг окончания отрисовки объекта. }
 end;//Ml3FrameLines
*)

 Il3FrameLines = interface(Il3Base)
  {* Интерфейс выравнивателя линий для объектов с рамками. Линии располагаются в двух массивах (вертикальных и горизонтальных линий) }
   ['{7A267AFC-D1FE-405D-8753-51C286B632EB}']
  // Ml3FrameLines
   function Get_FinishedFO(aFrameObjID: Integer): Boolean;
   procedure Set_FinishedFO(aFrameObjID: Integer; aValue: Boolean);
   procedure StartFrameObject(anBehaviour: Tl3FrameObjectBehaviour;
    aFrameObjID: Integer;
    const aColorArray: Tl3LinesColorArray);
     {* Скобки для отрисовки "сложных" объектов с рамками - таблиц. }
   procedure FinishFrameObject(anObjectID: Integer;
    aAlignValue: Integer);
     {* Скобки для отрисовки "сложных" объектов с рамками - таблиц. }
   procedure AddFrame(const aCanvas: Il3Canvas;
    anObjectID: Integer;
    const aFrame: Tl3Frame;
    anAnalizeType: Tl3FrameAnalizeType);
     {* Учесть рамку (продлить одну или несколько линий или создать новую). }
   procedure AlignBoundary(anObjectID: Integer;
    const aFrame: Tl3Frame;
    anIsSingle: Boolean);
     {* Применить выравнивающие ограничения. }
   procedure DrawAllLines(const aCanvas: Il3Canvas;
    anObjectID: Integer);
     {* Нарисовать выровненные рамки. anObjectID = -1 выводить все линии, 
          если anObjectID > -1, то выводим линии только для одного объекта. 
          Пока в качестве anObjectID передается PID параграфа (таблицы и т.п.) }
   procedure DrawFrame(const aCanvas: Il3Canvas;
    const aFrame: Tl3Frame;
    const aText: Il3FrameTextPainter);
     {* Отрисовывает рамку. }
   function GetLineWidth(aFrameObjID: Integer): Integer;
     {* Возвращает ширину линии для указанного объекта. }
   function ReadAlignData(anObjectID: Integer): Il3IntegerList;
     {* Прочитать массив данных для сохранения }
   procedure WriteAlignData(anObjectID: Integer;
    const aData: Il3IntegerList);
     {* Записать данные о выравнивании }
   {$If defined(nsTest)}
   procedure SetNeedLogging(anObjectID: Integer;
    aNeedLog: Boolean);
     {* Метод для тестов. Выставляет флаг объекту о необходимости записи в лог. }
   {$IfEnd} //nsTest
   {$If defined(nsTest)}
   procedure ClearFrameObject(aFrameObjID: Integer);
   {$IfEnd} //nsTest
   property FinishedFO[aFrameObjID: Integer]: Boolean
     read Get_FinishedFO
     write Set_FinishedFO;
     {* Флаг окончания отрисовки объекта. }
 end;//Il3FrameLines

 Il3ImageList = interface(Il3Base)
  {* Список картинок. }
   ['{2E49878A-3EF5-42BF-BE6C-C5F8FB56F554}']
   function pm_GetWidth: Integer;
   function pm_GetHeight: Integer;
   function pm_GetCount: Integer;
   function pm_GetHandle: THandle;
   function pm_GetBigSize: Boolean;
   procedure pm_SetBigSize(aValue: Boolean);
   procedure Draw(const aCanvas: Il3Canvas;
    const aRect: Tl3SRect;
    aFillColor: Tl3Color;
    Index: Integer;
    Enabled: Boolean = True); overload; 
   procedure Draw(const aCanvas: Il3Canvas;
    X: Integer;
    Y: Integer;
    Index: Integer;
    Enabled: Boolean = True); overload; 
   procedure Draw(const aCanvas: Il3Canvas;
    X: Integer;
    Y: Integer;
    Index: Integer;
    ADrawingStyle: Tl3DrawingStyle;
    AImageType: Tl3ImageType;
    Enabled: Boolean = True); overload; 
   function Hack: pointer;
   property Width: Integer
     read pm_GetWidth;
   property Height: Integer
     read pm_GetHeight;
   property Count: Integer
     read pm_GetCount;
   property Handle: THandle
     read pm_GetHandle;
   property BigSize: Boolean
     read pm_GetBigSize
     write pm_SetBigSize;
 end;//Il3ImageList

  Tl3Range = record
    rStart : Integer;
    rLength : Integer;
  end;//Tl3Range

 Il3RangeTool = interface(Il3Base)
   ['{6D668689-FA10-4F02-AAC3-F7F6067D951B}']
   function pm_GetRangeCount: Integer;
   function Get_Ranges(Index: Integer): Tl3Range;
   property RangeCount: Integer
     read pm_GetRangeCount;
   property Ranges[Index: Integer]: Tl3Range
     read Get_Ranges;
 end;//Il3RangeTool

 Il3Bitmap = interface(Il3Base)
  {* Картинка. }
   ['{35C6D55E-4EC5-41B3-9336-6BE9C95F4790}']
   function pm_GetWidth: Integer;
   function pm_GetHeight: Integer;
   function pm_GetInchWidth: Integer;
   function pm_GetInchHeight: Integer;
   procedure StretchDraw(const R: Tl3Rect;
    const aCanvas: Il3Canvas);
   procedure SaveToClipboardFormat(var AFormat: Word;
    var AData: THandle;
    var APalette: HPALETTE);
   procedure AssignTo(P: TObject);
   procedure Assign(P: TPersistent);
   function IsMF: Boolean;
   property Width: Integer
     read pm_GetWidth;
   property Height: Integer
     read pm_GetHeight;
   property InchWidth: Integer
     read pm_GetInchWidth;
   property InchHeight: Integer
     read pm_GetInchHeight;
 end;//Il3Bitmap

 Il3SmartCanvas = interface(Il3Base)
  {* Канва для рисования примитивов контролов. }
   ['{AF479CB2-7EAE-49C8-BCFE-E05A2805CE38}']
   procedure DrawEdit(const R: Tl3SRect;
    aEnabled: Boolean;
    aFocused: Boolean;
    aReadOnly: Boolean;
    anIs3D: Boolean;
    aPartDraw: Boolean;
    var aBorderWidth: Integer);
   procedure DrawCheckOrRadio(aDrawCheck: Boolean;
    const R: Tl3SRect;
    aState: Tl3CheckBoxState;
    aEnabled: Boolean;
    aFlat: Boolean);
   procedure DrawComboBox(const R: Tl3SRect;
    aBtnWidth: Integer;
    anEnabled: Boolean;
    aFocused: Boolean;
    aReadOnly: Boolean;
    anIs3D: Boolean;
    aPartDraw: Boolean;
    aDown: Boolean);
   procedure DrawSpinEditBox(const R: Tl3SRect;
    aBtnWidth: Integer;
    aEnabled: Boolean;
    aFocused: Boolean;
    aReadOnly: Boolean;
    aPartDraw: Boolean;
    anIs3D: Boolean);
   procedure DrawButton(const aCaption: Tl3PCharLen;
    const R: Tl3SRect;
    aEnabled: Boolean;
    aFlat: Boolean;
    aTransparent: Boolean;
    aMouseInControl: Boolean;
    aState: Tl3ButtonState;
    aColor: Tl3Color;
    const aImgList: Il3ImageList;
    aIndex: Integer);
   procedure DrawHelpControl(const aRect: Tl3SRect;
    aColor: Tl3Color;
    const aImgList: Il3ImageList;
    aIndex: Integer);
   procedure DrawPictureButton(const aRect: Tl3SRect;
    aMouseInControl: Boolean;
    anEnabled: Boolean;
    aState: Tl3ButtonState;
    aColor: Tl3Color;
    const aImgList: Il3ImageList;
    aIndex: Integer);
   procedure DrawSpinButtons(const R: Tl3SRect;
    aEnabled: Boolean;
    aFlat: Boolean);
   procedure DrawElipsisEdit(const R: Tl3SRect;
    aBtnWidth: Integer;
    aEnabled: Boolean;
    aFocused: Boolean;
    aReadOnly: Boolean;
    anIs3D: Boolean;
    aPartDraw: Boolean;
    const aImgList: Il3ImageList;
    aImageIndex: Integer);
   procedure DrawCollapsedPanel(const aCaption: Tl3PCharLen;
    var R: Tl3SRect;
    aEnabled: Boolean;
    aCollapsed: Boolean;
    aUpper: Boolean;
    aDown: Boolean;
    aBtnVisible: Boolean;
    aColor: Tl3Color;
    anAlignment: Tl3Alignment;
    const aImgList: Il3ImageList;
    aNeedFrame: Boolean);
 end;//Il3SmartCanvas

 Il3NodePainter = interface(Il3Base)
  {* Интерфейс для отрисовки ноды. }
   ['{26FC09D4-160F-45A0-BBB2-908CC44A010B}']
   procedure PaintNode(const aCanvas: Il3Canvas;
    const aRect: Tl3Rect;
    aSelStart: Integer;
    aSelEnd: Integer;
    DoInverse: Boolean = False);
     {* Рисует ноду }
   function CalcHeight(const aCanvas: Il3InfoCanvas;
    aWidth: Integer): Integer;
     {* Считает высоту по ширине. }
   function HintSupported: Boolean;
     {* Надо выводить хинт }
   function GetItemTextIndent(const aCanvas: Il3InfoCanvas;
    aTextHeight: Integer): Integer;
 end;//Il3NodePainter

 Hl3Canvas = {$IfDef XE4}record{$Else}object{$EndIf}
  {* Обёртка для Il3Canvas }
 private
  f_Il3Canvas : Il3Canvas;
 {$IfDef XE4}private{$Else}protected{$EndIf}
 // realized methods
   function Get_Font: Il3Font;
   procedure Set_Font(const aValue: Il3Font);
   function pm_GetDC: hDC;
   procedure pm_SetDC(aValue: hDC);
   function pm_GetPixelsPerInchX: Integer;
   function pm_GetPixelsPerInchY: Integer;
   function pm_GetWindowOrg: Tl3Point;
   procedure pm_SetWindowOrg(const aValue: Tl3Point);
   function pm_GetSWindowOrg: Tl3SPoint;
   procedure pm_SetSWindowOrg(const aValue: Tl3SPoint);
   function pm_GetClipRect: Tl3Rect;
   procedure pm_SetClipRect(const aValue: Tl3Rect);
   function pm_GetGlobalClipRect: Tl3Rect;
   function pm_GetBackColor: Tl3Color;
   procedure pm_SetBackColor(aValue: Tl3Color);
   function pm_GetDrawEnabled: Boolean;
   procedure pm_SetDrawEnabled(aValue: Boolean);
   function pm_GetDrawSpecial: Boolean;
   function pm_GetCanDrawSubs: Boolean;
   function pm_GetShowCursor: Boolean;
   procedure pm_SetShowCursor(aValue: Boolean);
   function pm_GetFontIndexSet: Tl3FontIndexes;
   procedure pm_SetFontIndexSet(aValue: Tl3FontIndexes);
   function pm_GetPrinted: Boolean;
   procedure pm_SetPrinted(aValue: Boolean);
   function pm_GetPageNumber: Integer;
   function pm_GetPageWidthNumber: Integer;
   function pm_GetPenWidth: Integer;
   function pm_GetPageOrientation: Tl3PageOrientation;
   procedure pm_SetPageOrientation(aValue: Tl3PageOrientation);
   function pm_GetSectionExtent: Tl3Point;
   procedure pm_SetSectionExtent(const aValue: Tl3Point);
   procedure pm_SetNotFocused(aValue: Boolean);
   function pm_GetRegionBottomRight: Tl3Point;
   function Get_PasswordChar: AnsiChar;
   procedure Set_PasswordChar(aValue: AnsiChar);
   function Get_EffectiveColors: Il3EffectiveColors;
   function pm_GetPrinting: Boolean;
   function pm_GetZoom: Integer;
   procedure pm_SetZoom(aValue: Integer);
   function pm_GetPageSetup: Il3PageSetup;
   procedure pm_SetPainter(const aValue: Il3HAFPainter);
   function pm_GetCanvas: TCanvas;
   function Get_IsPagesCounter: Boolean;
   function Get_OverallPageNumber: Integer;
   function Get_InitialDCOffset: Tl3Point;
   procedure Set_ClipRegion(const aValue: Il3Region);
   function Get_LineSpacing: Integer;
   procedure Set_LineSpacing(aValue: Integer);
   function pm_GetInvert: Boolean;
   function Get_InitialDCOffsetStored: Tl3Point;
   function pm_GetFrameLines: Il3FrameLines;
   function Get_AbortChecker: Il3AbortChecker;
   procedure Set_AbortChecker(const aValue: Il3AbortChecker);
 public
 // realized methods
   function PxAverageCharWidth: Integer;
     {* средняя ширина символов контекста в пикселях. }
   function AverageCharWidth: Integer;
     {* средняя ширина символов контекста в дюймах. }
   function TextExtent(const S: Tl3WString;
    aNoTabs: Boolean = false): Tl3Point;
     {* возвращает длину строки текста в дюймах. }
   function Pos2Index(W: Integer;
    const S: Tl3PCharLen): Integer;
     {* находит индекс символа на рассоянии W дюймов от начала строки S. }
   function Pos2IndexQ(W: Integer;
    const S: Tl3PCharLen;
    var aNoTabs: Boolean): Integer;
     {* находит индекс символа на рассоянии W дюймов от начала строки S. }
   function AverageCharHeight: Integer;
     {* средняя высота символов контекста в дюймах. }
   function LP2DP(const P: Tl3_Point;
    NeedZoom: Boolean = false): Tl3SPoint;
     {* преобразует точку в дюймах в точку в пикселях. }
   function LR2DR(const R: Tl3Rect): Tl3SRect;
     {* преобразует прямоугольник в дюймах в прямоугольник в пикселях. }
   function DR2LR(const R: Tl3SRect): Tl3Rect;
     {* преобразует прямоугольник в пикселях в прямоугольник в дюймах. }
   procedure Lock;
     {* начать работу с канвой. }
   procedure Unlock;
     {* закончить работу с канвой. }
   function GetKerning(const aSt: Tl3WString;
    Kerning: PLong): Tl3Point;
     {* получить размеры строки и таблицу кернинга. }
   function OffsetRgn(const Rgn: Il3Region;
    const Pt: Tl3Point): Integer;
     {* сдвинуть регион. }
   function CaretExtent: Tl3Point;
     {* размеры курсора. }
   procedure StartTabs(out theTabInfo: Il3TabInfo;
    const aTabStops: Il3TabStops;
    aTabOffset: Integer = 0); overload; 
   procedure StartTabs(out theTabInfo: Il3TabInfo;
    const aTabInfo: Il3TabInfo); overload; 
   procedure FinishTabs(var aTabInfo: Il3TabInfo);
   function TabInfo: Il3TabInfo;
   function EQ(const aCanvas: Il3InfoCanvas): Boolean;
   function NearestColor(C: Tl3Color): Tl3Color;
   function DrawText(const aSt: Tl3WString;
    var R: TRect;
    aFormat: Cardinal;
    AFl: TObject = nil): Il3MultiLines;
     {* как ни глупо звучит, но это нужно на информационной канве, т.к. она вычисляет прямоугольник вывода. }
   procedure TabbedMultilineTextOut(const aSt: Tl3WString;
    const Tabs: Il3TabStops;
    var Rect: Tl3Rect;
    Precalculate: Boolean;
    aGap: Integer);
     {* как ни глупо звучит, но это нужно на информационной канве, т.к. она вычисляет прямоугольник вывода. }
   procedure PushBC;
   function TopBC: Tl3Color;
   procedure PopBC;
   procedure PushFC;
   procedure PopFC;
   function TextMetrics: PTextMetric;
   procedure MoveWindowOrg(const Delta: Tl3Point); overload; 
   procedure MoveWindowOrg(const Delta: Tl3SPoint); overload; 
   procedure FillForeRect(const R: Tl3SRect);
   procedure FillRect(const R: Tl3SRect); overload; 
   procedure FillRect(const R: Tl3Rect); overload; 
   procedure FillEmptyRect(const R: Tl3Rect); overload; 
   procedure FillEmptyRect(const R: Tl3SRect); overload; 
   function FillRgn(const Region: Il3Region): Boolean;
   function TextOut(const P: Tl3Point;
    const S: Tl3PCharLen;
    FC: Tl3Color = clDefault;
    BC: Tl3Color = clDefault): Tl3Point;
   procedure SetCaret(const Origin: Tl3Point;
    const Extent: Tl3Point;
    Hidden: Boolean = false);
   procedure IncCaret(aDeltaX: Integer);
   procedure BeginPaint;
   procedure StartObject(anObjectID: Integer);
   procedure SetPageTop;
   procedure EndPaint;
   procedure BeginInvert;
   procedure EndInvert;
   function DrawRgnOrBlock: Boolean;
   function HasToDraw: Boolean;
   procedure StretchDraw(const R: Tl3Rect;
    Graphic: VCLGraphic);
   procedure DrawSub(aSubTarget: TObject;
    const R: Tl3Rect;
    LayerHandle: Integer;
    aSub: TObject);
   procedure ExtTextOut(const P: Tl3Point;
    const R: Tl3Rect;
    const S: Tl3WString;
    F: Tl3TextFormatFlag = l3_tffLeft;
    Dx: PInteger = nil); overload; 
   procedure ExtTextOut(const P: Tl3SPoint;
    const R: Tl3SRect;
    const S: Tl3WString;
    F: Tl3TextFormatFlag = l3_tffLeft;
    Dx: PInteger = nil); overload; 
   function CaretLineOut(const aSt: Tl3WString;
    LineHeight: Integer;
    aHidden: Boolean;
    var CaretPos: Integer): Tl3Point;
     {* выводит строку текста высотой LineHeight, со сдвигом курсора отрисовки. устанавливает курсор в CaretPos. возвращает размеры выведенной строки. }
   function StringOut(const P: Tl3Point;
    const Text: Tl3WString): Tl3Point;
   procedure TabbedTextOut(const P: Tl3Point;
    const R: Tl3Rect;
    const S: Tl3WString;
    const aTabStops: Il3TabStops); overload; 
   procedure TabbedTextOut(const P: Tl3SPoint;
    const R: Tl3SRect;
    const S: Tl3WString;
    const aTabStops: Il3TabStops); overload; 
   function NewPage(ByWidth: Boolean = false): Boolean;
     {* начать новую страницу. }
   procedure Line(const A: Tl3Point;
    const B: Tl3Point); overload; 
     {* нарисовать линию. }
   procedure Line(const A: Tl3SPoint;
    const B: Tl3SPoint); overload; 
     {* нарисовать линию. }
   procedure MoveTo(const Pt: Tl3Point); overload; 
   procedure LineTo(const Pt: Tl3Point); overload; 
   procedure MoveTo(const Pt: Tl3SPoint); overload; 
   procedure LineTo(const Pt: Tl3SPoint); overload; 
   function WO(const aRect: Tl3Rect): Tl3SRect; overload; 
   function WO(const aPt: Tl3Point): Tl3SPoint; overload; 
   function WO(const aPt: Tl3SPoint): Tl3SPoint; overload; 
   procedure DrawFocusRect(const aRect: Tl3SRect);
   function IsVirtual: Boolean;
   procedure StartRegion;
   procedure FinishRegion;
   procedure PushWO;
   procedure PopWO;
   function GetClientRect: Tl3Rect;
   function AdjustMarginsByPrintableArea(const aMargins: Tl3_Rect): Tl3_Rect;
     {* Откорректировать поля с учетом непечатаемой области }
   function CheckConvertString(const aStr: Tl3PCharLen): Tl3PCharLen;
     {* преобразует строку для отображения форматирующей информации в режиме DrawSpecial. }
   function CheckOutString(const aStr: Tl3PCharLen): Tl3PCharLen;
   function DP2LP(const aP: Tl3_SPoint): Tl3Point;
     {* Преобразует точку в пикселях в точку в дюймах }
   function DeviceCaps(anIndex: Integer): Integer;
     {* возвращает свойства устройства рисования. }
   function PushClipRect: Tl3Rect;
   procedure PopClipRect;
   procedure PushLineSpacing;
   procedure PopLineSpacing;
   procedure StartDrawAAC(aType: TspBlockType);
   procedure EndDrawAAC(const R: Tl3Rect);
   procedure BeginDarkColor;
   procedure EndDarkColor;
 public
   property Font: Il3Font
     read Get_Font
     write Set_Font;
     {* текущий шрифт. }
   property DC: hDC
     read pm_GetDC
     write pm_SetDC;
     {* Handle контекста. }
   property PixelsPerInchX: Integer
     read pm_GetPixelsPerInchX;
   property PixelsPerInchY: Integer
     read pm_GetPixelsPerInchY;
   property WindowOrg: Tl3Point
     read pm_GetWindowOrg
     write pm_SetWindowOrg;
     {* смещение начала координат в дюймах. }
   property SWindowOrg: Tl3SPoint
     read pm_GetSWindowOrg
     write pm_SetSWindowOrg;
     {* смещение начала координат в пикселях. }
   property ClipRect: Tl3Rect
     read pm_GetClipRect
     write pm_SetClipRect;
     {* прямоугольник отсечения. }
   property GlobalClipRect: Tl3Rect
     read pm_GetGlobalClipRect;
   property BackColor: Tl3Color
     read pm_GetBackColor
     write pm_SetBackColor;
   property DrawEnabled: Boolean
     read pm_GetDrawEnabled
     write pm_SetDrawEnabled;
     {* разрешено рисование? }
   property DrawSpecial: Boolean
     read pm_GetDrawSpecial;
     {* рисовать спецсимволы? }
   property CanDrawSubs: Boolean
     read pm_GetCanDrawSubs;
     {* можем рисовать Sub'ы? }
   property ShowCursor: Boolean
     read pm_GetShowCursor
     write pm_SetShowCursor;
     {* отображать курсор? }
   property FontIndexSet: Tl3FontIndexes
     read pm_GetFontIndexSet
     write pm_SetFontIndexSet;
     {* текущий набор индексов шрифта. }
   property Printed: Boolean
     read pm_GetPrinted
     write pm_SetPrinted;
     {* все напечатано? }
   property PageNumber: Integer
     read pm_GetPageNumber;
     {* номер страницы в высоту. }
   property PageWidthNumber: Integer
     read pm_GetPageWidthNumber;
     {* номер страницы в ширину. }
   property PenWidth: Integer
     read pm_GetPenWidth;
     {* ширина пера. }
   property PageOrientation: Tl3PageOrientation
     read pm_GetPageOrientation
     write pm_SetPageOrientation;
     {* ориентация страницы. }
   property SectionExtent: Tl3Point
     read pm_GetSectionExtent
     write pm_SetSectionExtent;
     {* размеры текущего раздела с дюймах. }
   property NotFocused: Boolean
     write pm_SetNotFocused;
   property RegionBottomRight: Tl3Point
     read pm_GetRegionBottomRight;
   property PasswordChar: AnsiChar
     read Get_PasswordChar
     write Set_PasswordChar;
   property EffectiveColors: Il3EffectiveColors
     read Get_EffectiveColors;
   property Printing: Boolean
     read pm_GetPrinting;
     {* печать? }
   property Zoom: Integer
     read pm_GetZoom
     write pm_SetZoom;
     {* масштаб. }
   property PageSetup: Il3PageSetup
     read pm_GetPageSetup;
   property Painter: Il3HAFPainter
     write pm_SetPainter;
   property Canvas: TCanvas
     read pm_GetCanvas;
   property IsPagesCounter: Boolean
     read Get_IsPagesCounter;
   property OverallPageNumber: Integer
     read Get_OverallPageNumber;
   property InitialDCOffset: Tl3Point
     read Get_InitialDCOffset;
   property ClipRegion: Il3Region
     write Set_ClipRegion;
   property LineSpacing: Integer
     read Get_LineSpacing
     write Set_LineSpacing;
     {* Интерлиньяж в процентах от размера строки }
   property Invert: Boolean
     read pm_GetInvert;
   property InitialDCOffsetStored: Tl3Point
     read Get_InitialDCOffsetStored;
   property FrameLines: Il3FrameLines
     read pm_GetFrameLines;
   property AbortChecker: Il3AbortChecker
     read Get_AbortChecker
     write Set_AbortChecker;
 {$IfNDef XE4}
 private
   procedure Fake; virtual; // - это нужно чтобы правильно генерировались вызовы методов доступа к свойствам
 {$EndIf XE4}
 public
   constructor Init(const anIntf: Il3Canvas);
 public
   function IsValid: Boolean;
   procedure Free;
   property As_Il3Canvas: Il3Canvas read f_Il3Canvas;
 end;//Hl3Canvas

 Il3DragImageSource = interface(Il3Base)
  {* Источник картинки, представляющей данные. }
   ['{9EFC3540-323C-4C4B-9DBA-DC76C14DF440}']
   function Image: Il3Bitmap;
 end;//Il3DragImageSource

const
   { Orientations }
  l3PageOrientationInvert : Tl3PageOrientationArray = (l3_poLandscape, l3_poPortrait);
   { Константа для инверсии ориентации страницы. }

type
 Il3CanvasConstants = interface(Il3Canvas)
  {* Хак для упорядочивания элементов при генерации }
   ['{8BAB9888-3F5B-4563-A848-997627BF6757}']
 end;//Il3CanvasConstants

 Il3CommandProcessor = interface(Il3Base)
  {* Процессор команд. }
   ['{E5E0F6F4-2947-40E5-9911-9F6266EB3906}']
   function TranslateUsing(const Tables: array of AnsiString;
    var Msg: TMessage;
    aTime: Cardinal;
    const aTarget: Il3CommandTarget = nil): Word;
     {* translate a message into a command using the given tables. }
   procedure SubscribeGlobalKeyDataListener(const aListener: Il3KeyDataListener);
   procedure UnsubscribeGlobalKeyDataListener(const aListener: Il3KeyDataListener);
 end;//Il3CommandProcessor

 TevDrawSubEvent = procedure (aSubTarget: TObject;
  const Canvas: Il3Canvas;
  const R: Tl3Rect;
  SubType: Tl3Handle;
  aSub: TObject) of object;

implementation

// start class Hl3Canvas

function Hl3Canvas.PxAverageCharWidth: Integer;
begin
 Result := f_Il3Canvas.pxAverageCharWidth;
end;

function Hl3Canvas.AverageCharWidth: Integer;
begin
 Result := f_Il3Canvas.AverageCharWidth;
end;

function Hl3Canvas.TextExtent(const S: Tl3WString;
  aNoTabs: Boolean = false): Tl3Point;
begin
 Result := f_Il3Canvas.TextExtent(S, aNoTabs);
end;

function Hl3Canvas.Pos2Index(W: Integer;
  const S: Tl3PCharLen): Integer;
begin
 Result := f_Il3Canvas.Pos2Index(W, S);
end;

function Hl3Canvas.Pos2IndexQ(W: Integer;
  const S: Tl3PCharLen;
  var aNoTabs: Boolean): Integer;
begin
 Result := f_Il3Canvas.Pos2IndexQ(W, S, aNoTabs);
end;

function Hl3Canvas.AverageCharHeight: Integer;
begin
 Result := f_Il3Canvas.AverageCharHeight;
end;

function Hl3Canvas.LP2DP(const P: Tl3_Point;
  NeedZoom: Boolean = false): Tl3SPoint;
begin
 Result := f_Il3Canvas.LP2DP(P, NeedZoom);
end;

function Hl3Canvas.LR2DR(const R: Tl3Rect): Tl3SRect;
begin
 Result := f_Il3Canvas.LR2DR(R);
end;

function Hl3Canvas.DR2LR(const R: Tl3SRect): Tl3Rect;
begin
 Result := f_Il3Canvas.DR2LR(R);
end;

procedure Hl3Canvas.Lock;
begin
 f_Il3Canvas.Lock;
end;

procedure Hl3Canvas.Unlock;
begin
 f_Il3Canvas.Unlock;
end;

function Hl3Canvas.GetKerning(const aSt: Tl3WString;
  Kerning: PLong): Tl3Point;
begin
 Result := f_Il3Canvas.GetKerning(aSt, Kerning);
end;

function Hl3Canvas.OffsetRgn(const Rgn: Il3Region;
  const Pt: Tl3Point): Integer;
begin
 Result := f_Il3Canvas.OffsetRgn(Rgn, Pt);
end;

function Hl3Canvas.CaretExtent: Tl3Point;
begin
 Result := f_Il3Canvas.CaretExtent;
end;

procedure Hl3Canvas.StartTabs(out theTabInfo: Il3TabInfo;
  const aTabStops: Il3TabStops;
  aTabOffset: Integer = 0);
begin
 f_Il3Canvas.StartTabs(theTabInfo, aTabStops, aTabOffset);
end;

procedure Hl3Canvas.StartTabs(out theTabInfo: Il3TabInfo;
  const aTabInfo: Il3TabInfo);
begin
 f_Il3Canvas.StartTabs(theTabInfo, aTabInfo);
end;

procedure Hl3Canvas.FinishTabs(var aTabInfo: Il3TabInfo);
begin
 f_Il3Canvas.FinishTabs(aTabInfo);
end;

function Hl3Canvas.TabInfo: Il3TabInfo;
begin
 Result := f_Il3Canvas.TabInfo;
end;

function Hl3Canvas.EQ(const aCanvas: Il3InfoCanvas): Boolean;
begin
 Result := f_Il3Canvas.EQ(aCanvas);
end;

function Hl3Canvas.NearestColor(C: Tl3Color): Tl3Color;
begin
 Result := f_Il3Canvas.NearestColor(C);
end;

function Hl3Canvas.DrawText(const aSt: Tl3WString;
  var R: TRect;
  aFormat: Cardinal;
  AFl: TObject = nil): Il3MultiLines;
begin
 Result := f_Il3Canvas.DrawText(aSt, R, aFormat, AFl);
end;

procedure Hl3Canvas.TabbedMultilineTextOut(const aSt: Tl3WString;
  const Tabs: Il3TabStops;
  var Rect: Tl3Rect;
  Precalculate: Boolean;
  aGap: Integer);
begin
 f_Il3Canvas.TabbedMultilineTextOut(aSt, Tabs, Rect, Precalculate, aGap);
end;

procedure Hl3Canvas.PushBC;
begin
 f_Il3Canvas.PushBC;
end;

function Hl3Canvas.TopBC: Tl3Color;
begin
 Result := f_Il3Canvas.TopBC;
end;

procedure Hl3Canvas.PopBC;
begin
 f_Il3Canvas.PopBC;
end;

procedure Hl3Canvas.PushFC;
begin
 f_Il3Canvas.PushFC;
end;

procedure Hl3Canvas.PopFC;
begin
 f_Il3Canvas.PopFC;
end;

function Hl3Canvas.TextMetrics: PTextMetric;
begin
 Result := f_Il3Canvas.TextMetrics;
end;

function Hl3Canvas.Get_Font: Il3Font;
begin
 Result := f_Il3Canvas.Font;
end;

procedure Hl3Canvas.Set_Font(const aValue: Il3Font);
begin
 f_Il3Canvas.Font := aValue;
end;

function Hl3Canvas.pm_GetDC: hDC;
begin
 Result := f_Il3Canvas.DC;
end;

procedure Hl3Canvas.pm_SetDC(aValue: hDC);
begin
 f_Il3Canvas.DC := aValue;
end;

function Hl3Canvas.pm_GetPixelsPerInchX: Integer;
begin
 Result := f_Il3Canvas.PixelsPerInchX;
end;

function Hl3Canvas.pm_GetPixelsPerInchY: Integer;
begin
 Result := f_Il3Canvas.PixelsPerInchY;
end;

procedure Hl3Canvas.MoveWindowOrg(const Delta: Tl3Point);
begin
 f_Il3Canvas.MoveWindowOrg(Delta);
end;

procedure Hl3Canvas.MoveWindowOrg(const Delta: Tl3SPoint);
begin
 f_Il3Canvas.MoveWindowOrg(Delta);
end;

procedure Hl3Canvas.FillForeRect(const R: Tl3SRect);
begin
 f_Il3Canvas.FillForeRect(R);
end;

procedure Hl3Canvas.FillRect(const R: Tl3SRect);
begin
 f_Il3Canvas.FillRect(R);
end;

procedure Hl3Canvas.FillRect(const R: Tl3Rect);
begin
 f_Il3Canvas.FillRect(R);
end;

procedure Hl3Canvas.FillEmptyRect(const R: Tl3Rect);
begin
 f_Il3Canvas.FillEmptyRect(R);
end;

procedure Hl3Canvas.FillEmptyRect(const R: Tl3SRect);
begin
 f_Il3Canvas.FillEmptyRect(R);
end;

function Hl3Canvas.FillRgn(const Region: Il3Region): Boolean;
begin
 Result := f_Il3Canvas.FillRgn(Region);
end;

function Hl3Canvas.TextOut(const P: Tl3Point;
  const S: Tl3PCharLen;
  FC: Tl3Color = clDefault;
  BC: Tl3Color = clDefault): Tl3Point;
begin
 Result := f_Il3Canvas.TextOut(P, S, FC, BC);
end;

procedure Hl3Canvas.SetCaret(const Origin: Tl3Point;
  const Extent: Tl3Point;
  Hidden: Boolean = false);
begin
 f_Il3Canvas.SetCaret(Origin, Extent, Hidden);
end;

procedure Hl3Canvas.IncCaret(aDeltaX: Integer);
begin
 f_Il3Canvas.IncCaret(aDeltaX);
end;

procedure Hl3Canvas.BeginPaint;
begin
 f_Il3Canvas.BeginPaint;
end;

procedure Hl3Canvas.StartObject(anObjectID: Integer);
begin
 f_Il3Canvas.StartObject(anObjectID);
end;

procedure Hl3Canvas.SetPageTop;
begin
 f_Il3Canvas.SetPageTop;
end;

procedure Hl3Canvas.EndPaint;
begin
 f_Il3Canvas.EndPaint;
end;

procedure Hl3Canvas.BeginInvert;
begin
 f_Il3Canvas.BeginInvert;
end;

procedure Hl3Canvas.EndInvert;
begin
 f_Il3Canvas.EndInvert;
end;

function Hl3Canvas.DrawRgnOrBlock: Boolean;
begin
 Result := f_Il3Canvas.DrawRgnOrBlock;
end;

function Hl3Canvas.HasToDraw: Boolean;
begin
 Result := f_Il3Canvas.HasToDraw;
end;

procedure Hl3Canvas.StretchDraw(const R: Tl3Rect;
  Graphic: VCLGraphic);
begin
 f_Il3Canvas.StretchDraw(R, Graphic);
end;

procedure Hl3Canvas.DrawSub(aSubTarget: TObject;
  const R: Tl3Rect;
  LayerHandle: Integer;
  aSub: TObject);
begin
 f_Il3Canvas.DrawSub(aSubTarget, R, LayerHandle, aSub);
end;

procedure Hl3Canvas.ExtTextOut(const P: Tl3Point;
  const R: Tl3Rect;
  const S: Tl3WString;
  F: Tl3TextFormatFlag = l3_tffLeft;
  Dx: PInteger = nil);
begin
 f_Il3Canvas.ExtTextOut(P, R, S, F, Dx);
end;

procedure Hl3Canvas.ExtTextOut(const P: Tl3SPoint;
  const R: Tl3SRect;
  const S: Tl3WString;
  F: Tl3TextFormatFlag = l3_tffLeft;
  Dx: PInteger = nil);
begin
 f_Il3Canvas.ExtTextOut(P, R, S, F, Dx);
end;

function Hl3Canvas.CaretLineOut(const aSt: Tl3WString;
  LineHeight: Integer;
  aHidden: Boolean;
  var CaretPos: Integer): Tl3Point;
begin
 Result := f_Il3Canvas.CaretLineOut(aSt, LineHeight, aHidden, CaretPos);
end;

function Hl3Canvas.StringOut(const P: Tl3Point;
  const Text: Tl3WString): Tl3Point;
begin
 Result := f_Il3Canvas.StringOut(P, Text);
end;

procedure Hl3Canvas.TabbedTextOut(const P: Tl3Point;
  const R: Tl3Rect;
  const S: Tl3WString;
  const aTabStops: Il3TabStops);
begin
 f_Il3Canvas.TabbedTextOut(P, R, S, aTabStops);
end;

procedure Hl3Canvas.TabbedTextOut(const P: Tl3SPoint;
  const R: Tl3SRect;
  const S: Tl3WString;
  const aTabStops: Il3TabStops);
begin
 f_Il3Canvas.TabbedTextOut(P, R, S, aTabStops);
end;

function Hl3Canvas.NewPage(ByWidth: Boolean = false): Boolean;
begin
 Result := f_Il3Canvas.NewPage(ByWidth);
end;

procedure Hl3Canvas.Line(const A: Tl3Point;
  const B: Tl3Point);
begin
 f_Il3Canvas.Line(A, B);
end;

procedure Hl3Canvas.Line(const A: Tl3SPoint;
  const B: Tl3SPoint);
begin
 f_Il3Canvas.Line(A, B);
end;

procedure Hl3Canvas.MoveTo(const Pt: Tl3Point);
begin
 f_Il3Canvas.MoveTo(Pt);
end;

procedure Hl3Canvas.LineTo(const Pt: Tl3Point);
begin
 f_Il3Canvas.LineTo(Pt);
end;

procedure Hl3Canvas.MoveTo(const Pt: Tl3SPoint);
begin
 f_Il3Canvas.MoveTo(Pt);
end;

procedure Hl3Canvas.LineTo(const Pt: Tl3SPoint);
begin
 f_Il3Canvas.LineTo(Pt);
end;

function Hl3Canvas.WO(const aRect: Tl3Rect): Tl3SRect;
begin
 Result := f_Il3Canvas.WO(aRect);
end;

function Hl3Canvas.WO(const aPt: Tl3Point): Tl3SPoint;
begin
 Result := f_Il3Canvas.WO(aPt);
end;

function Hl3Canvas.WO(const aPt: Tl3SPoint): Tl3SPoint;
begin
 Result := f_Il3Canvas.WO(aPt);
end;

procedure Hl3Canvas.DrawFocusRect(const aRect: Tl3SRect);
begin
 f_Il3Canvas.DrawFocusRect(aRect);
end;

function Hl3Canvas.IsVirtual: Boolean;
begin
 Result := f_Il3Canvas.IsVirtual;
end;

procedure Hl3Canvas.StartRegion;
begin
 f_Il3Canvas.StartRegion;
end;

procedure Hl3Canvas.FinishRegion;
begin
 f_Il3Canvas.FinishRegion;
end;

procedure Hl3Canvas.PushWO;
begin
 f_Il3Canvas.PushWO;
end;

procedure Hl3Canvas.PopWO;
begin
 f_Il3Canvas.PopWO;
end;

function Hl3Canvas.pm_GetWindowOrg: Tl3Point;
begin
 Result := f_Il3Canvas.WindowOrg;
end;

procedure Hl3Canvas.pm_SetWindowOrg(const aValue: Tl3Point);
begin
 f_Il3Canvas.WindowOrg := aValue;
end;

function Hl3Canvas.pm_GetSWindowOrg: Tl3SPoint;
begin
 Result := f_Il3Canvas.SWindowOrg;
end;

procedure Hl3Canvas.pm_SetSWindowOrg(const aValue: Tl3SPoint);
begin
 f_Il3Canvas.SWindowOrg := aValue;
end;

function Hl3Canvas.pm_GetClipRect: Tl3Rect;
begin
 Result := f_Il3Canvas.ClipRect;
end;

procedure Hl3Canvas.pm_SetClipRect(const aValue: Tl3Rect);
begin
 f_Il3Canvas.ClipRect := aValue;
end;

function Hl3Canvas.pm_GetGlobalClipRect: Tl3Rect;
begin
 Result := f_Il3Canvas.GlobalClipRect;
end;

function Hl3Canvas.pm_GetBackColor: Tl3Color;
begin
 Result := f_Il3Canvas.BackColor;
end;

procedure Hl3Canvas.pm_SetBackColor(aValue: Tl3Color);
begin
 f_Il3Canvas.BackColor := aValue;
end;

function Hl3Canvas.pm_GetDrawEnabled: Boolean;
begin
 Result := f_Il3Canvas.DrawEnabled;
end;

procedure Hl3Canvas.pm_SetDrawEnabled(aValue: Boolean);
begin
 f_Il3Canvas.DrawEnabled := aValue;
end;

function Hl3Canvas.pm_GetDrawSpecial: Boolean;
begin
 Result := f_Il3Canvas.DrawSpecial;
end;

function Hl3Canvas.pm_GetCanDrawSubs: Boolean;
begin
 Result := f_Il3Canvas.CanDrawSubs;
end;

function Hl3Canvas.pm_GetShowCursor: Boolean;
begin
 Result := f_Il3Canvas.ShowCursor;
end;

procedure Hl3Canvas.pm_SetShowCursor(aValue: Boolean);
begin
 f_Il3Canvas.ShowCursor := aValue;
end;

function Hl3Canvas.pm_GetFontIndexSet: Tl3FontIndexes;
begin
 Result := f_Il3Canvas.FontIndexSet;
end;

procedure Hl3Canvas.pm_SetFontIndexSet(aValue: Tl3FontIndexes);
begin
 f_Il3Canvas.FontIndexSet := aValue;
end;

function Hl3Canvas.pm_GetPrinted: Boolean;
begin
 Result := f_Il3Canvas.Printed;
end;

procedure Hl3Canvas.pm_SetPrinted(aValue: Boolean);
begin
 f_Il3Canvas.Printed := aValue;
end;

function Hl3Canvas.pm_GetPageNumber: Integer;
begin
 Result := f_Il3Canvas.PageNumber;
end;

function Hl3Canvas.pm_GetPageWidthNumber: Integer;
begin
 Result := f_Il3Canvas.PageWidthNumber;
end;

function Hl3Canvas.pm_GetPenWidth: Integer;
begin
 Result := f_Il3Canvas.PenWidth;
end;

function Hl3Canvas.pm_GetPageOrientation: Tl3PageOrientation;
begin
 Result := f_Il3Canvas.PageOrientation;
end;

procedure Hl3Canvas.pm_SetPageOrientation(aValue: Tl3PageOrientation);
begin
 f_Il3Canvas.PageOrientation := aValue;
end;

function Hl3Canvas.pm_GetSectionExtent: Tl3Point;
begin
 Result := f_Il3Canvas.SectionExtent;
end;

procedure Hl3Canvas.pm_SetSectionExtent(const aValue: Tl3Point);
begin
 f_Il3Canvas.SectionExtent := aValue;
end;

procedure Hl3Canvas.pm_SetNotFocused(aValue: Boolean);
begin
 f_Il3Canvas.NotFocused := aValue;
end;

function Hl3Canvas.pm_GetRegionBottomRight: Tl3Point;
begin
 Result := f_Il3Canvas.RegionBottomRight;
end;

function Hl3Canvas.GetClientRect: Tl3Rect;
begin
 Result := f_Il3Canvas.GetClientRect;
end;

function Hl3Canvas.AdjustMarginsByPrintableArea(const aMargins: Tl3_Rect): Tl3_Rect;
begin
 Result := f_Il3Canvas.AdjustMarginsByPrintableArea(aMargins);
end;

function Hl3Canvas.Get_PasswordChar: AnsiChar;
begin
 Result := f_Il3Canvas.PasswordChar;
end;

procedure Hl3Canvas.Set_PasswordChar(aValue: AnsiChar);
begin
 f_Il3Canvas.PasswordChar := aValue;
end;

function Hl3Canvas.Get_EffectiveColors: Il3EffectiveColors;
begin
 Result := f_Il3Canvas.EffectiveColors;
end;

function Hl3Canvas.pm_GetPrinting: Boolean;
begin
 Result := f_Il3Canvas.Printing;
end;

function Hl3Canvas.CheckConvertString(const aStr: Tl3PCharLen): Tl3PCharLen;
begin
 Result := f_Il3Canvas.CheckConvertString(aStr);
end;

function Hl3Canvas.CheckOutString(const aStr: Tl3PCharLen): Tl3PCharLen;
begin
 Result := f_Il3Canvas.CheckOutString(aStr);
end;

function Hl3Canvas.pm_GetZoom: Integer;
begin
 Result := f_Il3Canvas.Zoom;
end;

procedure Hl3Canvas.pm_SetZoom(aValue: Integer);
begin
 f_Il3Canvas.Zoom := aValue;
end;

function Hl3Canvas.pm_GetPageSetup: Il3PageSetup;
begin
 Result := f_Il3Canvas.PageSetup;
end;

procedure Hl3Canvas.pm_SetPainter(const aValue: Il3HAFPainter);
begin
 f_Il3Canvas.Painter := aValue;
end;

function Hl3Canvas.pm_GetCanvas: TCanvas;
begin
 Result := f_Il3Canvas.Canvas;
end;

function Hl3Canvas.DP2LP(const aP: Tl3_SPoint): Tl3Point;
begin
 Result := f_Il3Canvas.DP2LP(aP);
end;

function Hl3Canvas.DeviceCaps(anIndex: Integer): Integer;
begin
 Result := f_Il3Canvas.DeviceCaps(anIndex);
end;

function Hl3Canvas.Get_IsPagesCounter: Boolean;
begin
 Result := f_Il3Canvas.IsPagesCounter;
end;

function Hl3Canvas.Get_OverallPageNumber: Integer;
begin
 Result := f_Il3Canvas.OverallPageNumber;
end;

function Hl3Canvas.Get_InitialDCOffset: Tl3Point;
begin
 Result := f_Il3Canvas.InitialDCOffset;
end;

function Hl3Canvas.PushClipRect: Tl3Rect;
begin
 Result := f_Il3Canvas.PushClipRect;
end;

procedure Hl3Canvas.PopClipRect;
begin
 f_Il3Canvas.PopClipRect;
end;

procedure Hl3Canvas.Set_ClipRegion(const aValue: Il3Region);
begin
 f_Il3Canvas.ClipRegion := aValue;
end;

function Hl3Canvas.Get_LineSpacing: Integer;
begin
 Result := f_Il3Canvas.LineSpacing;
end;

procedure Hl3Canvas.Set_LineSpacing(aValue: Integer);
begin
 f_Il3Canvas.LineSpacing := aValue;
end;

procedure Hl3Canvas.PushLineSpacing;
begin
 f_Il3Canvas.PushLineSpacing;
end;

procedure Hl3Canvas.PopLineSpacing;
begin
 f_Il3Canvas.PopLineSpacing;
end;

function Hl3Canvas.pm_GetInvert: Boolean;
begin
 Result := f_Il3Canvas.Invert;
end;

function Hl3Canvas.Get_InitialDCOffsetStored: Tl3Point;
begin
 Result := f_Il3Canvas.InitialDCOffsetStored;
end;

function Hl3Canvas.pm_GetFrameLines: Il3FrameLines;
begin
 Result := f_Il3Canvas.FrameLines;
end;

function Hl3Canvas.Get_AbortChecker: Il3AbortChecker;
begin
 Result := f_Il3Canvas.AbortChecker;
end;

procedure Hl3Canvas.Set_AbortChecker(const aValue: Il3AbortChecker);
begin
 f_Il3Canvas.AbortChecker := aValue;
end;

procedure Hl3Canvas.StartDrawAAC(aType: TspBlockType);
begin
 f_Il3Canvas.StartDrawAAC(aType);
end;

procedure Hl3Canvas.EndDrawAAC(const R: Tl3Rect);
begin
 f_Il3Canvas.EndDrawAAC(R);
end;

procedure Hl3Canvas.BeginDarkColor;
begin
 f_Il3Canvas.BeginDarkColor;
end;

procedure Hl3Canvas.EndDarkColor;
begin
 f_Il3Canvas.EndDarkColor;
end;

{$IfNDef XE4}
procedure Hl3Canvas.Fake;
begin
 Assert(false);
end;
{$EndIf XE4}

constructor Hl3Canvas.Init(const anIntf: Il3Canvas);
begin
 f_Il3Canvas := anIntf;
end;

function Hl3Canvas.IsValid: Boolean;
begin
 Result := (f_Il3Canvas <> nil);
end;

procedure Hl3Canvas.Free;
begin
 f_Il3Canvas := nil;
 inherited;
end;

end.