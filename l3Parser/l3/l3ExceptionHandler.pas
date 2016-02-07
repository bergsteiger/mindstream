unit l3ExceptionHandler;

 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

(*
 Ml3ExceptionHandler = PureMixIn
  {* Контракт сервиса Tl3ExceptionHandler }
   procedure HandleException(Sender: TObject);
 end;//Ml3ExceptionHandler
*)

type
 Il3ExceptionHandler = interface(IUnknown)
  {* Интерфейс сервиса Tl3ExceptionHandler }
   ['{85F70758-7234-4849-BCCC-261AAAA9117F}']
  // Ml3ExceptionHandler
   procedure HandleException(Sender: TObject);
 end;//Il3ExceptionHandler

 Tl3ExceptionHandler = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3ExceptionHandler;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3ExceptionHandler);
 public
 // realized methods
   procedure HandleException(Sender: TObject);
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
   property Alien: Il3ExceptionHandler
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3ExceptionHandler }
 public
 // singleton factory method
   class function Instance: Tl3ExceptionHandler;
    {- возвращает экземпляр синглетона. }
 end;//Tl3ExceptionHandler

implementation

uses
  l3Base {a}
  ;


// start class Tl3ExceptionHandler

var g_Tl3ExceptionHandler : Tl3ExceptionHandler = nil;

procedure Tl3ExceptionHandlerFree;
begin
 l3Free(g_Tl3ExceptionHandler);
end;

class function Tl3ExceptionHandler.Instance: Tl3ExceptionHandler;
begin
 if (g_Tl3ExceptionHandler = nil) then
 begin
  l3System.AddExitProc(Tl3ExceptionHandlerFree);
  g_Tl3ExceptionHandler := Create;
 end;
 Result := g_Tl3ExceptionHandler;
end;


procedure Tl3ExceptionHandler.pm_SetAlien(const aValue: Il3ExceptionHandler);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3ExceptionHandler.pm_SetAlien

class function Tl3ExceptionHandler.Exists: Boolean;
 {-}
begin
 Result := g_Tl3ExceptionHandler <> nil;
end;//Tl3ExceptionHandler.Exists

procedure Tl3ExceptionHandler.HandleException(Sender: TObject);
//#UC START# *9B9F43B530B0_5589239300B6_var*
//#UC END# *9B9F43B530B0_5589239300B6_var*
begin
//#UC START# *9B9F43B530B0_5589239300B6_impl*
 if Assigned(f_Alien) then
  f_Alien.HandleException(Sender);
//#UC END# *9B9F43B530B0_5589239300B6_impl*
end;//Tl3ExceptionHandler.HandleException

procedure Tl3ExceptionHandler.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3ExceptionHandler.ClearFields

end.