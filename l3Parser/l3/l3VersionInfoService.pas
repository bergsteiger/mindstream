unit l3VersionInfoService;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

(*
 Ml3VersionInfoService = PureMixIn
  {* Контракт сервиса Tl3VersionInfoService }
   function VersionInfo: AnsiString;
 end;//Ml3VersionInfoService
*)

type
 Il3VersionInfoService = interface(IUnknown)
  {* Интерфейс сервиса Tl3VersionInfoService }
   ['{FC342D5B-DACB-416A-AC66-742EECFB5B6A}']
  // Ml3VersionInfoService
   function VersionInfo: AnsiString;
 end;//Il3VersionInfoService

 Tl3VersionInfoService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3VersionInfoService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3VersionInfoService);
 public
 // realized methods
   function VersionInfo: AnsiString;
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
   property Alien: Il3VersionInfoService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3VersionInfoService }
 public
 // singleton factory method
   class function Instance: Tl3VersionInfoService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3VersionInfoService

implementation

uses
  l3Base {a},
  vtVerInf,
  SysUtils
  ;


// start class Tl3VersionInfoService

var g_Tl3VersionInfoService : Tl3VersionInfoService = nil;

procedure Tl3VersionInfoServiceFree;
begin
 l3Free(g_Tl3VersionInfoService);
end;

class function Tl3VersionInfoService.Instance: Tl3VersionInfoService;
begin
 if (g_Tl3VersionInfoService = nil) then
 begin
  l3System.AddExitProc(Tl3VersionInfoServiceFree);
  g_Tl3VersionInfoService := Create;
 end;
 Result := g_Tl3VersionInfoService;
end;


procedure Tl3VersionInfoService.pm_SetAlien(const aValue: Il3VersionInfoService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3VersionInfoService.pm_SetAlien

class function Tl3VersionInfoService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3VersionInfoService <> nil;
end;//Tl3VersionInfoService.Exists

function Tl3VersionInfoService.VersionInfo: AnsiString;
//#UC START# *30F5EA5AF6DF_55DDCF7C004A_var*
//#UC END# *30F5EA5AF6DF_55DDCF7C004A_var*
begin
//#UC START# *30F5EA5AF6DF_55DDCF7C004A_impl*
 Result := '';
 if (f_Alien <> nil) then
  Result := f_Alien.VersionInfo;
 if (Result = '') then
 begin
  with TVersionInfo.Create do
  try
   if (FixedFileInfo <> nil) then
    with FileLongVersion do
    begin
     Result := (Format('%d.%d.%d.%d', [All[2], All[1], All[4], All[3]]));
    end;//with FileLongVersion
  finally
   Free;
  end;//try..finally
 end;//Result = ''
//#UC END# *30F5EA5AF6DF_55DDCF7C004A_impl*
end;//Tl3VersionInfoService.VersionInfo

procedure Tl3VersionInfoService.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3VersionInfoService.ClearFields

end.