unit l3Printer;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3Units,
  Classes,
  Printers,
  Windows,
  l3PrinterInterfaces,
  l3PureMixIns
  ;

type
 _l3Castable_Parent_ = TPrinter;
 {$Include l3Castable.imp.pas}
 Tl3CastablePrinter = class(_l3Castable_)
  {* Принтер с методом QueryInterface. }
 end;//Tl3CastablePrinter

 _l3Unknown_Parent_ = Tl3CastablePrinter;
 {$Include l3Unknown.imp.pas}
 Tl3Printer = class(_l3Unknown_, Il3Printer)
 private
 // private fields
   f_NoPrinter : Boolean;
 private
 // private methods
   function LP2DP(const P: Tl3_Point): Tl3SPoint;
   function DP2LP(const P: Tl3_SPoint): Tl3Point;
 protected
 // realized methods
   function HasPrinter: Boolean;
     {* есть ли принтер для печати. }
   function Get_PrinterIndex: Integer;
   procedure Set_PrinterIndex(aValue: Integer);
   function Get_Title: Il3CString;
   procedure Set_Title(const aValue: Il3CString);
   function Get_FileName: AnsiString;
   procedure Set_FileName(const aValue: AnsiString);
   function Get_DC: hDC;
   function Get_Canvas: TCanvas;
   function Get_Printers: TStrings;
   function Get_Orientation: Tl3PageOrientation;
   procedure Set_Orientation(aValue: Tl3PageOrientation);
   function Get_Printing: Boolean;
   function Get_PageHeight: Integer;
   function Get_PageWidth: Integer;
   function Get_Copies: Integer;
   procedure Set_Copies(aValue: Integer);
   function Get_PaperExtent: Tl3_Point;
   function Clone: Il3Printer;
     {* Клонирует принтер }
   function Get_Collate: Boolean;
   procedure Set_Collate(aValue: Boolean);
   function Get_CanCollate: Boolean;
   procedure Refresh;
     {* Обновляет список принтеров }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   class function Make: Il3Printer; reintroduce;
 end;//Tl3Printer

implementation

uses
  l3Defaults,
  l3Base,
  SysUtils,
  l3String,
  l3PrinterIC,
  l3Const,
  l3Math,
  Consts,
  l3Core,
  l3MemUtils,
  l3Interlocked,
  l3InternalInterfaces
  ;

type
 THackPrinter = class(TObject)
 private
 // private fields
   FCanvas : TCanvas;
   FFonts : TStrings;
   FPageNumber : Integer;
   FPrinters : TStrings;
   FPrinterIndex : Integer;
   FTitle : AnsiString;
   FPrinting : Boolean;
   FAborted : Boolean;
   FCapabilities : TPrinterCapabilities;
   State : TPrinterState;
   DC : hDC;
   DevMode : PDeviceMode;
   DeviceMode : THandle;
 end;//THackPrinter

{$Include l3Castable.imp.pas}

{$Include l3Unknown.imp.pas}

// start class Tl3Printer

class function Tl3Printer.Make: Il3Printer;
var
 l_Inst : Tl3Printer;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function Tl3Printer.LP2DP(const P: Tl3_Point): Tl3SPoint;
//#UC START# *49BAA08901A2_4799D40F0004_var*
//#UC END# *49BAA08901A2_4799D40F0004_var*
begin
//#UC START# *49BAA08901A2_4799D40F0004_impl*
 Result.X := l3MulDiv(P.X, GetDeviceCaps(Handle, LOGPIXELSX), l3Inch);
 Result.Y := l3MulDiv(P.Y, GetDeviceCaps(Handle, LOGPIXELSY), l3Inch);
//#UC END# *49BAA08901A2_4799D40F0004_impl*
end;//Tl3Printer.LP2DP

function Tl3Printer.DP2LP(const P: Tl3_SPoint): Tl3Point;
//#UC START# *49BAA09D01C8_4799D40F0004_var*
//#UC END# *49BAA09D01C8_4799D40F0004_var*
begin
//#UC START# *49BAA09D01C8_4799D40F0004_impl*
 Result.X := l3MulDiv(P.X, l3Inch, GetDeviceCaps(Handle, LOGPIXELSX));
 Result.Y := l3MulDiv(P.Y, l3Inch, GetDeviceCaps(Handle, LOGPIXELSY));
