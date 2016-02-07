unit l3MenuManagerHelper;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

(*
 Ml3MenuManagerHelper = PureMixIn
  {* Контракт сервиса Tl3MenuManagerHelper }
   function CreateManager: Boolean;
   procedure FreeManager;
 end;//Ml3MenuManagerHelper
*)

type
 Il3MenuManagerHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3MenuManagerHelper }
   ['{ECC961D9-9F47-4CCE-87B8-CBDE8D5ABCDA}']
  // Ml3MenuManagerHelper
   function CreateManager: Boolean;
   procedure FreeManager;
 end;//Il3MenuManagerHelper

 Tl3MenuManagerHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3MenuManagerHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3MenuManagerHelper);
 public
 // realized methods
   function CreateManager: Boolean;
   procedure FreeManager;
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
   property Alien: Il3MenuManagerHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3MenuManagerHelper }
 public
 // singleton factory method
   class function Instance: Tl3MenuManagerHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3MenuManagerHelper

implementation

uses
  l3Base {a}
  ;


// start class Tl3MenuManagerHelper

var g_Tl3MenuManagerHelper : Tl3MenuManagerHelper = nil;

procedure Tl3MenuManagerHelperFree;
begin
 l3Free(g_Tl3MenuManagerHelper);
end;

class function Tl3MenuManagerHelper.Instance: Tl3MenuManagerHelper;
begin
 if (g_Tl3MenuManagerHelper = nil) then
 begin
  l3System.AddExitProc(Tl3MenuManagerHelperFree);
  g_Tl3MenuManagerHelper := Create;
 end;
 Result := g_Tl3MenuManagerHelper;
end;


procedure Tl3MenuManagerHelper.pm_SetAlien(const aValue: Il3MenuManagerHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3MenuManagerHelper.pm_SetAlien

class function Tl3MenuManagerHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3MenuManagerHelper <> nil;
end;//Tl3MenuManagerHelper.Exists

function Tl3MenuManagerHelper.CreateManager: Boolean;
//#UC START# *9CBAC5378D28_550199070251_var*
//#UC END# *9CBAC5378D28_550199070251_var*
begin
//#UC START# *9CBAC5378D28_550199070251_impl*
if (f_Alien <> nil) then
  Result := f_Alien.CreateManager
 else
  Result := false; 
//#UC END# *9CBAC5378D28_550199070251_impl*
end;//Tl3MenuManagerHelper.CreateManager

procedure Tl3MenuManagerHelper.FreeManager;
//#UC START# *FFCD4B7E45D8_550199070251_var*
//#UC END# *FFCD4B7E45D8_550199070251_var*
begin
//#UC START# *FFCD4B7E45D8_550199070251_impl*
 if (f_Alien <> nil) then
  f_Alien.FreeManager;
//#UC END# *FFCD4B7E45D8_550199070251_impl*
end;//Tl3MenuManagerHelper.FreeManager

procedure Tl3MenuManagerHelper.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3MenuManagerHelper.ClearFields

end.