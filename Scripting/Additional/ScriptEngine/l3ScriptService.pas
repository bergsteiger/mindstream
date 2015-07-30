unit l3ScriptService;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "l3ScriptService.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Service::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptEngineCore::Tl3ScriptService
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3ProtoObject
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
(*
 Ml3ScriptService = PureMixIn
  {* Контракт сервиса Tl3ScriptService }
   procedure EnterScript;
   procedure LeaveScript;
 end;//Ml3ScriptService
*)

type
 Il3ScriptService = interface(IUnknown)
  {* Интерфейс сервиса Tl3ScriptService }
   ['{79BCFA6B-F105-4BC6-93DB-DE19B787DEE3}']
  // Ml3ScriptService
   procedure EnterScript;
   procedure LeaveScript;
 end;//Il3ScriptService

 Tl3ScriptService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3ScriptService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3ScriptService);
 public
 // realized methods
   procedure EnterScript;
   procedure LeaveScript;
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
   property Alien: Il3ScriptService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3ScriptService }
 public
 // singleton factory method
   class function Instance: Tl3ScriptService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3ScriptService
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class Tl3ScriptService

var g_Tl3ScriptService : Tl3ScriptService = nil;

procedure Tl3ScriptServiceFree;
begin
 l3Free(g_Tl3ScriptService);
end;

class function Tl3ScriptService.Instance: Tl3ScriptService;
begin
 if (g_Tl3ScriptService = nil) then
 begin
  l3System.AddExitProc(Tl3ScriptServiceFree);
  g_Tl3ScriptService := Create;
 end;
 Result := g_Tl3ScriptService;
end;


procedure Tl3ScriptService.pm_SetAlien(const aValue: Il3ScriptService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3ScriptService.pm_SetAlien

class function Tl3ScriptService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3ScriptService <> nil;
end;//Tl3ScriptService.Exists

procedure Tl3ScriptService.EnterScript;
//#UC START# *97F121633B1B_5509AA5400EA_var*
//#UC END# *97F121633B1B_5509AA5400EA_var*
begin
//#UC START# *97F121633B1B_5509AA5400EA_impl*
 if (f_Alien <> nil) then
  f_Alien.EnterScript;
//#UC END# *97F121633B1B_5509AA5400EA_impl*
end;//Tl3ScriptService.EnterScript

procedure Tl3ScriptService.LeaveScript;
//#UC START# *BA3808340B4E_5509AA5400EA_var*
//#UC END# *BA3808340B4E_5509AA5400EA_var*
begin
//#UC START# *BA3808340B4E_5509AA5400EA_impl*
 if (f_Alien <> nil) then
  f_Alien.LeaveScript;
//#UC END# *BA3808340B4E_5509AA5400EA_impl*
end;//Tl3ScriptService.LeaveScript

procedure Tl3ScriptService.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 Alien := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//Tl3ScriptService.ClearFields

{$IfEnd} //not NoScripts

end.