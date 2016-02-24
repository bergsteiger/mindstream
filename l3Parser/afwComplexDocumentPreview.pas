unit afwComplexDocumentPreview;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  l3CacheableBase,
  afwInterfaces,
  afwPreviewNotifierPtrList,
  l3IID,
  l3Interfaces,
  afwTypes,
  l3Core
  ;

type
 TafwDocumentPreviewArray = array [TafwPreviewContentKind] of IafwDocumentPreview;

 TafwComplexDocumentPreview = class(Tl3CacheableBase, IafwDocumentPreview, IafwPreviewNotifier, IafwComplexDocumentPreview, IafwPreviewNotificationSource)
  {* Предварительный просмотр печати составного документа. }
 private
 // private fields
   f_ContentKind : TafwPreviewContentKind;
   f_Printer : IafwPrinter;
   f_Previews : TafwDocumentPreviewArray;
   f_PreviewSubscribers : TafwPreviewNotifierPtrList;
 private
 // private methods
   procedure CheckPrinter(aKind: TafwPreviewContentKind);
   procedure CheckContent(aKind: TafwPreviewContentKind);
   procedure SetContent(aKind: TafwPreviewContentKind;
    const aValue: IafwDocumentPreview);
 protected
 // realized methods
   procedure ContentChanged;
     {* Содержимое preview изменилось. }
   function DocumentName: IafwCString;
     {* имя документа для preview. }
   function InProcess: Boolean;
     {* идет процесс? }
   function InPagesCounting: Boolean;
     {* сейчас в процессе подсчета страниц? }
   function InUpdate: Boolean;
     {* находимся в процессе построения preview? }
   function InPrinting: Boolean;
     {* находимся в процессе построения печати? }
   procedure Update(const aPanel: IafwPreviewPanel);
     {* установить preview на панель для отображения. }
   procedure Print(anInterval: TafwPagesInterval = afw_piAll;
    const aRange: Il3RangeManager = nil;
    aCopies: Integer = 1;
    const aFileName: AnsiString = '';
    aCollate: Boolean = True);
     {* напечатать на принтер. }
   procedure Stop(aWnd: THandle = 0);
     {* остановит процесс построение preview/печати. }
   function Stopped: Boolean;
     {* процесс остановлен? }
   function CloseRequested: Boolean;
     {* при остановке процесса был запрос на закрытие превью }
   function PreviewResetting: Boolean;
     {* канва отсутствует, но будет передалываться }
   procedure SetCurrentPage(const aCursor: IUnknown);
     {* устанавливает курсор на текущую страницу. }
   procedure SetCurrentPagePara(aParaID: Integer);
     {* устанавливает курсор на текущую страницу. }
   procedure SetCurrentPageNumber(aPageNumber: Integer);
     {* устанавливает курсор на текущую страницу. }
   function CurrentPage: Integer;
     {* текущая страница для печати. }
   function HasCurrentPage: Boolean;
     {* установлена ли текущая страница. }
   function pm_GetPrinter: IafwPrinter;
   procedure pm_SetPrinter(const aValue: IafwPrinter);
   function pm_GetHasText: Boolean;
   function pm_GetContentKind: TafwPreviewContentKind;
   procedure pm_SetContentKind(aValue: TafwPreviewContentKind);
   function Current: IafwDocumentPreview;
   function Document: IafwDocumentPreview;
   procedure SetDocument(const aDocument: IafwDocumentPreview);
   function Selection: IafwDocumentPreview;
   procedure SetSelection(const aSelection: IafwDocumentPreview);
   function Info: IafwDocumentPreview;
   procedure SetInfo(const anInfo: IafwDocumentPreview);
   procedure Subscribe(const aNotifier: IafwPreviewNotifier);
   procedure UnSubscribe(const aNotifier: IafwPreviewNotifier);
   function pm_GetPagesInfo: TafwPagesInfo;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* Реализация запроса интерфейса }
 public
 // public methods
   constructor Create(const aDocument: IafwDocumentPreview;
    const anInfo: IafwDocumentPreview); reintroduce;
   class function Make(const aDocument: IafwDocumentPreview;
    const anInfo: IafwDocumentPreview = nil): IafwComplexDocumentPreview; reintroduce;
 end;//TafwComplexDocumentPreview

