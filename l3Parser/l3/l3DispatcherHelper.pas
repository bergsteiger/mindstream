unit l3DispatcherHelper;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

(*
 Ml3DispatcherHelper = PureMixIn
  {* Контракт сервиса Tl3DispatcherHelper }
   procedure ClearHistory;
 end;//Ml3DispatcherHelper
*)

type
 Il3DispatcherHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3DispatcherHelper }
   ['{BF29E5DD-DC50-4752-800C-CA9E91242A15}']
  // Ml3DispatcherHelper
   procedure ClearHistory;
 end;//Il3DispatcherHelper

 Tl3DispatcherHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3DispatcherHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3DispatcherHelper);
 public
 // realized methods
   procedure ClearHistory;
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
   property Alien: Il3DispatcherHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3DispatcherHelper }
 public
 // singleton factory method
   class function Instance: Tl3DispatcherHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3DispatcherHelper

implementation

uses
  l3Base {a}
  ;


// start class Tl3DispatcherHelper

var g_Tl3DispatcherHelper : Tl3DispatcherHelper = nil;

procedure Tl3DispatcherHelperFree;
begin
 l3Free(g_Tl3DispatcherHelper);
end;

class function Tl3DispatcherHelper.Instance: Tl3DispatcherHelper;
begin
 if (g_Tl3DispatcherHelper = nil) then
 begin
  l3System.AddExitProc(Tl3DispatcherHelperFree);
  g_Tl3DispatcherHelper := Create;
 end;
 Result := g_Tl3DispatcherHelper;
end;


procedure Tl3DispatcherHelper.pm_SetAlien(const aValue: Il3DispatcherHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3DispatcherHelper.pm_SetAlien

class function Tl3DispatcherHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3DispatcherHelper <> nil;
end;//Tl3DispatcherHelper.Exists

procedure Tl3DispatcherHelper.ClearHistory;
//#UC START# *CA1F3F463873_5501A3AE02AA_var*
//#UC END# *CA1F3F463873_5501A3AE02AA_var*
begin
//#UC START# *CA1F3F463873_5501A3AE02AA_impl*
 if (f_Alien <> nil) then
  f_Alien.ClearHistory;
//#UC END# *CA1F3F463873_5501A3AE02AA_impl*
end;//Tl3DispatcherHelper.ClearHistory

procedure Tl3DispatcherHelper.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3DispatcherHelper.ClearFields

end.