//#UC END# *49BAA09D01C8_4799D40F0004_impl*
end;//Tl3Printer.DP2LP

function Tl3Printer.HasPrinter: Boolean;
//#UC START# *46A465CD021A_4799D40F0004_var*
//#UC END# *46A465CD021A_4799D40F0004_var*
begin
//#UC START# *46A465CD021A_4799D40F0004_impl*
 Result := (Get_PrinterIndex >= 0);
//#UC END# *46A465CD021A_4799D40F0004_impl*
end;//Tl3Printer.HasPrinter

function Tl3Printer.Get_PrinterIndex: Integer;
//#UC START# *46A4692C01C1_4799D40F0004get_var*
 procedure lp_OnError;
 begin
  Result := -1;
  f_NoPrinter := true;
 end;
//#UC END# *46A4692C01C1_4799D40F0004get_var*
begin
//#UC START# *46A4692C01C1_4799D40F0004get_impl*
 if f_NoPrinter or (Printers.Count = 0) then
  Result := -1   //^^^^^^^^^^^^^^^^^^^^ - http://mdp.garant.ru/pages/viewpage.action?pageId=316114187
 else
  try
   Result := PrinterIndex;
  except
   on EPrinter do
    lp_OnError
   else
    raise;
  end;//try..except
//#UC END# *46A4692C01C1_4799D40F0004get_impl*
end;//Tl3Printer.Get_PrinterIndex

procedure Tl3Printer.Set_PrinterIndex(aValue: Integer);
//#UC START# *46A4692C01C1_4799D40F0004set_var*
//#UC END# *46A4692C01C1_4799D40F0004set_var*
begin
//#UC START# *46A4692C01C1_4799D40F0004set_impl*
 PrinterIndex := aValue;
//#UC END# *46A4692C01C1_4799D40F0004set_impl*
end;//Tl3Printer.Set_PrinterIndex

function Tl3Printer.Get_Title: Il3CString;
//#UC START# *46A4696D021E_4799D40F0004get_var*
//#UC END# *46A4696D021E_4799D40F0004get_var*
begin
//#UC START# *46A4696D021E_4799D40F0004get_impl*
 Result := l3CStr(Title);
//#UC END# *46A4696D021E_4799D40F0004get_impl*
end;//Tl3Printer.Get_Title

procedure Tl3Printer.Set_Title(const aValue: Il3CString);
//#UC START# *46A4696D021E_4799D40F0004set_var*
//#UC END# *46A4696D021E_4799D40F0004set_var*
begin
//#UC START# *46A4696D021E_4799D40F0004set_impl*
 Title := l3Str(aValue);
//#UC END# *46A4696D021E_4799D40F0004set_impl*
end;//Tl3Printer.Set_Title

function Tl3Printer.Get_FileName: AnsiString;
//#UC START# *46A469970084_4799D40F0004get_var*
//#UC END# *46A469970084_4799D40F0004get_var*
begin
//#UC START# *46A469970084_4799D40F0004get_impl*
 {$IfDef DesignTimeLibrary}
 Result := '';
 {$Else  DesignTimeLibrary}
 {$IfDef l3HackedVCL}
 Result := Output;
 {$Else  l3HackedVCL}
 Result := '';
 {$EndIf l3HackedVCL}
 {$EndIf DesignTimeLibrary}
//#UC END# *46A469970084_4799D40F0004get_impl*
end;//Tl3Printer.Get_FileName

procedure Tl3Printer.Set_FileName(const aValue: AnsiString);
//#UC START# *46A469970084_4799D40F0004set_var*
//#UC END# *46A469970084_4799D40F0004set_var*
begin
//#UC START# *46A469970084_4799D40F0004set_impl*
 {$IfNDef DesignTimeLibrary}
 {$IfDef l3HackedVCL}
 Output := aValue;
 {$Else  l3HackedVCL}
 if (aValue <> '') then
  assert(false);
 {$EndIf l3HackedVCL}
 {$EndIf  DesignTimeLibrary}
//#UC END# *46A469970084_4799D40F0004set_impl*
end;//Tl3Printer.Set_FileName

function Tl3Printer.Get_DC: hDC;
//#UC START# *46A46A95001B_4799D40F0004get_var*
 procedure lp_OnError;
 begin
  Result := l3PrnIC.DC;
  f_NoPrinter := true;
 end;
