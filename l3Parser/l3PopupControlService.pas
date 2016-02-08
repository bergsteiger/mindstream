unit l3PopupControlService;

 
{$Include l3Define.inc}

interface

uses
  Windows,
  l3ProtoObject
  ;

(*
 Ml3PopupControlService = PureMixIn
  {* Контракт сервиса Tl3PopupControlService }
   function IsPopupControlWindow(aControlWnd: HWND): Boolean;
 end;//Ml3PopupControlService
*)

type
 Il3PopupControlService = interface(IUnknown)
  {* Интерфейс сервиса Tl3PopupControlService }
   ['{C4427BB1-962C-43A9-82FB-9DC18D0EB557}']
  // Ml3PopupControlService
   function IsPopupControlWindow(aControlWnd: HWND): Boolean;
 end;//Il3PopupControlService

 Tl3PopupControlService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3PopupControlService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3PopupControlService);
 public
 // realized methods
   function IsPopupControlWindow(aControlWnd: HWND): Boolean;
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // public properties
   property Alien: Il3PopupControlService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3PopupControlService }
 public
 // singleton factory method
   class function Instance: Tl3PopupControlService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3PopupControlService

implementation

uses
  l3Base {a}
  ;


// start class Tl3PopupControlService

var g_Tl3PopupControlService : Tl3PopupControlService = nil;

procedure Tl3PopupControlServiceFree;
begin
 l3Free(g_Tl3PopupControlService);
end;

class function Tl3PopupControlService.Instance: Tl3PopupControlService;
begin
 if (g_Tl3PopupControlService = nil) then
 begin
  l3System.AddExitProc(Tl3PopupControlServiceFree);
  g_Tl3PopupControlService := Create;
 end;
 Result := g_Tl3PopupControlService;
end;


procedure Tl3PopupControlService.pm_SetAlien(const aValue: Il3PopupControlService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3PopupControlService.pm_SetAlien

class function Tl3PopupControlService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3PopupControlService <> nil;
end;//Tl3PopupControlService.Exists

function Tl3PopupControlService.IsPopupControlWindow(aControlWnd: HWND): Boolean;
//#UC START# *D2E4642CC7BC_55879E12008D_var*
const
 cMenuClassName: String = '#32768';
var
 l_ClassName: String;
//#UC END# *D2E4642CC7BC_55879E12008D_var*
begin
//#UC START# *D2E4642CC7BC_55879E12008D_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.IsPopupControlWindow(aControlWnd)
 else
 begin
  SetLength(l_ClassName, 128);
  GetClassName(aControlWnd, PChar(l_ClassName), 128);
  l_ClassName := PChar(l_ClassName);
  Result := (l_ClassName = cMenuClassName);
 end;
//#UC END# *D2E4642CC7BC_55879E12008D_impl*
end;//Tl3PopupControlService.IsPopupControlWindow

procedure Tl3PopupControlService.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3PopupControlService.ClearFields

end.