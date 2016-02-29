unit l3TabService;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3$AFW"
// Модуль: "w:/common/components/rtl/Garant/L3/l3TabService.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Service::Class>> Shared Delphi Low Level::L3$AFW::AFWServices::Tl3TabService
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

(*
 Ml3TabService = PureMixIn
  {* Контракт сервиса Tl3TabService }
   function HasTabs: Boolean;
 end;//Ml3TabService
*)

type
 Il3TabService = interface(IUnknown)
  {* Интерфейс сервиса Tl3TabService }
   ['{D4A2A5A2-FB9C-4ECA-B050-7914DC032822}']
  // Ml3TabService
   function HasTabs: Boolean;
 end;//Il3TabService

 Tl3TabService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3TabService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3TabService);
 public
 // realized methods
   function HasTabs: Boolean;
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
   property Alien: Il3TabService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3TabService }
 public
 // singleton factory method
   class function Instance: Tl3TabService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3TabService

implementation

uses
  l3Base {a}
  ;


// start class Tl3TabService

var g_Tl3TabService : Tl3TabService = nil;

procedure Tl3TabServiceFree;
begin
 l3Free(g_Tl3TabService);
end;

class function Tl3TabService.Instance: Tl3TabService;
begin
 if (g_Tl3TabService = nil) then
 begin
  l3System.AddExitProc(Tl3TabServiceFree);
  g_Tl3TabService := Create;
 end;
 Result := g_Tl3TabService;
end;


procedure Tl3TabService.pm_SetAlien(const aValue: Il3TabService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3TabService.pm_SetAlien

class function Tl3TabService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3TabService <> nil;
end;//Tl3TabService.Exists

function Tl3TabService.HasTabs: Boolean;
//#UC START# *A8AF111E1F35_550AE937003B_var*
//#UC END# *A8AF111E1F35_550AE937003B_var*
begin
//#UC START# *A8AF111E1F35_550AE937003B_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.HasTabs
 else
  Result := false;
//#UC END# *A8AF111E1F35_550AE937003B_impl*
end;//Tl3TabService.HasTabs

procedure Tl3TabService.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3TabService.ClearFields

end.