//#UC END# *46A46A95001B_4799D40F0004get_var*
begin
//#UC START# *46A46A95001B_4799D40F0004get_impl*
 if f_NoPrinter then
  Result := l3PrnIC.DC
 else
  try
   Result := Handle;
  except
   on EPrinter do
    lp_OnError;
   on EOSError do
    if Printers.Count = 0 then
     lp_OnError
    else
     raise;
  end;//try..except
//#UC END# *46A46A95001B_4799D40F0004get_impl*
end;//Tl3Printer.Get_DC

function Tl3Printer.Get_Canvas: TCanvas;
//#UC START# *46A46ACA00CC_4799D40F0004get_var*
//#UC END# *46A46ACA00CC_4799D40F0004get_var*
begin
//#UC START# *46A46ACA00CC_4799D40F0004get_impl*
 if not HasPrinter then
  // - нету принтеров
  Result := (l3PrnIC As Il3Canvas).Canvas
 else
  Result := Canvas;
//#UC END# *46A46ACA00CC_4799D40F0004get_impl*
end;//Tl3Printer.Get_Canvas

function Tl3Printer.Get_Printers: TStrings;
//#UC START# *46A46AF00379_4799D40F0004get_var*
//#UC END# *46A46AF00379_4799D40F0004get_var*
begin
//#UC START# *46A46AF00379_4799D40F0004get_impl*
 Result := Printers;
//#UC END# *46A46AF00379_4799D40F0004get_impl*
end;//Tl3Printer.Get_Printers

function Tl3Printer.Get_Orientation: Tl3PageOrientation;
//#UC START# *46A46B9E02CF_4799D40F0004get_var*
 procedure lp_OnError;
 begin
  Result := l3_poPortrait;
  f_NoPrinter := true;
 end;
//#UC END# *46A46B9E02CF_4799D40F0004get_var*
begin
//#UC START# *46A46B9E02CF_4799D40F0004get_impl*
 if f_NoPrinter then
  Result := l3_poPortrait
 else
  try
   if (Orientation = poLandscape) then
    Result := l3_poLandscape
   else
    Result := l3_poPortrait;
  except
   on EPrinter do
    lp_OnError;
   on EOSError do
    if Printers.Count = 0 then
     lp_OnError
    else
     raise;
  end;//try..except
//#UC END# *46A46B9E02CF_4799D40F0004get_impl*
end;//Tl3Printer.Get_Orientation

procedure Tl3Printer.Set_Orientation(aValue: Tl3PageOrientation);
//#UC START# *46A46B9E02CF_4799D40F0004set_var*
//#UC END# *46A46B9E02CF_4799D40F0004set_var*
begin
//#UC START# *46A46B9E02CF_4799D40F0004set_impl*
 if (Get_Orientation <> aValue) then
 begin
  if Printing then
  begin
   with THackPrinter(Self) do
   begin
    Windows.EndPage(DC);
    if (aValue = l3_poPortrait) then
     DevMode^.dmOrientation := DMORIENT_PORTRAIT
    else
     DevMode^.dmOrientation := DMORIENT_LANDSCAPE;
    if (Windows.ResetDC(DC, DevMode^) = 0) then
    begin
     // - не получилось изменить параметры устройства
     if not Aborted then
      Windows.EndDoc(DC);
     FPrinting := False;
     FAborted := False;
     FPageNumber := 0;
     try
      if (aValue = l3_poPortrait) then
       Orientation := poPortrait
      else
       Orientation := poLandscape;
     except
      on EPrinter do
       f_NoPrinter := True;
      on EOSError do
       if Printers.Count = 0 then
        f_NoPrinter := True
       else
        raise;
     end;
     BeginDoc;
    end//Windows.ResetDC(DC, DevMode^) = 0
    else
    begin
     Windows.StartPage(DC);
     Canvas.Refresh;
    end;//Windows.ResetDC..
   end;//with THackPrinter(Self)
  end//Printing
  else
  try
   if (aValue = l3_poLandscape) then
    Orientation := poLandscape
   else
    Orientation := poPortrait;
  except
   on EPrinter do
    f_NoPrinter := True;
   on EOSError do
    if Printers.Count = 0 then
     f_NoPrinter := True
    else
     raise;
  end;
 end;//Orientation <> aValue
