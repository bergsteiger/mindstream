unit kwPrintDataSaver;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPrintDataSaver.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::MixIns::TkwPrintDataSaver
//
// Парень умеющий сохранять результаты печати в файл.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(InsiderTest) AND not defined(NoScripts)}
uses
  afwInterfaces,
  nevShapesPaintedSpy
  {$If defined(nsTest)}
  ,
  afwPreviewPageSpy
  {$IfEnd} //nsTest
  ,
  tfwScriptingInterfaces,
  evCustomPrintDataSaver,
  nevTools,
  afwPreviewPage
  ;
{$IfEnd} //InsiderTest AND not NoScripts

{$If defined(InsiderTest) AND not defined(NoScripts)}
type
 TkwPrintDataSaver = class(TevCustomPrintDataSaver, IafwPreviewPanel, InevShapesLogger {$If defined(nsTest)}, IafwPagesLogger{$IfEnd} //nsTest
 )
  {* Парень умеющий сохранять результаты печати в файл. }
 private
 // private fields
   f_Context : TtfwContext;
   f_Now : Cardinal;
   f_CurrentOutput : AnsiString;
   f_LogNumber : Integer;
   f_Done : Boolean;
   f_WasInit : Integer;
 private
 // private methods
   function PageFileName(aNumber: Integer;
     aWidthNumber: Integer;
     aCounter: Boolean;
     anEtalon: Boolean): AnsiString;
   procedure ClearFields;
 protected
 // realized methods
   procedure SetCurrentPage(aValue: Integer);
   procedure Invalidate;
   procedure Done;
   procedure pm_SetPreviewCanvas(const aValue: IafwPreviewCanvas);
   function pm_GetPainted: Boolean;
   function OpenLog(const aView: InevView): AnsiString;
   procedure CloseLog(const aLogName: AnsiString);
   function LogScreen(const aView: InevView): Boolean;
    {$If defined(nsTest)}
   procedure LogPage(aPage: TafwPreviewPage;
     aCounter: Boolean);
    {$IfEnd} //nsTest
   {$If defined(nsTest)}
   function ShouldStop: Boolean;
   {$IfEnd} //nsTest
   function GetPanel: IafwPreviewPanel; override;
   procedure CheckResult; override;
   function IsWaitingPrint: Boolean; override;
    {$If defined(nsTest)}
   procedure IncCounterPageNumer;
    {$IfEnd} //nsTest
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   procedure StartWaitingToPrint(const aCtx: TtfwContext);
   procedure EndWatingToPrint;
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TkwPrintDataSaver;
    {- возвращает экземпляр синглетона. }
 end;//TkwPrintDataSaver
{$IfEnd} //InsiderTest AND not NoScripts

implementation

{$If defined(InsiderTest) AND not defined(NoScripts)}
uses
  l3Base {a},
  SysUtils,
  l3String,
  imageenio,
  Graphics,
  Classes,
  l3FileUtils,
  Windows
  ;
{$IfEnd} //InsiderTest AND not NoScripts

{$If defined(InsiderTest) AND not defined(NoScripts)}


// start class TkwPrintDataSaver

var g_TkwPrintDataSaver : TkwPrintDataSaver = nil;

procedure TkwPrintDataSaverFree;
begin
 l3Free(g_TkwPrintDataSaver);
end;

class function TkwPrintDataSaver.Instance: TkwPrintDataSaver;
begin
 if (g_TkwPrintDataSaver = nil) then
 begin
  l3System.AddExitProc(TkwPrintDataSaverFree);
  g_TkwPrintDataSaver := Create;
 end;
 Result := g_TkwPrintDataSaver;
end;


function TkwPrintDataSaver.PageFileName(aNumber: Integer;
  aWidthNumber: Integer;
  aCounter: Boolean;
  anEtalon: Boolean): AnsiString;
//#UC START# *4F0D866C01AA_4F72AE860228_var*
var
 l_Et : AnsiString;
 l_C  : AnsiString;
 l_WN : AnsiString;
//#UC END# *4F0D866C01AA_4F72AE860228_var*
begin
//#UC START# *4F0D866C01AA_4F72AE860228_impl*
 if aCounter then
  l_C := 'C_'
 else
  l_C := '';
 if (aWidthNumber = 0) then
  l_WN := ''
 else
  l_WN := '.' + l3LeftPadChar(IntToStr(aWidthNumber), 2, '0');
 if anEtalon then
  l_Et := f_Context.rCaller.GetEtalonSuffix
 else
  l_Et := '';
 Result := Format('%s%s.%s%s%s%s.png',
                  [f_Context.rCaller.ResolveOutputFilePath(''),
                   f_Context.rCaller.KPage,
                   l_C,
                   l3LeftPadChar(IntToStr(aNumber), 4, '0'),
                   l_WN,
                   l_Et
                  ]);
