unit l3PrinterInterfaces;
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3Core,
  Graphics
  ;

type
 TCanvas = Graphics.TCanvas;
  {* Канва для вывода. }

 Il3Printer = interface(IUnknown)
  {* Принтер. }
   ['{D81ECD1A-CE19-4262-BE7C-58A1401F2C7E}']
   procedure Refresh;
     {* Обновляет список принтеров }
   function Get_PrinterIndex: Integer;
   procedure Set_PrinterIndex(aValue: Integer);
   function Get_Title: Il3CString;
   procedure Set_Title(const aValue: Il3CString);
   function Get_FileName: AnsiString;
   procedure Set_FileName(const aValue: AnsiString);
   function Get_Printing: Boolean;
   function Get_PageHeight: Integer;
   function Get_PageWidth: Integer;
   function Get_Copies: Integer;
   procedure Set_Copies(aValue: Integer);
   function Get_Collate: Boolean;
   procedure Set_Collate(aValue: Boolean);
   function Get_CanCollate: Boolean;
   function Get_DC: hDC;
   function Get_Canvas: TCanvas;
   function Get_Printers: TStrings;
   function Get_Orientation: Tl3PageOrientation;
   procedure Set_Orientation(aValue: Tl3PageOrientation);
   function Get_PaperExtent: Tl3_Point;
   function HasPrinter: Boolean;
     {* есть ли принтер для печати. }
   procedure GetPrinter(ADevice: PChar;
    ADriver: PChar;
    APort: PChar;
    var ADeviceMode: THandle);
     {* получить параметры принтера. }
   procedure SetPrinter(ADevice: PChar;
    ADriver: PChar;
    APort: PChar;
    ADeviceMode: THandle);
     {* установить параметры принтера. }
   procedure BeginDoc;
     {* начать печать документа. }
   procedure EndDoc;
     {* закончить печать документа. }
   procedure NewPage;
     {* начать новую страницу. }
   function Clone: Il3Printer;
     {* Клонирует принтер }
   property PrinterIndex: Integer
     read Get_PrinterIndex
     write Set_PrinterIndex;
     {* индекс текущего принтера. }
   property Title: Il3CString
     read Get_Title
     write Set_Title;
     {* заголовок задания печати. }
   property FileName: AnsiString
     read Get_FileName
     write Set_FileName;
     {* Имя файла - куда печатать. }
   property Printing: Boolean
     read Get_Printing;
     {* находимся в процессе печати? }
   property PageHeight: Integer
     read Get_PageHeight;
     {* высота текущей страницы. }
   property PageWidth: Integer
     read Get_PageWidth;
     {* ширина текущей страницы. }
   property Copies: Integer
     read Get_Copies
     write Set_Copies;
     {* количество печатаемых копий. }
   property Collate: Boolean
     read Get_Collate
     write Set_Collate;
   property CanCollate: Boolean
     read Get_CanCollate;
   property DC: hDC
     read Get_DC;
     {* контекст печати. }
   property Canvas: TCanvas
     read Get_Canvas;
     {* канва для печати. }
   property Printers: TStrings
     read Get_Printers;
     {* список доступных принтеров. }
   property Orientation: Tl3PageOrientation
     read Get_Orientation
     write Set_Orientation;
     {* ориентация текущей страницы. }
   property PaperExtent: Tl3_Point
     read Get_PaperExtent;
     {* Размер бумаги. }
 end;//Il3Printer

implementation

end.