implementation

uses
  SysUtils,
  l3Printer,
  l3Base
  ;

// start class TafwComplexDocumentPreview

procedure TafwComplexDocumentPreview.CheckPrinter(aKind: TafwPreviewContentKind);
//#UC START# *47DF9F2202FB_47DF8F0402F7_var*
//#UC END# *47DF9F2202FB_47DF8F0402F7_var*
begin
//#UC START# *47DF9F2202FB_47DF8F0402F7_impl*
 if (f_Previews[aKind] <> nil) then
  f_Previews[aKind].Printer := pm_GetPrinter;
//#UC END# *47DF9F2202FB_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.CheckPrinter

procedure TafwComplexDocumentPreview.CheckContent(aKind: TafwPreviewContentKind);
//#UC START# *47DF9F4000BB_47DF8F0402F7_var*
//#UC END# *47DF9F4000BB_47DF8F0402F7_var*
begin
//#UC START# *47DF9F4000BB_47DF8F0402F7_impl*
 if f_ContentKind = aKind then
  ContentChanged;
//#UC END# *47DF9F4000BB_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.CheckContent

procedure TafwComplexDocumentPreview.SetContent(aKind: TafwPreviewContentKind;
  const aValue: IafwDocumentPreview);
//#UC START# *47DF9FF70289_47DF8F0402F7_var*
var
 l_Source: IafwPreviewNotificationSource;
//#UC END# *47DF9FF70289_47DF8F0402F7_var*
begin
//#UC START# *47DF9FF70289_47DF8F0402F7_impl*
 if f_Previews[aKind] = aValue then Exit;
 if Supports(f_Previews[aKind], IafwPreviewNotificationSource, l_Source) then
  l_Source.UnSubscribe(Self);
 f_Previews[aKind] := aValue;
 if Supports(f_Previews[aKind], IafwPreviewNotificationSource, l_Source) then
  l_Source.Subscribe(Self);
 CheckPrinter(aKind);
 CheckContent(aKind);
//#UC END# *47DF9FF70289_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.SetContent

constructor TafwComplexDocumentPreview.Create(const aDocument: IafwDocumentPreview;
  const anInfo: IafwDocumentPreview);
//#UC START# *47DFA16D038D_47DF8F0402F7_var*
//#UC END# *47DFA16D038D_47DF8F0402F7_var*
begin
//#UC START# *47DFA16D038D_47DF8F0402F7_impl*
 inherited Create;
 SetContent(afw_pckDocument, aDocument);
 SetContent(afw_pckInfo, anInfo);
 f_ContentKind := afw_pckDocument;
 pm_GetPrinter;
 // - это чтобы присвоить один принтервсем частям
//#UC END# *47DFA16D038D_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Create

class function TafwComplexDocumentPreview.Make(const aDocument: IafwDocumentPreview;
  const anInfo: IafwDocumentPreview = nil): IafwComplexDocumentPreview;
var
 l_Inst : TafwComplexDocumentPreview;
begin
 l_Inst := Create(aDocument, anInfo);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TafwComplexDocumentPreview.ContentChanged;
//#UC START# *473D8BEE007B_47DF8F0402F7_var*
var
 l_Idx: Integer;
//#UC END# *473D8BEE007B_47DF8F0402F7_var*
begin
//#UC START# *473D8BEE007B_47DF8F0402F7_impl*
 if Assigned(f_PreviewSubscribers) then
  for l_Idx := f_PreviewSubscribers.Hi downto f_PreviewSubscribers.Lo do
   f_PreviewSubscribers[l_Idx].ContentChanged;
//#UC END# *473D8BEE007B_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.ContentChanged

