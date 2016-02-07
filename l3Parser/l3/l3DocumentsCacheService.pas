unit l3DocumentsCacheService;

 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

(*
 Ml3DocumentsCacheService = PureMixIn
  {* Контракт сервиса Tl3DocumentsCacheService }
   procedure Clear;
 end;//Ml3DocumentsCacheService
*)

type
 Il3DocumentsCacheService = interface(IUnknown)
  {* Интерфейс сервиса Tl3DocumentsCacheService }
   ['{A7573672-88C4-4CF0-8F63-F2AD42FA8794}']
  // Ml3DocumentsCacheService
   procedure Clear;
 end;//Il3DocumentsCacheService

 Tl3DocumentsCacheService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3DocumentsCacheService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3DocumentsCacheService);
 public
 // realized methods
   procedure Clear;
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
   property Alien: Il3DocumentsCacheService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3DocumentsCacheService }
 public
 // singleton factory method
   class function Instance: Tl3DocumentsCacheService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3DocumentsCacheService

implementation

uses
  l3Base {a}
  ;


// start class Tl3DocumentsCacheService

var g_Tl3DocumentsCacheService : Tl3DocumentsCacheService = nil;

procedure Tl3DocumentsCacheServiceFree;
begin
 l3Free(g_Tl3DocumentsCacheService);
end;

class function Tl3DocumentsCacheService.Instance: Tl3DocumentsCacheService;
begin
 if (g_Tl3DocumentsCacheService = nil) then
 begin
  l3System.AddExitProc(Tl3DocumentsCacheServiceFree);
  g_Tl3DocumentsCacheService := Create;
 end;
 Result := g_Tl3DocumentsCacheService;
end;


procedure Tl3DocumentsCacheService.pm_SetAlien(const aValue: Il3DocumentsCacheService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3DocumentsCacheService.pm_SetAlien

class function Tl3DocumentsCacheService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3DocumentsCacheService <> nil;
end;//Tl3DocumentsCacheService.Exists

procedure Tl3DocumentsCacheService.Clear;
//#UC START# *0AC8DEBDD602_5506FEA6012A_var*
//#UC END# *0AC8DEBDD602_5506FEA6012A_var*
begin
//#UC START# *0AC8DEBDD602_5506FEA6012A_impl*
 if (f_Alien <> nil) then
  f_Alien.Clear;
//#UC END# *0AC8DEBDD602_5506FEA6012A_impl*
end;//Tl3DocumentsCacheService.Clear

procedure Tl3DocumentsCacheService.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3DocumentsCacheService.ClearFields

end.