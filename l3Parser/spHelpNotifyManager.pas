unit spHelpNotifyManager;

 
{$Include afwDefine.inc}

interface

uses
  l3SimpleDataContainer,
  l3ProtoObject,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 IspHelpNotifyListener = interface(IUnknown)
   ['{8BA8A002-A9CD-406C-BB04-02C173974511}']
   procedure HelpShown;
     {* Сигнатура метода HelpShown }
 end;//IspHelpNotifyListener

 _ItemType_ = IspHelpNotifyListener;
 _l3InterfacePtrList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
{$Include l3InterfacePtrList.imp.pas}
 TspHelpNotifyListenerList = class(_l3InterfacePtrList_)
 end;//TspHelpNotifyListenerList

 TspHelpNotifyManager = class(Tl3ProtoObject)
 private
 // private fields
   f_Listeners : TspHelpNotifyListenerList;
 private
 // private methods
   class function Exists: Boolean;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 public
 // public methods
   class procedure AddListener(const aListener: IspHelpNotifyListener);
   class procedure RemoveListener(const aListener: IspHelpNotifyListener);
   class procedure HelpShown;
     {* Сигнатура метода HelpShown }
 public
 // singleton factory method
   class function Instance: TspHelpNotifyManager;
    {- возвращает экземпляр синглетона. }
 end;//TspHelpNotifyManager

implementation

uses
  l3Base {a},
  l3MinMax,
  RTLConsts,
  SysUtils
  ;


// start class TspHelpNotifyManager

var g_TspHelpNotifyManager : TspHelpNotifyManager = nil;

procedure TspHelpNotifyManagerFree;
begin
 l3Free(g_TspHelpNotifyManager);
end;

class function TspHelpNotifyManager.Instance: TspHelpNotifyManager;
begin
 if (g_TspHelpNotifyManager = nil) then
 begin
  l3System.AddExitProc(TspHelpNotifyManagerFree);
  g_TspHelpNotifyManager := Create;
 end;
 Result := g_TspHelpNotifyManager;
end;


class function TspHelpNotifyManager.Exists: Boolean;
//#UC START# *53763D88015E_53760B2701DD_var*
//#UC END# *53763D88015E_53760B2701DD_var*
begin
//#UC START# *53763D88015E_53760B2701DD_impl*
 Result := Assigned(g_TspHelpNotifyManager);
//#UC END# *53763D88015E_53760B2701DD_impl*
end;//TspHelpNotifyManager.Exists

class procedure TspHelpNotifyManager.AddListener(const aListener: IspHelpNotifyListener);
//#UC START# *53760C6703AB_53760B2701DD_var*
//#UC END# *53760C6703AB_53760B2701DD_var*
begin
//#UC START# *53760C6703AB_53760B2701DD_impl*
 if Instance.f_Listeners.IndexOf(aListener) = -1 then
  Instance.f_Listeners.Add(aListener);
//#UC END# *53760C6703AB_53760B2701DD_impl*
end;//TspHelpNotifyManager.AddListener

class procedure TspHelpNotifyManager.RemoveListener(const aListener: IspHelpNotifyListener);
//#UC START# *53760C9201F9_53760B2701DD_var*
//#UC END# *53760C9201F9_53760B2701DD_var*
begin
//#UC START# *53760C9201F9_53760B2701DD_impl*
 if Exists then
  Instance.f_Listeners.Remove(aListener);
//#UC END# *53760C9201F9_53760B2701DD_impl*
end;//TspHelpNotifyManager.RemoveListener

class procedure TspHelpNotifyManager.HelpShown;
//#UC START# *53760DE9006D_53760B2701DD_var*
var
 I: Integer;
//#UC END# *53760DE9006D_53760B2701DD_var*
begin
//#UC START# *53760DE9006D_53760B2701DD_impl*
 if Exists then
  for I := 0 to Instance.f_Listeners.Count - 1 do
   Instance.f_Listeners[I].HelpShown;
//#UC END# *53760DE9006D_53760B2701DD_impl*
end;//TspHelpNotifyManager.HelpShown
type _Instance_R_ = TspHelpNotifyListenerList;

{$Include l3InterfacePtrList.imp.pas}

// start class TspHelpNotifyManager

procedure TspHelpNotifyManager.Cleanup;
//#UC START# *479731C50290_53760B2701DD_var*
//#UC END# *479731C50290_53760B2701DD_var*
begin
//#UC START# *479731C50290_53760B2701DD_impl*
 FreeAndNil(f_Listeners);
 inherited;
//#UC END# *479731C50290_53760B2701DD_impl*
end;//TspHelpNotifyManager.Cleanup

procedure TspHelpNotifyManager.InitFields;
//#UC START# *47A042E100E2_53760B2701DD_var*
//#UC END# *47A042E100E2_53760B2701DD_var*
begin
//#UC START# *47A042E100E2_53760B2701DD_impl*
 inherited;
 f_Listeners := TspHelpNotifyListenerList.Create;
//#UC END# *47A042E100E2_53760B2701DD_impl*
end;//TspHelpNotifyManager.InitFields

end.