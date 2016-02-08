unit l3ScreenService;
 
{$Include l3Define.inc}

interface

uses
  l3InternalInterfaces,
  l3ProtoObject
  ;

(*
 Ml3ScreenService = PureMixIn
  {* Контракт сервиса Tl3ScreenService }
   function IC: Il3InfoCanvas;
 end;//Ml3ScreenService
*)

type
 Il3ScreenService = interface(IUnknown)
  {* Интерфейс сервиса Tl3ScreenService }
   ['{2ADD24A4-6629-417A-9825-E326572364B7}']
  // Ml3ScreenService
   function IC: Il3InfoCanvas;
 end;//Il3ScreenService

 Tl3ScreenService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3ScreenService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3ScreenService);
 public
 // realized methods
   function IC: Il3InfoCanvas;
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
   property Alien: Il3ScreenService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3ScreenService }
 public
 // singleton factory method
   class function Instance: Tl3ScreenService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3ScreenService

implementation

uses
  l3Base {a}
  ;


// start class Tl3ScreenService

var g_Tl3ScreenService : Tl3ScreenService = nil;

procedure Tl3ScreenServiceFree;
begin
 l3Free(g_Tl3ScreenService);
end;

class function Tl3ScreenService.Instance: Tl3ScreenService;
begin
 if (g_Tl3ScreenService = nil) then
 begin
  l3System.AddExitProc(Tl3ScreenServiceFree);
  g_Tl3ScreenService := Create;
 end;
 Result := g_Tl3ScreenService;
end;


procedure Tl3ScreenService.pm_SetAlien(const aValue: Il3ScreenService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3ScreenService.pm_SetAlien

class function Tl3ScreenService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3ScreenService <> nil;
end;//Tl3ScreenService.Exists

function Tl3ScreenService.IC: Il3InfoCanvas;
//#UC START# *88066E5D0414_556EE57803CD_var*
//#UC END# *88066E5D0414_556EE57803CD_var*
begin
//#UC START# *88066E5D0414_556EE57803CD_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.IC
 else
  Result := nil; 
//#UC END# *88066E5D0414_556EE57803CD_impl*
end;//Tl3ScreenService.IC

procedure Tl3ScreenService.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3ScreenService.ClearFields

end.