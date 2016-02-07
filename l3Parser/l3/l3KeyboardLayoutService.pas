unit l3KeyboardLayoutService;


{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

(*
 Ml3KeyboardLayoutService = PureMixIn
  {* Контракт сервиса Tl3KeyboardLayoutService }
   procedure TryActivateKeyboardLayout;
 end;//Ml3KeyboardLayoutService
*)

type
 Il3KeyboardLayoutService = interface(IUnknown)
  {* Интерфейс сервиса Tl3KeyboardLayoutService }
   ['{B81FD1FC-A13C-4F60-A0D1-0D1F2E636216}']
  // Ml3KeyboardLayoutService
   procedure TryActivateKeyboardLayout;
 end;//Il3KeyboardLayoutService

 Tl3KeyboardLayoutService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3KeyboardLayoutService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3KeyboardLayoutService);
 public
 // realized methods
   procedure TryActivateKeyboardLayout;
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
   property Alien: Il3KeyboardLayoutService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3KeyboardLayoutService }
 public
 // singleton factory method
   class function Instance: Tl3KeyboardLayoutService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3KeyboardLayoutService

implementation

uses
  l3Base {a}
  ;


// start class Tl3KeyboardLayoutService

var g_Tl3KeyboardLayoutService : Tl3KeyboardLayoutService = nil;

procedure Tl3KeyboardLayoutServiceFree;
begin
 l3Free(g_Tl3KeyboardLayoutService);
end;

class function Tl3KeyboardLayoutService.Instance: Tl3KeyboardLayoutService;
begin
 if (g_Tl3KeyboardLayoutService = nil) then
 begin
  l3System.AddExitProc(Tl3KeyboardLayoutServiceFree);
  g_Tl3KeyboardLayoutService := Create;
 end;
 Result := g_Tl3KeyboardLayoutService;
end;


procedure Tl3KeyboardLayoutService.pm_SetAlien(const aValue: Il3KeyboardLayoutService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3KeyboardLayoutService.pm_SetAlien

class function Tl3KeyboardLayoutService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3KeyboardLayoutService <> nil;
end;//Tl3KeyboardLayoutService.Exists

procedure Tl3KeyboardLayoutService.TryActivateKeyboardLayout;
//#UC START# *747558CBA739_55099A8303E1_var*
//#UC END# *747558CBA739_55099A8303E1_var*
begin
//#UC START# *747558CBA739_55099A8303E1_impl*
 if (f_Alien <> nil) then
  f_Alien.TryActivateKeyboardLayout;
//#UC END# *747558CBA739_55099A8303E1_impl*
end;//Tl3KeyboardLayoutService.TryActivateKeyboardLayout

procedure Tl3KeyboardLayoutService.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3KeyboardLayoutService.ClearFields

end.