//#UC END# *4F0D866C01AA_4F72AE860228_impl*
end;//TkwPrintDataSaver.PageFileName

procedure TkwPrintDataSaver.ClearFields;
//#UC START# *4F0E826901E6_4F72AE860228_var*
//#UC END# *4F0E826901E6_4F72AE860228_var*
begin
//#UC START# *4F0E826901E6_4F72AE860228_impl*
 f_CurrentOutput := '';
 f_LogNumber := 0;
//#UC END# *4F0E826901E6_4F72AE860228_impl*
end;//TkwPrintDataSaver.ClearFields

procedure TkwPrintDataSaver.StartWaitingToPrint(const aCtx: TtfwContext);
//#UC START# *4F72D8AE013F_4F72AE860228_var*
//#UC END# *4F72D8AE013F_4F72AE860228_var*
begin
//#UC START# *4F72D8AE013F_4F72AE860228_impl*
 Inc(f_WasInit);
 if f_WasInit = 1 then
 begin
  TafwPreviewPageSpy.Instance.SetLogger(Self);
  TnevShapesPaintedSpy.Instance.SetLogger(Self);
  f_Context := aCtx;
  aCtx.rCaller.DontRaiseIfEtalonCreated;
  aCtx.rCaller.StartTimer;
  f_Now := GetTickCount;
  f_Done := False;
 end; // if f_WasInit = 1 then
//#UC END# *4F72D8AE013F_4F72AE860228_impl*
end;//TkwPrintDataSaver.StartWaitingToPrint

procedure TkwPrintDataSaver.EndWatingToPrint;
//#UC START# *4F72D927016C_4F72AE860228_var*
//#UC END# *4F72D927016C_4F72AE860228_var*
begin
//#UC START# *4F72D927016C_4F72AE860228_impl*
 Dec(f_WasInit);
 if f_WasInit = 0 then
 begin
  f_Context.rCaller.StopTimer('Preview.Update');
  TnevShapesPaintedSpy.Instance.RemoveLogger(Self);
  TafwPreviewPageSpy.Instance.RemoveLogger(Self);
  ClearFields;
 // f_Context.rCaller.Check(f_Done);
 end // if f_WasInit = 0 then
 else
  f_Context.rCaller.Check(False, 'Непарность вызовов начала и окончания печати!');
//#UC END# *4F72D927016C_4F72AE860228_impl*
end;//TkwPrintDataSaver.EndWatingToPrint

class function TkwPrintDataSaver.Exists: Boolean;
 {-}
begin
 Result := g_TkwPrintDataSaver <> nil;
end;//TkwPrintDataSaver.Exists

procedure TkwPrintDataSaver.SetCurrentPage(aValue: Integer);
//#UC START# *473D86B20150_4F72AE860228_var*
//#UC END# *473D86B20150_4F72AE860228_var*
begin
//#UC START# *473D86B20150_4F72AE860228_impl*
//#UC END# *473D86B20150_4F72AE860228_impl*
end;//TkwPrintDataSaver.SetCurrentPage

procedure TkwPrintDataSaver.Invalidate;
//#UC START# *473D86BD03D7_4F72AE860228_var*
//#UC END# *473D86BD03D7_4F72AE860228_var*
begin
//#UC START# *473D86BD03D7_4F72AE860228_impl*
 // - ничего не делаем
 if IsWaitingPrint then
  f_Context.rCaller.CheckTimeout(f_Now, 120 * 60 * 1000)
 // - проверяем, что зациклились
//#UC END# *473D86BD03D7_4F72AE860228_impl*
end;//TkwPrintDataSaver.Invalidate

procedure TkwPrintDataSaver.Done;
//#UC START# *473D86C60253_4F72AE860228_var*
//#UC END# *473D86C60253_4F72AE860228_var*
begin
//#UC START# *473D86C60253_4F72AE860228_impl*
 f_Done := True;
//#UC END# *473D86C60253_4F72AE860228_impl*
end;//TkwPrintDataSaver.Done

procedure TkwPrintDataSaver.pm_SetPreviewCanvas(const aValue: IafwPreviewCanvas);
//#UC START# *473D86D60152_4F72AE860228set_var*
//#UC END# *473D86D60152_4F72AE860228set_var*
begin
//#UC START# *473D86D60152_4F72AE860228set_impl*
//#UC END# *473D86D60152_4F72AE860228set_impl*
end;//TkwPrintDataSaver.pm_SetPreviewCanvas