function TafwComplexDocumentPreview.DocumentName: IafwCString;
//#UC START# *473D8C450198_47DF8F0402F7_var*
//#UC END# *473D8C450198_47DF8F0402F7_var*
begin
//#UC START# *473D8C450198_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := nil
 else
  Result := f_Previews[f_ContentKind].DocumentName;
//#UC END# *473D8C450198_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.DocumentName

function TafwComplexDocumentPreview.InProcess: Boolean;
//#UC START# *473D8C5C0187_47DF8F0402F7_var*
//#UC END# *473D8C5C0187_47DF8F0402F7_var*
begin
//#UC START# *473D8C5C0187_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := false
 else
  Result := f_Previews[f_ContentKind].InProcess;
//#UC END# *473D8C5C0187_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.InProcess

function TafwComplexDocumentPreview.InPagesCounting: Boolean;
//#UC START# *473D8C6C0266_47DF8F0402F7_var*
//#UC END# *473D8C6C0266_47DF8F0402F7_var*
begin
//#UC START# *473D8C6C0266_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := false
 else
  Result := f_Previews[f_ContentKind].InPagesCounting;
//#UC END# *473D8C6C0266_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.InPagesCounting

function TafwComplexDocumentPreview.InUpdate: Boolean;
//#UC START# *473D8C7C01B5_47DF8F0402F7_var*
//#UC END# *473D8C7C01B5_47DF8F0402F7_var*
begin
//#UC START# *473D8C7C01B5_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := false
 else
  Result := f_Previews[f_ContentKind].InUpdate;
//#UC END# *473D8C7C01B5_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.InUpdate

function TafwComplexDocumentPreview.InPrinting: Boolean;
//#UC START# *473D8C90022C_47DF8F0402F7_var*
//#UC END# *473D8C90022C_47DF8F0402F7_var*
begin
//#UC START# *473D8C90022C_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := false
 else
  Result := f_Previews[f_ContentKind].InPrinting;
//#UC END# *473D8C90022C_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.InPrinting

procedure TafwComplexDocumentPreview.Update(const aPanel: IafwPreviewPanel);
//#UC START# *473D8CA002D9_47DF8F0402F7_var*
//#UC END# *473D8CA002D9_47DF8F0402F7_var*
begin
//#UC START# *473D8CA002D9_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] <> nil) then
  f_Previews[f_ContentKind].Update(aPanel);
//#UC END# *473D8CA002D9_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Update

procedure TafwComplexDocumentPreview.Print(anInterval: TafwPagesInterval = afw_piAll;
  const aRange: Il3RangeManager = nil;
  aCopies: Integer = 1;
  const aFileName: AnsiString = '';
  aCollate: Boolean = True);
//#UC START# *473D8CAF028B_47DF8F0402F7_var*
//#UC END# *473D8CAF028B_47DF8F0402F7_var*
begin
//#UC START# *473D8CAF028B_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] <> nil) then
  f_Previews[f_ContentKind].Print(anInterval, aRange, aCopies, aFileName, aCollate);
//#UC END# *473D8CAF028B_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Print

procedure TafwComplexDocumentPreview.Stop(aWnd: THandle = 0);
//#UC START# *473D8CE9007C_47DF8F0402F7_var*
//#UC END# *473D8CE9007C_47DF8F0402F7_var*
begin
//#UC START# *473D8CE9007C_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] <> nil) then
  f_Previews[f_ContentKind].Stop(aWnd);
//#UC END# *473D8CE9007C_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Stop

function TafwComplexDocumentPreview.Stopped: Boolean;
//#UC START# *473D8CF80037_47DF8F0402F7_var*
//#UC END# *473D8CF80037_47DF8F0402F7_var*
begin
//#UC START# *473D8CF80037_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := false
 else
  Result := f_Previews[f_ContentKind].Stopped;
//#UC END# *473D8CF80037_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Stopped