//#UC END# *46A46B9E02CF_4799D40F0004set_impl*
end;//Tl3Printer.Set_Orientation

function Tl3Printer.Get_Printing: Boolean;
//#UC START# *46A46C000399_4799D40F0004get_var*
//#UC END# *46A46C000399_4799D40F0004get_var*
begin
//#UC START# *46A46C000399_4799D40F0004get_impl*
 Result := Printing;
//#UC END# *46A46C000399_4799D40F0004get_impl*
end;//Tl3Printer.Get_Printing

function Tl3Printer.Get_PageHeight: Integer;
//#UC START# *46A46C1B00DA_4799D40F0004get_var*
 procedure lp_OnError;
 begin
  Result := LP2DP(l3PointY(def_inchPaperHeight)).Y;
  f_NoPrinter := true;
 end;
//#UC END# *46A46C1B00DA_4799D40F0004get_var*
begin
//#UC START# *46A46C1B00DA_4799D40F0004get_impl*
 if f_NoPrinter then
  Result := LP2DP(l3PointY(def_inchPaperHeight)).Y
 else
  try
   Result := PageHeight;
  except
   on EPrinter do
    lp_OnError;
   on EOSError do
    if Printers.Count = 0 then
     lp_OnError
    else
     raise;
  end;//try..except
//#UC END# *46A46C1B00DA_4799D40F0004get_impl*
end;//Tl3Printer.Get_PageHeight

function Tl3Printer.Get_PageWidth: Integer;
//#UC START# *46A46C2D00C2_4799D40F0004get_var*
 procedure lp_OnError;
 begin
  Result := LP2DP(l3PointX(def_inchPaperWidth)).X;
  f_NoPrinter := true;
 end;
//#UC END# *46A46C2D00C2_4799D40F0004get_var*
begin
//#UC START# *46A46C2D00C2_4799D40F0004get_impl*
 if f_NoPrinter then
  Result := LP2DP(l3PointX(def_inchPaperWidth)).X
 else
  try
   Result := PageWidth;
  except
   on EPrinter do
    lp_OnError;
   on EOSError do
    if Printers.Count = 0 then
     lp_OnError
    else
     raise;
  end;//try..except
//#UC END# *46A46C2D00C2_4799D40F0004get_impl*
end;//Tl3Printer.Get_PageWidth

function Tl3Printer.Get_Copies: Integer;
//#UC START# *46A46C410049_4799D40F0004get_var*
//#UC END# *46A46C410049_4799D40F0004get_var*
begin
//#UC START# *46A46C410049_4799D40F0004get_impl*
 Result := Copies;
//#UC END# *46A46C410049_4799D40F0004get_impl*
end;//Tl3Printer.Get_Copies

procedure Tl3Printer.Set_Copies(aValue: Integer);
//#UC START# *46A46C410049_4799D40F0004set_var*
//#UC END# *46A46C410049_4799D40F0004set_var*
begin
//#UC START# *46A46C410049_4799D40F0004set_impl*
 Copies := aValue;
//#UC END# *46A46C410049_4799D40F0004set_impl*
end;//Tl3Printer.Set_Copies

function Tl3Printer.Get_PaperExtent: Tl3_Point;
//#UC START# *4799B438008C_4799D40F0004get_var*
 procedure lp_OnError;
 begin
  Result.X := def_inchPaperWidth;
  Result.Y := def_inchPaperHeight;
  f_NoPrinter := true;
 end;
//#UC END# *4799B438008C_4799D40F0004get_var*
begin
//#UC START# *4799B438008C_4799D40F0004get_impl*
 if f_NoPrinter then
 begin
  Result.X := def_inchPaperWidth;
  Result.Y := def_inchPaperHeight;
 end
 else
  try
   Result := DP2LP(l3SPoint(GetDeviceCaps(Handle, PHYSICALWIDTH), GetDeviceCaps(Handle, PHYSICALHEIGHT)));
  except
   on EPrinter do
    lp_OnError;
   on EOSError do
    if Printers.Count = 0 then
     lp_OnError
    else
     raise;
  end;//try..except
//#UC END# *4799B438008C_4799D40F0004get_impl*
end;//Tl3Printer.Get_PaperExtent