function TkwPrintDataSaver.pm_GetPainted: Boolean;
//#UC START# *473D86E601F5_4F72AE860228get_var*
//#UC END# *473D86E601F5_4F72AE860228get_var*
begin
//#UC START# *473D86E601F5_4F72AE860228get_impl*
 Result := false
//#UC END# *473D86E601F5_4F72AE860228get_impl*
end;//TkwPrintDataSaver.pm_GetPainted

function TkwPrintDataSaver.OpenLog(const aView: InevView): AnsiString;
//#UC START# *4CA5D0430096_4F72AE860228_var*
var
 l_Cnv : InevInfoCanvas;
 l_C : AnsiString;
 l_WN : AnsiString;
 l_Page : Integer;

 procedure MakeName;
 begin//MakeName
  Result := Format('%s%s.%s%s%s.shapes',
                   [f_Context.rCaller.ResolveOutputFilePath(''),
                    f_Context.rCaller.KPage,
                    l_C,
                    l3LeftPadChar(IntToStr(l_Page), 4, '0'),
                    l_WN
                   ]);
 end;//MakeName

//#UC END# *4CA5D0430096_4F72AE860228_var*
begin
//#UC START# *4CA5D0430096_4F72AE860228_impl*
 //Inc(f_LogNumber);
 l_Cnv := aView.Metrics.InfoCanvas;
 if l_Cnv.IsPagesCounter then
  l_C := 'C_'
 else
  l_C := '';
 if (f_LogNumber = 0) then
  l_WN := ''
 else
  l_WN := '.' + l3LeftPadChar(IntToStr(f_LogNumber), 2, '0');
 f_LogNumber := l_Cnv.PageWidthNumber;
 l_Page := l_Cnv.PageNumber;
 if (l_Page > 1) then
  Dec(l_Page)
 else
  Assert(l_Page = 1);
 MakeName;
 if (Result = f_CurrentOutput) then
 begin
  Inc(l_Page);
  MakeName;
 end;//Result = f_CurrentOutput
 f_CurrentOutput := Result;
//#UC END# *4CA5D0430096_4F72AE860228_impl*
end;//TkwPrintDataSaver.OpenLog

procedure TkwPrintDataSaver.CloseLog(const aLogName: AnsiString);
//#UC START# *4CA5D0540033_4F72AE860228_var*
//#UC END# *4CA5D0540033_4F72AE860228_var*
begin
//#UC START# *4CA5D0540033_4F72AE860228_impl*
 Assert(f_CurrentOutput <> '');
 f_Context.rCaller.CheckPrintEtalon(aLogName, f_CurrentOutput);
//#UC END# *4CA5D0540033_4F72AE860228_impl*
end;//TkwPrintDataSaver.CloseLog

function TkwPrintDataSaver.LogScreen(const aView: InevView): Boolean;
//#UC START# *4CACAF4F008D_4F72AE860228_var*
//#UC END# *4CACAF4F008D_4F72AE860228_var*
begin
//#UC START# *4CACAF4F008D_4F72AE860228_impl*
 with aView.Metrics.InfoCanvas do
  Result := Printing AND not IsVirtual;
//#UC END# *4CACAF4F008D_4F72AE860228_impl*
end;//TkwPrintDataSaver.LogScreen

{$If defined(nsTest)}
procedure TkwPrintDataSaver.LogPage(aPage: TafwPreviewPage;
  aCounter: Boolean);
//#UC START# *4CB6E39A019E_4F72AE860228_var*
var
 l_EN  : AnsiString;
 l_N   : AnsiString;
 l_IO : TImageEnIO;
 l_B  : Graphics.TBitmap;
 l_CVSPath : AnsiString;
 l_CVS : AnsiString;