function TafwComplexDocumentPreview.CloseRequested: Boolean;
//#UC START# *473D8D0A01D7_47DF8F0402F7_var*
//#UC END# *473D8D0A01D7_47DF8F0402F7_var*
begin
//#UC START# *473D8D0A01D7_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := true
 else
  Result := f_Previews[f_ContentKind].CloseRequested;
//#UC END# *473D8D0A01D7_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.CloseRequested

function TafwComplexDocumentPreview.PreviewResetting: Boolean;
//#UC START# *473D8D1E01B8_47DF8F0402F7_var*
//#UC END# *473D8D1E01B8_47DF8F0402F7_var*
begin
//#UC START# *473D8D1E01B8_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := false
 else
  Result := f_Previews[f_ContentKind].PreviewResetting;
//#UC END# *473D8D1E01B8_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.PreviewResetting

procedure TafwComplexDocumentPreview.SetCurrentPage(const aCursor: IUnknown);
//#UC START# *473D8D3800B1_47DF8F0402F7_var*
//#UC END# *473D8D3800B1_47DF8F0402F7_var*
begin
//#UC START# *473D8D3800B1_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] <> nil) then
  f_Previews[f_ContentKind].SetCurrentPage(aCursor);
//#UC END# *473D8D3800B1_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.SetCurrentPage

procedure TafwComplexDocumentPreview.SetCurrentPagePara(aParaID: Integer);
//#UC START# *473D8D4A019D_47DF8F0402F7_var*
//#UC END# *473D8D4A019D_47DF8F0402F7_var*
begin
//#UC START# *473D8D4A019D_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] <> nil) then
  f_Previews[f_ContentKind].SetCurrentPagePara(aParaID);
//#UC END# *473D8D4A019D_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.SetCurrentPagePara

procedure TafwComplexDocumentPreview.SetCurrentPageNumber(aPageNumber: Integer);
//#UC START# *473D8D5D032B_47DF8F0402F7_var*
//#UC END# *473D8D5D032B_47DF8F0402F7_var*
begin
//#UC START# *473D8D5D032B_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] <> nil) then
  f_Previews[f_ContentKind].SetCurrentPageNumber(aPageNumber);
//#UC END# *473D8D5D032B_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.SetCurrentPageNumber

function TafwComplexDocumentPreview.CurrentPage: Integer;
//#UC START# *473D8D72010F_47DF8F0402F7_var*
//#UC END# *473D8D72010F_47DF8F0402F7_var*
begin
//#UC START# *473D8D72010F_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := 0
 else
  Result := f_Previews[f_ContentKind].CurrentPage;
//#UC END# *473D8D72010F_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.CurrentPage

function TafwComplexDocumentPreview.HasCurrentPage: Boolean;
//#UC START# *473D8D830163_47DF8F0402F7_var*
//#UC END# *473D8D830163_47DF8F0402F7_var*
begin
//#UC START# *473D8D830163_47DF8F0402F7_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := false
 else
  Result := f_Previews[f_ContentKind].HasCurrentPage;
//#UC END# *473D8D830163_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.HasCurrentPage

function TafwComplexDocumentPreview.pm_GetPrinter: IafwPrinter;
//#UC START# *473D8D9500C9_47DF8F0402F7get_var*
//#UC END# *473D8D9500C9_47DF8F0402F7get_var*
begin
//#UC START# *473D8D9500C9_47DF8F0402F7get_impl*
 if (f_Printer = nil) then
  pm_SetPrinter(Tl3Printer.Make);
 Result := f_Printer;
//#UC END# *473D8D9500C9_47DF8F0402F7get_impl*
end;//TafwComplexDocumentPreview.pm_GetPrinter

procedure TafwComplexDocumentPreview.pm_SetPrinter(const aValue: IafwPrinter);
//#UC START# *473D8D9500C9_47DF8F0402F7set_var*
var
 l_Idx: TafwPreviewContentKind;
