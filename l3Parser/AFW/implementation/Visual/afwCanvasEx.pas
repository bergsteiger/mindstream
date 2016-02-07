unit afwCanvasEx;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwInterfaces,
  l3InternalInterfaces,
  afwTypes,
  l3Canvas,
  l3Interfaces,
  l3Units,
  l3Types,
  l3Core,
  l3PrinterInterfaces,
  l3CanvasPrim
  ;

type
 TafwCanvasEx = class(Tl3Canvas)
  {* Канва с информацией о разбиении документа на страницы. }
 private
 // private fields
   f_CurrentPage : Integer;
   f_IsPreview : Boolean;
   f_PreviewPage : IafwPreviewPage;
   f_PagesArray : TafwPrintPagesArray;
 protected
 // overridden protected methods
   function NeedOpenRealPage(aDoc: Boolean;
    ByWidth: Boolean = false): Tl3OpenPageResult; override;
   function IsPreview: Boolean; override;
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoEndPaint; override;
     {* Реализация окончания рисования. }
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // overridden public methods
   procedure SetCanvas(Value: TCanvas;
    Alien: Boolean); override;
 public
 // public methods
   constructor Create(const aPrinter: IafwPrinter;
     const aPagesArray: TafwPrintPagesArray = nil); reintroduce;
   class function Make(const aPrinter: IafwPrinter;
     const aPagesArray: TafwPrintPagesArray = nil): Il3Canvas; reintroduce;
     {* Сигнатура фабрики TafwCanvasEx.Make }
 end;//TafwCanvasEx

implementation

uses
  afwPreviewPage
  ;

// start class TafwCanvasEx

constructor TafwCanvasEx.Create(const aPrinter: IafwPrinter;
  const aPagesArray: TafwPrintPagesArray = nil);
//#UC START# *4CC69EC600C3_47414C8700D5_var*
//#UC END# *4CC69EC600C3_47414C8700D5_var*
begin
//#UC START# *4CC69EC600C3_47414C8700D5_impl*
 f_IsPreview := false;
 CreateForPrinting(aPrinter);
 f_PagesArray := aPagesArray;
 f_CurrentPage := 0;
//#UC END# *4CC69EC600C3_47414C8700D5_impl*
end;//TafwCanvasEx.Create

class function TafwCanvasEx.Make(const aPrinter: IafwPrinter;
  const aPagesArray: TafwPrintPagesArray = nil): Il3Canvas;
var
 l_Inst : TafwCanvasEx;
begin
 l_Inst := Create(aPrinter, aPagesArray);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TafwCanvasEx.NeedOpenRealPage(aDoc: Boolean;
  ByWidth: Boolean = false): Tl3OpenPageResult;
//#UC START# *478E406D004B_47414C8700D5_var*
var
 l_IsPreview : Boolean;
 l_CurrentPage: Integer;
//#UC END# *478E406D004B_47414C8700D5_var*
begin
//#UC START# *478E406D004B_47414C8700D5_impl*
 Result := l3_oprYes;
 if aDoc then
  f_CurrentPage := 0;
 if Assigned(f_PagesArray) then
  // - если печатаем только выбранные листы
 begin
  l_CurrentPage := f_CurrentPage;
  // Учитываем печать страницы-продолжения
  if (l_CurrentPage > 0) and ByWidth then
   Dec(l_CurrentPage);
  if (l_CurrentPage >= Length(f_PagesArray)) then
  begin
   Result := l3_oprEndDoc;
   l_IsPreview := true;
  end//f_CurrentPage >= Length(f_PagesArray);
  else
  begin
   l_IsPreview := (f_PagesArray[l_CurrentPage].rNumber <> f_PageNumber);
   if not (ByWidth or l_IsPreview) then
    Inc(f_CurrentPage);
  end;//l_CurrentPage >= Length(f_PagesArray)
  if not l_IsPreview then
  begin
   //SetDC(Canvas.Handle, ev_dcfCanvas);
  end//not l_IsPreview
  else
  begin
   //SetDC(Canvas.Handle, ev_dcfCanvas);
   if (f_PreviewPage = nil) then
    f_PreviewPage := TafwPreviewPage.Make(Self);
  end;//not l_IsPreview
 end//Assigned(f_PagesArray)
 else
  l_IsPreview := false;
 f_IsPreview := l_IsPreview;
 if f_IsPreview AND (Result <> l3_oprEndDoc) then
  Result := l3_oprNo;
//#UC END# *478E406D004B_47414C8700D5_impl*
end;//TafwCanvasEx.NeedOpenRealPage

function TafwCanvasEx.IsPreview: Boolean;
//#UC START# *478E40D30089_47414C8700D5_var*
//#UC END# *478E40D30089_47414C8700D5_var*
begin
//#UC START# *478E40D30089_47414C8700D5_impl*
 Result := f_IsPreview;
//#UC END# *478E40D30089_47414C8700D5_impl*
end;//TafwCanvasEx.IsPreview

procedure TafwCanvasEx.SetCanvas(Value: TCanvas;
  Alien: Boolean);
//#UC START# *478E40F20207_47414C8700D5_var*
//#UC END# *478E40F20207_47414C8700D5_var*
begin
//#UC START# *478E40F20207_47414C8700D5_impl*
 if (f_DCFlag = ev_dcfLinked) then
  SetDC(0, ev_dcfCanvas);
 inherited;
//#UC END# *478E40F20207_47414C8700D5_impl*
end;//TafwCanvasEx.SetCanvas

procedure TafwCanvasEx.Cleanup;
//#UC START# *479731C50290_47414C8700D5_var*
//#UC END# *479731C50290_47414C8700D5_var*
begin
//#UC START# *479731C50290_47414C8700D5_impl*
 f_PagesArray := nil;
 f_CurrentPage := 0;
 inherited;
 f_PreviewPage := nil;
//#UC END# *479731C50290_47414C8700D5_impl*
end;//TafwCanvasEx.Cleanup

procedure TafwCanvasEx.DoEndPaint;
//#UC START# *4797837E0112_47414C8700D5_var*
//#UC END# *4797837E0112_47414C8700D5_var*
begin
//#UC START# *4797837E0112_47414C8700D5_impl*
 if (f_PreviewPage <> nil) then
 begin
  SetCanvas(nil, false);
  f_PreviewPage := nil;
 end;//f_PreviewPage <> nil
 inherited;
 if f_IsPreview then
  SetCanvas(nil, false);
 f_IsPreview := false;
//#UC END# *4797837E0112_47414C8700D5_impl*
end;//TafwCanvasEx.DoEndPaint

procedure TafwCanvasEx.ClearFields;
 {-}
begin
 f_PreviewPage := nil;
 inherited;
end;//TafwCanvasEx.ClearFields

end.