//#UC END# *4CB6E39A019E_4F72AE860228_var*
begin
//#UC START# *4CB6E39A019E_4F72AE860228_impl*
 if aCounter then
  Exit;
 if (aPage.PageNumber <= 0) then
  Exit; 
 l_EN := PageFileName(aPage.PageNumber, aPage.PageWidthNumber, aCounter, true);
 l_N := PageFileName(aPage.PageNumber, aPage.PageWidthNumber, aCounter, false);
 l_IO := TImageEnIO.Create(nil);
 try
  l_B := Graphics.TBitmap.Create;
  try
   l_B.PixelFormat := pf24bit;
   l_B.Width := Trunc(IafwPreviewPage(aPage).GetMMWidth * 0.01 * 96 / 25.4);
   l_B.Height := Trunc(IafwPreviewPage(aPage).GetMMHeight * 0.01 * 96 / 25.4);
   IafwPreviewPage(aPage).DrawTo(Rect(0, 0, l_B.Width, l_B.Height), l_B);
   l_IO.Bitmap := l_B;
   l_IO.Params.BitsPerSample := 8;
   l_IO.Params.SamplesPerPixel := 1;
   l_IO.SaveToFilePNG(l_N);
  finally
   FreeAndNil(l_B);
  end;//try..finally
 finally
  FreeAndNil(l_IO);
 end;//try..finally
 if not f_Context.rCaller.GetIsWritingToK then
 begin
  if not FileExists(l_EN) then                                     
   l3FileUtils.CopyFile(l_N, l_EN);
  if not f_Context.rCaller.GetIsFakeCVS then
  begin
   l_CVSPath := f_Context.rCaller.GetCVSPath + '\' + f_Context.rCaller.GetTestSetFolderName + '\';
   if DirectoryExists(l_CVSPath) then
   begin
    l_CVS := l_CVSPath + ExtractFileName(l_EN);
    if not FileExists(l_CVS) then
    begin
     l3FileUtils.CopyFile(l_N, l_CVS);
     f_Context.rCaller.ToLog(Format('Сделан эталон для помещения в CVS - "%s"', [l_CVS]));
    end;//not FileExists(l_CVS)
   end;//DirectoryExists(l_CVSPath)
  end;//not IsFakeCVS
 end;//not IsWritingToK
//#UC END# *4CB6E39A019E_4F72AE860228_impl*
end;//TkwPrintDataSaver.LogPage
{$IfEnd} //nsTest

{$If defined(nsTest)}
function TkwPrintDataSaver.ShouldStop: Boolean;
//#UC START# *4DDE0F5C0097_4F72AE860228_var*
//#UC END# *4DDE0F5C0097_4F72AE860228_var*
begin
//#UC START# *4DDE0F5C0097_4F72AE860228_impl*
 if IsWaitingPrint then
  Result := f_Context.rCaller.ShouldStop
 else
  Result := False;
//#UC END# *4DDE0F5C0097_4F72AE860228_impl*
end;//TkwPrintDataSaver.ShouldStop
{$IfEnd} //nsTest

function TkwPrintDataSaver.GetPanel: IafwPreviewPanel;
//#UC START# *4F72F9CD022D_4F72AE860228_var*
//#UC END# *4F72F9CD022D_4F72AE860228_var*
begin
//#UC START# *4F72F9CD022D_4F72AE860228_impl*
  Result := Self
//#UC END# *4F72F9CD022D_4F72AE860228_impl*
end;//TkwPrintDataSaver.GetPanel

procedure TkwPrintDataSaver.CheckResult;
//#UC START# *4F746CEA001D_4F72AE860228_var*
//#UC END# *4F746CEA001D_4F72AE860228_var*
begin
//#UC START# *4F746CEA001D_4F72AE860228_impl*
 if IsWaitingPrint then
  f_Context.rCaller.Check(f_Done);
//#UC END# *4F746CEA001D_4F72AE860228_impl*
end;//TkwPrintDataSaver.CheckResult

function TkwPrintDataSaver.IsWaitingPrint: Boolean;
//#UC START# *4F7967A8006B_4F72AE860228_var*
//#UC END# *4F7967A8006B_4F72AE860228_var*
begin
//#UC START# *4F7967A8006B_4F72AE860228_impl*
 Result := f_WasInit > 0;
//#UC END# *4F7967A8006B_4F72AE860228_impl*
end;//TkwPrintDataSaver.IsWaitingPrint

{$If defined(nsTest)}
procedure TkwPrintDataSaver.IncCounterPageNumer;
//#UC START# *51ADB60602BB_4F72AE860228_var*
//#UC END# *51ADB60602BB_4F72AE860228_var*
begin
//#UC START# *51ADB60602BB_4F72AE860228_impl*
//#UC END# *51ADB60602BB_4F72AE860228_impl*
end;//TkwPrintDataSaver.IncCounterPageNumer
{$IfEnd} //nsTest

procedure TkwPrintDataSaver.Cleanup;
//#UC START# *479731C50290_4F72AE860228_var*
//#UC END# *479731C50290_4F72AE860228_var*
begin
//#UC START# *479731C50290_4F72AE860228_impl*
 ClearFields;
 inherited;
//#UC END# *479731C50290_4F72AE860228_impl*
end;//TkwPrintDataSaver.Cleanup

{$IfEnd} //InsiderTest AND not NoScripts

initialization
{$If defined(InsiderTest) AND not defined(NoScripts)}
//#UC START# *4F743764030D*
 TevCustomPrintDataSaver.SetPrintDataSaver(TkwPrintDataSaver.Instance);
//#UC END# *4F743764030D*
{$IfEnd} //InsiderTest AND not NoScripts

end.