//#UC END# *473D8D9500C9_47DF8F0402F7set_var*
begin
//#UC START# *473D8D9500C9_47DF8F0402F7set_impl*
 if (f_Printer <> aValue) then
 begin
  f_Printer := aValue;
  for l_Idx := Low(TafwPreviewContentKind) to High(TafwPreviewContentKind) do
   CheckPrinter(l_Idx);
 end;//f_Printer <> aValue
//#UC END# *473D8D9500C9_47DF8F0402F7set_impl*
end;//TafwComplexDocumentPreview.pm_SetPrinter

function TafwComplexDocumentPreview.pm_GetHasText: Boolean;
//#UC START# *473D8DB10141_47DF8F0402F7get_var*
//#UC END# *473D8DB10141_47DF8F0402F7get_var*
begin
//#UC START# *473D8DB10141_47DF8F0402F7get_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := false
 else
  Result := f_Previews[f_ContentKind].HasText;
//#UC END# *473D8DB10141_47DF8F0402F7get_impl*
end;//TafwComplexDocumentPreview.pm_GetHasText

function TafwComplexDocumentPreview.pm_GetContentKind: TafwPreviewContentKind;
//#UC START# *473D8E0C01B0_47DF8F0402F7get_var*
//#UC END# *473D8E0C01B0_47DF8F0402F7get_var*
begin
//#UC START# *473D8E0C01B0_47DF8F0402F7get_impl*
 Result := f_ContentKind;
//#UC END# *473D8E0C01B0_47DF8F0402F7get_impl*
end;//TafwComplexDocumentPreview.pm_GetContentKind

procedure TafwComplexDocumentPreview.pm_SetContentKind(aValue: TafwPreviewContentKind);
//#UC START# *473D8E0C01B0_47DF8F0402F7set_var*
//#UC END# *473D8E0C01B0_47DF8F0402F7set_var*
begin
//#UC START# *473D8E0C01B0_47DF8F0402F7set_impl*
 if (f_ContentKind <> aValue) then
 begin
  f_ContentKind := aValue;
  CheckContent(f_ContentKind);
 end;
//#UC END# *473D8E0C01B0_47DF8F0402F7set_impl*
end;//TafwComplexDocumentPreview.pm_SetContentKind

function TafwComplexDocumentPreview.Current: IafwDocumentPreview;
//#UC START# *473D8E3003B1_47DF8F0402F7_var*
//#UC END# *473D8E3003B1_47DF8F0402F7_var*
begin
//#UC START# *473D8E3003B1_47DF8F0402F7_impl*
 Result := f_Previews[f_ContentKind];
//#UC END# *473D8E3003B1_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Current

function TafwComplexDocumentPreview.Document: IafwDocumentPreview;
//#UC START# *473D8E3D007A_47DF8F0402F7_var*
//#UC END# *473D8E3D007A_47DF8F0402F7_var*
begin
//#UC START# *473D8E3D007A_47DF8F0402F7_impl*
 Result := f_Previews[afw_pckDocument];
//#UC END# *473D8E3D007A_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Document

procedure TafwComplexDocumentPreview.SetDocument(const aDocument: IafwDocumentPreview);
//#UC START# *473D8E480102_47DF8F0402F7_var*
//#UC END# *473D8E480102_47DF8F0402F7_var*
begin
//#UC START# *473D8E480102_47DF8F0402F7_impl*
 SetContent(afw_pckDocument, aDocument);
//#UC END# *473D8E480102_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.SetDocument

function TafwComplexDocumentPreview.Selection: IafwDocumentPreview;
//#UC START# *473D8E540132_47DF8F0402F7_var*
//#UC END# *473D8E540132_47DF8F0402F7_var*
begin
//#UC START# *473D8E540132_47DF8F0402F7_impl*
 Result := f_Previews[afw_pckSelection];
//#UC END# *473D8E540132_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Selection

procedure TafwComplexDocumentPreview.SetSelection(const aSelection: IafwDocumentPreview);
//#UC START# *473D8E5F03B8_47DF8F0402F7_var*
//#UC END# *473D8E5F03B8_47DF8F0402F7_var*
begin
//#UC START# *473D8E5F03B8_47DF8F0402F7_impl*
 SetContent(afw_pckSelection, aSelection);
