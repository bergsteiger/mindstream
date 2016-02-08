unit afwComplexDocumentPreviewFactory;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  l3CacheableBase,
  afwInterfaces,
  l3ObjectList,
  afwComplexDocumentPreview,
  Classes
  ;

type
 TafwComplexDocumentPreviewFactory = class(Tl3CacheableBase, IafwComplexDocumentPreviewFactory)
  {* Фабрика Предварительный просмотр печати с кэшем. }
 private
 // private fields
   f_Previews : Tl3ObjectList;
   f_Printer : IafwPrinter;
 protected
 // realized methods
   function Make: IafwComplexDocumentPreview;
   function Count: Integer;
   procedure ResetCache(ResetInfo: Boolean);
   function pm_GetItem(anIndex: Integer): IafwComplexDocumentPreview;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   class function MakeI: IafwComplexDocumentPreviewFactory; reintroduce;
 end;//TafwComplexDocumentPreviewFactory

implementation

uses
  l3Printer,
  SysUtils,
  RTLConsts
  ;

type
  TafwCachedComplexDocumentPreview = class(TafwComplexDocumentPreview)
  private
  // private fields
   f_Factory : TafwComplexDocumentPreviewFactory;
  protected
  // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
  public
  // public methods
   constructor Create(aFactory: TafwComplexDocumentPreviewFactory); reintroduce;
  end;//TafwCachedComplexDocumentPreview

// start class TafwCachedComplexDocumentPreview

constructor TafwCachedComplexDocumentPreview.Create(aFactory: TafwComplexDocumentPreviewFactory);
//#UC START# *47DF90540311_47DF8FEF0327_var*
//#UC END# *47DF90540311_47DF8FEF0327_var*
begin
//#UC START# *47DF90540311_47DF8FEF0327_impl*
 inherited Create(nil, nil);
 f_Factory := aFactory;
 if Assigned(f_Factory) then
  f_Factory.f_Previews.Add(Self);
//#UC END# *47DF90540311_47DF8FEF0327_impl*
end;//TafwCachedComplexDocumentPreview.Create

procedure TafwCachedComplexDocumentPreview.Cleanup;
//#UC START# *479731C50290_47DF8FEF0327_var*
//#UC END# *479731C50290_47DF8FEF0327_var*
begin
//#UC START# *479731C50290_47DF8FEF0327_impl*
 if Assigned(f_Factory) then
  f_Factory.f_Previews.Remove(Self);
 f_Factory := nil;
 inherited;
//#UC END# *479731C50290_47DF8FEF0327_impl*
end;//TafwCachedComplexDocumentPreview.Cleanup

class function TafwComplexDocumentPreviewFactory.MakeI: IafwComplexDocumentPreviewFactory;
var
 l_Inst : TafwComplexDocumentPreviewFactory;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TafwComplexDocumentPreviewFactory.Make: IafwComplexDocumentPreview;
//#UC START# *473D8EAF022D_47DF8C5E01AB_var*
var
 l_Preview: TafwCachedComplexDocumentPreview;
//#UC END# *473D8EAF022D_47DF8C5E01AB_var*
begin
//#UC START# *473D8EAF022D_47DF8C5E01AB_impl*
 if f_Previews = nil then
 begin
  f_Previews := Tl3ObjectList.Make;
  f_Printer := Tl3Printer.Make;
 end;
 l_Preview := TafwCachedComplexDocumentPreview.Create(Self);
 try
  Result := l_Preview;
  Result.Printer := f_Printer;
 finally
  FreeAndNil(l_Preview);
 end;
//#UC END# *473D8EAF022D_47DF8C5E01AB_impl*
end;//TafwComplexDocumentPreviewFactory.Make

function TafwComplexDocumentPreviewFactory.Count: Integer;
//#UC START# *473D8EBB0035_47DF8C5E01AB_var*
//#UC END# *473D8EBB0035_47DF8C5E01AB_var*
begin
//#UC START# *473D8EBB0035_47DF8C5E01AB_impl*
 if Assigned(f_Previews) then
  Result := f_Previews.Count
 else
  Result := -1;
//#UC END# *473D8EBB0035_47DF8C5E01AB_impl*
end;//TafwComplexDocumentPreviewFactory.Count

procedure TafwComplexDocumentPreviewFactory.ResetCache(ResetInfo: Boolean);
//#UC START# *473D8ECB001A_47DF8C5E01AB_var*
var
 l_Idx: Integer;
//#UC END# *473D8ECB001A_47DF8C5E01AB_var*
begin
//#UC START# *473D8ECB001A_47DF8C5E01AB_impl*
 if ResetInfo then
 begin
  f_Printer := nil;
  f_Printer := Tl3Printer.Make;
  for l_Idx := 0 to Count-1 do
   pm_GetItem(l_Idx).Printer := f_Printer;
 end;
//#UC END# *473D8ECB001A_47DF8C5E01AB_impl*
end;//TafwComplexDocumentPreviewFactory.ResetCache

function TafwComplexDocumentPreviewFactory.pm_GetItem(anIndex: Integer): IafwComplexDocumentPreview;
//#UC START# *473D8ED80268_47DF8C5E01ABget_var*
//#UC END# *473D8ED80268_47DF8C5E01ABget_var*
begin
//#UC START# *473D8ED80268_47DF8C5E01ABget_impl*
 Result := nil;
 if Assigned(f_Previews) then
  Supports(f_Previews.Items[anIndex], IafwComplexDocumentPreview, Result)
 else
  raise EListError.CreateFmt(SListIndexError + ' from (%d)', [anIndex, Count])
//#UC END# *473D8ED80268_47DF8C5E01ABget_impl*
end;//TafwComplexDocumentPreviewFactory.pm_GetItem

procedure TafwComplexDocumentPreviewFactory.Cleanup;
//#UC START# *479731C50290_47DF8C5E01AB_var*
var
 l_IDX: Integer;
//#UC END# *479731C50290_47DF8C5E01AB_var*
begin
//#UC START# *479731C50290_47DF8C5E01AB_impl*
 f_Printer := nil;
 if Assigned(f_Previews) then
  for l_IDX := 0 to f_Previews.Count - 1 do
   TafwCachedComplexDocumentPreview(f_Previews.Items[l_IDX]).f_Factory := nil;
 FreeAndNil(f_Previews);
 inherited;
//#UC END# *479731C50290_47DF8C5E01AB_impl*
end;//TafwComplexDocumentPreviewFactory.Cleanup

end.