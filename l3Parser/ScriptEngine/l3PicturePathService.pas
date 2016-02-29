unit l3PicturePathService;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3$AFW"
// Модуль: "w:/common/components/rtl/Garant/L3/l3PicturePathService.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Service::Class>> Shared Delphi Low Level::L3$AFW::ScreenShots::Tl3PicturePathService
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
 Ml3PicturePathService = PureMixIn
  {* Контракт сервиса Tl3PicturePathService }
   procedure SetEnableSave(aValue: Boolean);
   procedure SetPDF4Etalon(aValue: Boolean);
   procedure AddPicturePath(const aPath: AnsiString);
   procedure SetTestName(const aName: AnsiString);
 end;//Ml3PicturePathService
*)

type
 Il3PicturePathService = interface(IUnknown)
  {* Интерфейс сервиса Tl3PicturePathService }
   ['{24FE9416-AB0D-4F8E-94A1-DCBC9F50CD65}']
  // Ml3PicturePathService
   procedure SetEnableSave(aValue: Boolean);
   procedure SetPDF4Etalon(aValue: Boolean);
   procedure AddPicturePath(const aPath: AnsiString);
   procedure SetTestName(const aName: AnsiString);
 end;//Il3PicturePathService

 Tl3PicturePathService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3PicturePathService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3PicturePathService);
 public
 // realized methods
   procedure SetTestName(const aName: AnsiString);
   procedure AddPicturePath(const aPath: AnsiString);
   procedure SetEnableSave(aValue: Boolean);
   procedure SetPDF4Etalon(aValue: Boolean);
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
   property Alien: Il3PicturePathService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3PicturePathService }
 public
 // singleton factory method
   class function Instance: Tl3PicturePathService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3PicturePathService

implementation

uses
  l3Base {a}
  {$If not defined(NoScripts)}
  ,
  PictureEtalonsWorkingPack
  {$IfEnd} //not NoScripts
  
  ;


// start class Tl3PicturePathService

var g_Tl3PicturePathService : Tl3PicturePathService = nil;

procedure Tl3PicturePathServiceFree;
begin
 l3Free(g_Tl3PicturePathService);
end;

class function Tl3PicturePathService.Instance: Tl3PicturePathService;
begin
 if (g_Tl3PicturePathService = nil) then
 begin
  l3System.AddExitProc(Tl3PicturePathServiceFree);
  g_Tl3PicturePathService := Create;
 end;
 Result := g_Tl3PicturePathService;
end;


procedure Tl3PicturePathService.pm_SetAlien(const aValue: Il3PicturePathService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3PicturePathService.pm_SetAlien

class function Tl3PicturePathService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3PicturePathService <> nil;
end;//Tl3PicturePathService.Exists

procedure Tl3PicturePathService.SetTestName(const aName: AnsiString);
//#UC START# *2DCD42915D2E_552406830331_var*
//#UC END# *2DCD42915D2E_552406830331_var*
begin
//#UC START# *2DCD42915D2E_552406830331_impl*
 if (f_Alien <> nil) then
  f_Alien.SetTestName(aName); 
//#UC END# *2DCD42915D2E_552406830331_impl*
end;//Tl3PicturePathService.SetTestName

procedure Tl3PicturePathService.AddPicturePath(const aPath: AnsiString);
//#UC START# *3FB12D269858_552406830331_var*
//#UC END# *3FB12D269858_552406830331_var*
begin
//#UC START# *3FB12D269858_552406830331_impl*
 if (f_Alien <> nil) then
  f_Alien.AddPicturePath(aPath); 
//#UC END# *3FB12D269858_552406830331_impl*
end;//Tl3PicturePathService.AddPicturePath

procedure Tl3PicturePathService.SetEnableSave(aValue: Boolean);
//#UC START# *4706AFD6D823_552406830331_var*
//#UC END# *4706AFD6D823_552406830331_var*
begin
//#UC START# *4706AFD6D823_552406830331_impl*
 if (f_Alien <> nil) then
  f_Alien.SetEnableSave(aValue); 
//#UC END# *4706AFD6D823_552406830331_impl*
end;//Tl3PicturePathService.SetEnableSave

procedure Tl3PicturePathService.SetPDF4Etalon(aValue: Boolean);
//#UC START# *86EACEE128F2_552406830331_var*
//#UC END# *86EACEE128F2_552406830331_var*
begin
//#UC START# *86EACEE128F2_552406830331_impl*
 if (f_Alien <> nil) then
  f_Alien.SetPDF4Etalon(aValue); 
//#UC END# *86EACEE128F2_552406830331_impl*
end;//Tl3PicturePathService.SetPDF4Etalon

procedure Tl3PicturePathService.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3PicturePathService.ClearFields

end.