//#UC END# *473D8E5F03B8_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.SetSelection

function TafwComplexDocumentPreview.Info: IafwDocumentPreview;
//#UC START# *473D8E6A0314_47DF8F0402F7_var*
//#UC END# *473D8E6A0314_47DF8F0402F7_var*
begin
//#UC START# *473D8E6A0314_47DF8F0402F7_impl*
 Result := f_Previews[afw_pckInfo];
//#UC END# *473D8E6A0314_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Info

procedure TafwComplexDocumentPreview.SetInfo(const anInfo: IafwDocumentPreview);
//#UC START# *473D8E750356_47DF8F0402F7_var*
//#UC END# *473D8E750356_47DF8F0402F7_var*
begin
//#UC START# *473D8E750356_47DF8F0402F7_impl*
 SetContent(afw_pckInfo, anInfo);
//#UC END# *473D8E750356_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.SetInfo

procedure TafwComplexDocumentPreview.Subscribe(const aNotifier: IafwPreviewNotifier);
//#UC START# *475E827F01CB_47DF8F0402F7_var*
//#UC END# *475E827F01CB_47DF8F0402F7_var*
begin
//#UC START# *475E827F01CB_47DF8F0402F7_impl*
 if f_PreviewSubscribers = nil then
  f_PreviewSubscribers := TafwPreviewNotifierPtrList.Make;
 f_PreviewSubscribers.Add(aNotifier);
//#UC END# *475E827F01CB_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Subscribe

procedure TafwComplexDocumentPreview.UnSubscribe(const aNotifier: IafwPreviewNotifier);
//#UC START# *475E828B0231_47DF8F0402F7_var*
//#UC END# *475E828B0231_47DF8F0402F7_var*
begin
//#UC START# *475E828B0231_47DF8F0402F7_impl*
 f_PreviewSubscribers.Remove(aNotifier);
 if f_PreviewSubscribers.Count = 0 then
  FreeAndNil(f_PreviewSubscribers);
//#UC END# *475E828B0231_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.UnSubscribe

function TafwComplexDocumentPreview.pm_GetPagesInfo: TafwPagesInfo;
//#UC START# *4CC6A6FF0362_47DF8F0402F7get_var*
//#UC END# *4CC6A6FF0362_47DF8F0402F7get_var*
begin
//#UC START# *4CC6A6FF0362_47DF8F0402F7get_impl*
 if (f_Previews[f_ContentKind] = nil) then
  Result := TafwPagesInfo_E
 else
  Result := f_Previews[f_ContentKind].PagesInfo;
//#UC END# *4CC6A6FF0362_47DF8F0402F7get_impl*
end;//TafwComplexDocumentPreview.pm_GetPagesInfo

procedure TafwComplexDocumentPreview.Cleanup;
//#UC START# *479731C50290_47DF8F0402F7_var*
var
 l_Idx: TafwPreviewContentKind;
//#UC END# *479731C50290_47DF8F0402F7_var*
begin
//#UC START# *479731C50290_47DF8F0402F7_impl*
 FreeAndNil(f_PreviewSubscribers);
 for l_Idx := Low(TafwPreviewContentKind) to High(TafwPreviewContentKind) do
  SetContent(l_Idx, nil);
 f_Printer := nil;
 inherited;
//#UC END# *479731C50290_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.Cleanup

function TafwComplexDocumentPreview.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_47DF8F0402F7_var*
//#UC END# *4A60B23E00C3_47DF8F0402F7_var*
begin
//#UC START# *4A60B23E00C3_47DF8F0402F7_impl*
 Result := inherited COMQueryInterface(IID, Obj);
 if Result.Fail then
  if Supports(f_Previews[f_ContentKind], IID.IID, Obj) then
   Result.SetOk;
//#UC END# *4A60B23E00C3_47DF8F0402F7_impl*
end;//TafwComplexDocumentPreview.COMQueryInterface

end.