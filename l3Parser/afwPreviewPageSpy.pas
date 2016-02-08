unit afwPreviewPageSpy;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

{$If defined(nsTest)}
uses
  afwPreviewPage,
  l3ProtoObject
  ;
{$IfEnd} //nsTest

{$If defined(nsTest)}
type
 IafwPagesLogger = interface(IUnknown)
   ['{19361554-2DE2-4E58-B896-503677BDD13B}']
   procedure LogPage(aPage: TafwPreviewPage;
    aCounter: Boolean);
   procedure IncCounterPageNumer;
 end;//IafwPagesLogger

 TafwPreviewPageSpy = class(Tl3ProtoObject)
  {* Следилка за TafwPreviewPage, для [RequestLink:235873282] }
 private
 // private fields
   f_Logger : IafwPagesLogger;
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   class function Exists: Boolean;
   procedure SetLogger(const aLogger: IafwPagesLogger);
   procedure RemoveLogger(const aLogger: IafwPagesLogger);
   procedure LogPage(aPage: TafwPreviewPage;
     aCounter: Boolean);
   procedure IncCounterNumber;
 public
 // singleton factory method
   class function Instance: TafwPreviewPageSpy;
    {- возвращает экземпляр синглетона. }
 end;//TafwPreviewPageSpy
{$IfEnd} //nsTest

implementation

{$If defined(nsTest)}
uses
  l3Base {a}
  ;
{$IfEnd} //nsTest

{$If defined(nsTest)}


// start class TafwPreviewPageSpy

var g_TafwPreviewPageSpy : TafwPreviewPageSpy = nil;

procedure TafwPreviewPageSpyFree;
begin
 l3Free(g_TafwPreviewPageSpy);
end;

class function TafwPreviewPageSpy.Instance: TafwPreviewPageSpy;
begin
 if (g_TafwPreviewPageSpy = nil) then
 begin
  l3System.AddExitProc(TafwPreviewPageSpyFree);
  g_TafwPreviewPageSpy := Create;
 end;
 Result := g_TafwPreviewPageSpy;
end;


class function TafwPreviewPageSpy.Exists: Boolean;
//#UC START# *4CB6E34302AD_4CB6DFDE0374_var*
//#UC END# *4CB6E34302AD_4CB6DFDE0374_var*
begin
//#UC START# *4CB6E34302AD_4CB6DFDE0374_impl*
 Result := (g_TafwPreviewPageSpy <> nil);
//#UC END# *4CB6E34302AD_4CB6DFDE0374_impl*
end;//TafwPreviewPageSpy.Exists

procedure TafwPreviewPageSpy.SetLogger(const aLogger: IafwPagesLogger);
//#UC START# *4CB6E54D0386_4CB6DFDE0374_var*
//#UC END# *4CB6E54D0386_4CB6DFDE0374_var*
begin
//#UC START# *4CB6E54D0386_4CB6DFDE0374_impl*
 Assert(f_Logger = nil);
 f_Logger := aLogger;
//#UC END# *4CB6E54D0386_4CB6DFDE0374_impl*
end;//TafwPreviewPageSpy.SetLogger

procedure TafwPreviewPageSpy.RemoveLogger(const aLogger: IafwPagesLogger);
//#UC START# *4CB6E5690252_4CB6DFDE0374_var*
//#UC END# *4CB6E5690252_4CB6DFDE0374_var*
begin
//#UC START# *4CB6E5690252_4CB6DFDE0374_impl*
 Assert(f_Logger = aLogger);
 f_Logger := nil;
//#UC END# *4CB6E5690252_4CB6DFDE0374_impl*
end;//TafwPreviewPageSpy.RemoveLogger

procedure TafwPreviewPageSpy.LogPage(aPage: TafwPreviewPage;
  aCounter: Boolean);
//#UC START# *4CB6E596010B_4CB6DFDE0374_var*
//#UC END# *4CB6E596010B_4CB6DFDE0374_var*
begin
//#UC START# *4CB6E596010B_4CB6DFDE0374_impl*
 if (f_Logger <> nil) then
  f_Logger.LogPage(aPage, aCounter);
//#UC END# *4CB6E596010B_4CB6DFDE0374_impl*
end;//TafwPreviewPageSpy.LogPage

procedure TafwPreviewPageSpy.IncCounterNumber;
//#UC START# *51ADB624017D_4CB6DFDE0374_var*
//#UC END# *51ADB624017D_4CB6DFDE0374_var*
begin
//#UC START# *51ADB624017D_4CB6DFDE0374_impl*
 if (f_Logger <> nil) then
  f_Logger.IncCounterPageNumer;
//#UC END# *51ADB624017D_4CB6DFDE0374_impl*
end;//TafwPreviewPageSpy.IncCounterNumber

procedure TafwPreviewPageSpy.ClearFields;
 {-}
begin
 {$If defined(nsTest)}
 f_Logger := nil;
 {$IfEnd} //nsTest
 inherited;
end;//TafwPreviewPageSpy.ClearFields

{$IfEnd} //nsTest

end.