function Tl3Printer.Clone: Il3Printer;
//#UC START# *49BAA14602EC_4799D40F0004_var*

 function CopyData(Handle: THandle): THandle;
 var
   Src, Dest: PChar;
   Size: Integer;
 begin
   if Handle <> 0 then
   begin
     Size := GlobalSize(Handle);
     Result := GlobalAlloc(GHND, Size);
     if Result <> 0 then
       try
         Src := GlobalLock(Handle);
         Dest := GlobalLock(Result);
         if (Src <> nil) and (Dest <> nil) then l3Move(Src^, Dest^, Size);
       finally
         GlobalUnlock(Handle);
         GlobalUnlock(Result);
       end
   end
   else Result := 0;
 end;

var
 l_PrinterIndex : Integer;
 l_Device,
 l_Driver,
 l_Port        : Array[0..255] of Char;
 l_hDeviceMode : THandle;
//#UC END# *49BAA14602EC_4799D40F0004_var*
begin
//#UC START# *49BAA14602EC_4799D40F0004_impl*
  Result := nil;
  l_PrinterIndex := Self.PrinterIndex; // Если что-то с принтером, то лучше упадем уже здесь...
  Result := Make;
  Result.PrinterIndex := l_PrinterIndex;
  Result.Copies := Self.Copies;
  Result.Title := Self.Get_Title;
  Result.FileName := Self.Get_FileName;
  Result.Collate := Self.Get_Collate;

  // Копируем настройки принтера:
  Self.GetPrinter(l_Device, l_Driver, l_Port, l_hDeviceMode);
  Result.SetPrinter(l_Device, l_Driver, l_Port, CopyData(l_hDeviceMode));
//#UC END# *49BAA14602EC_4799D40F0004_impl*
end;//Tl3Printer.Clone

function Tl3Printer.Get_Collate: Boolean;
//#UC START# *4C2D834D0019_4799D40F0004get_var*
//#UC END# *4C2D834D0019_4799D40F0004get_var*
begin
//#UC START# *4C2D834D0019_4799D40F0004get_impl*
 with THackPrinter(Self) do
 begin
  PrinterIndex;
  if DeviceMode = 0 then
   raise EPrinter.Create(SInvalidPrinterOp);
  Result := Get_CanCollate and (DevMode^.dmCollate = DMCOLLATE_TRUE);
 end;
//#UC END# *4C2D834D0019_4799D40F0004get_impl*
end;//Tl3Printer.Get_Collate

procedure Tl3Printer.Set_Collate(aValue: Boolean);
//#UC START# *4C2D834D0019_4799D40F0004set_var*
const
 cMap: array [Boolean] of Integer = (DMCOLLATE_FALSE, DMCOLLATE_TRUE);
//#UC END# *4C2D834D0019_4799D40F0004set_var*
begin
//#UC START# *4C2D834D0019_4799D40F0004set_impl*
 if Get_CanCollate then
  with THackPrinter(Self) do
  begin
   PrinterIndex;
   if DeviceMode = 0 then
    raise EPrinter.Create(SInvalidPrinterOp);
   DevMode^.dmCollate := cMap[aValue];
  end;
//#UC END# *4C2D834D0019_4799D40F0004set_impl*
end;//Tl3Printer.Set_Collate

function Tl3Printer.Get_CanCollate: Boolean;
//#UC START# *4C2D837000AB_4799D40F0004get_var*
//#UC END# *4C2D837000AB_4799D40F0004get_var*
begin
//#UC START# *4C2D837000AB_4799D40F0004get_impl*
 Result := pcCollation in Capabilities;
//#UC END# *4C2D837000AB_4799D40F0004get_impl*
end;//Tl3Printer.Get_CanCollate

procedure Tl3Printer.Refresh;
//#UC START# *4F36910C00F8_4799D40F0004_var*
//#UC END# *4F36910C00F8_4799D40F0004_var*
begin
//#UC START# *4F36910C00F8_4799D40F0004_impl*
 inherited Refresh;
//#UC END# *4F36910C00F8_4799D40F0004_impl*
end;//Tl3Printer.Refresh

procedure Tl3Printer.Cleanup;
//#UC START# *479731C50290_4799D40F0004_var*
//#UC END# *479731C50290_4799D40F0004_var*
begin
//#UC START# *479731C50290_4799D40F0004_impl*
 f_NoPrinter := false;
 inherited;
//#UC END# *479731C50290_4799D40F0004_impl*
end;//Tl3Printer.Cleanup

end.