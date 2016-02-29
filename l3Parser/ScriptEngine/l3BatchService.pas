unit l3BatchService;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3$AFW"
// Модуль: "w:/common/components/rtl/Garant/L3/l3BatchService.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Service::Class>> Shared Delphi Low Level::L3$AFW::BatchServices::Tl3BatchService
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
  {$If not defined(NoScripts)}
  ,
  l3ScriptService
  {$IfEnd} //not NoScripts
  ,
  l3ModalService
  ;

type
 Tl3BatchScriptService = {final} class(Tl3ProtoObject {$If not defined(NoScripts)}, Il3ScriptService{$IfEnd} //not NoScripts
 )
 public
 // realized methods
   {$If not defined(NoScripts)}
   procedure EnterScript;
   {$IfEnd} //not NoScripts
   {$If not defined(NoScripts)}
   procedure LeaveScript;
   {$IfEnd} //not NoScripts
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: Tl3BatchScriptService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3BatchScriptService

(*
 Ml3BatchService = PureMixIn
  {* Контракт сервиса Tl3BatchService }
   function IsBatchMode: Boolean;
   procedure EnterBatchMode;
   procedure LeaveBatchMode;
   procedure PushAnswer(aValue: Integer);
   function PopAnswer: Integer;
   procedure SignalWasDialog;
   function CheckWasDialog: Boolean;
   procedure ClearAnswers;
 end;//Ml3BatchService
*)

 Il3BatchService = interface(IUnknown)
  {* Интерфейс сервиса Tl3BatchService }
   ['{F011DB29-11CB-4024-B2FC-89B3245D418D}']
  // Ml3BatchService
   function IsBatchMode: Boolean;
   procedure EnterBatchMode;
   procedure LeaveBatchMode;
   procedure PushAnswer(aValue: Integer);
   function PopAnswer: Integer;
   procedure SignalWasDialog;
   function CheckWasDialog: Boolean;
   procedure ClearAnswers;
 end;//Il3BatchService

 Tl3BatchService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3BatchService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3BatchService);
 public
 // realized methods
   procedure PushAnswer(aValue: Integer);
   function CheckWasDialog: Boolean;
   procedure SignalWasDialog;
   procedure ClearAnswers;
   procedure EnterBatchMode;
   function HasModalWorker: Boolean;
   function ExecuteCurrentModalWorker(aModalExecute: TseModalExecute = se_meUsual): Boolean;
   function IsBatchMode: Boolean;
   function PopAnswer: Integer;
   procedure LeaveBatchMode;
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
   property Alien: Il3BatchService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3BatchService }
 public
 // singleton factory method
   class function Instance: Tl3BatchService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3BatchService

implementation

uses
  l3Base {a}
  {$If not defined(NoScripts)}
  ,
  afwAnswer
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  
  ;


// start class Tl3BatchService

var g_Tl3BatchService : Tl3BatchService = nil;

procedure Tl3BatchServiceFree;
begin
 l3Free(g_Tl3BatchService);
end;

class function Tl3BatchService.Instance: Tl3BatchService;
begin
 if (g_Tl3BatchService = nil) then
 begin
  l3System.AddExitProc(Tl3BatchServiceFree);
  g_Tl3BatchService := Create;
 end;
 Result := g_Tl3BatchService;
end;


// start class Tl3BatchScriptService

var g_Tl3BatchScriptService : Tl3BatchScriptService = nil;

procedure Tl3BatchScriptServiceFree;
begin
 l3Free(g_Tl3BatchScriptService);
end;

class function Tl3BatchScriptService.Instance: Tl3BatchScriptService;
begin
 if (g_Tl3BatchScriptService = nil) then
 begin
  l3System.AddExitProc(Tl3BatchScriptServiceFree);
  g_Tl3BatchScriptService := Create;
 end;
 Result := g_Tl3BatchScriptService;
end;


class function Tl3BatchScriptService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3BatchScriptService <> nil;
end;//Tl3BatchScriptService.Exists

{$If not defined(NoScripts)}
procedure Tl3BatchScriptService.EnterScript;
//#UC START# *97F121633B1B_5509AAAC0313_var*
//#UC END# *97F121633B1B_5509AAAC0313_var*
begin
//#UC START# *97F121633B1B_5509AAAC0313_impl*
 Tl3BatchService.Instance.EnterBatchMode;
//#UC END# *97F121633B1B_5509AAAC0313_impl*
end;//Tl3BatchScriptService.EnterScript
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
procedure Tl3BatchScriptService.LeaveScript;
//#UC START# *BA3808340B4E_5509AAAC0313_var*
//#UC END# *BA3808340B4E_5509AAAC0313_var*
begin
//#UC START# *BA3808340B4E_5509AAAC0313_impl*
 Tl3BatchService.Instance.LeaveBatchMode;
//#UC END# *BA3808340B4E_5509AAAC0313_impl*
end;//Tl3BatchScriptService.LeaveScript
{$IfEnd} //not NoScripts

procedure Tl3BatchService.pm_SetAlien(const aValue: Il3BatchService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3BatchService.pm_SetAlien

class function Tl3BatchService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3BatchService <> nil;
end;//Tl3BatchService.Exists

procedure Tl3BatchService.PushAnswer(aValue: Integer);
//#UC START# *194C97B8A2DF_5507FDD203E1_var*
//#UC END# *194C97B8A2DF_5507FDD203E1_var*
begin
//#UC START# *194C97B8A2DF_5507FDD203E1_impl*
 if (f_Alien <> nil) then
  f_Alien.PushAnswer(aValue);
//#UC END# *194C97B8A2DF_5507FDD203E1_impl*
end;//Tl3BatchService.PushAnswer

function Tl3BatchService.CheckWasDialog: Boolean;
//#UC START# *217998C234EE_5507FDD203E1_var*
//#UC END# *217998C234EE_5507FDD203E1_var*
begin
//#UC START# *217998C234EE_5507FDD203E1_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.CheckWasDialog
 else
  Result := false; 
//#UC END# *217998C234EE_5507FDD203E1_impl*
end;//Tl3BatchService.CheckWasDialog

procedure Tl3BatchService.SignalWasDialog;
//#UC START# *23858A465AF6_5507FDD203E1_var*
//#UC END# *23858A465AF6_5507FDD203E1_var*
begin
//#UC START# *23858A465AF6_5507FDD203E1_impl*
 if (f_Alien <> nil) then
  f_Alien.SignalWasDialog;
//#UC END# *23858A465AF6_5507FDD203E1_impl*
end;//Tl3BatchService.SignalWasDialog

procedure Tl3BatchService.ClearAnswers;
//#UC START# *37CC2CF2A1FF_5507FDD203E1_var*
//#UC END# *37CC2CF2A1FF_5507FDD203E1_var*
begin
//#UC START# *37CC2CF2A1FF_5507FDD203E1_impl*
 if (f_Alien <> nil) then
  f_Alien.ClearAnswers;
//#UC END# *37CC2CF2A1FF_5507FDD203E1_impl*
end;//Tl3BatchService.ClearAnswers

procedure Tl3BatchService.EnterBatchMode;
//#UC START# *3E2DB431FD1A_5507FDD203E1_var*
//#UC END# *3E2DB431FD1A_5507FDD203E1_var*
begin
//#UC START# *3E2DB431FD1A_5507FDD203E1_impl*
 if (f_Alien <> nil) then
  f_Alien.EnterBatchMode;
//#UC END# *3E2DB431FD1A_5507FDD203E1_impl*
end;//Tl3BatchService.EnterBatchMode

function Tl3BatchService.HasModalWorker: Boolean;
//#UC START# *553F7345032E_5507FDD203E1_var*
//#UC END# *553F7345032E_5507FDD203E1_var*
begin
//#UC START# *553F7345032E_5507FDD203E1_impl*
 Result := Tl3ModalService.Instance.HasModalWorker;
//#UC END# *553F7345032E_5507FDD203E1_impl*
end;//Tl3BatchService.HasModalWorker

function Tl3BatchService.ExecuteCurrentModalWorker(aModalExecute: TseModalExecute = se_meUsual): Boolean;
//#UC START# *553F8EA30300_5507FDD203E1_var*
//#UC END# *553F8EA30300_5507FDD203E1_var*
begin
//#UC START# *553F8EA30300_5507FDD203E1_impl*
 Result := Tl3ModalService.Instance.ExecuteCurrentModalWorker(aModalExecute);
//#UC END# *553F8EA30300_5507FDD203E1_impl*
end;//Tl3BatchService.ExecuteCurrentModalWorker

function Tl3BatchService.IsBatchMode: Boolean;
//#UC START# *8A081B195E08_5507FDD203E1_var*
//#UC END# *8A081B195E08_5507FDD203E1_var*
begin
//#UC START# *8A081B195E08_5507FDD203E1_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.IsBatchMode
 else
  Result := false; 
//#UC END# *8A081B195E08_5507FDD203E1_impl*
end;//Tl3BatchService.IsBatchMode

function Tl3BatchService.PopAnswer: Integer;
//#UC START# *FE26372CAD8B_5507FDD203E1_var*
//#UC END# *FE26372CAD8B_5507FDD203E1_var*
begin
//#UC START# *FE26372CAD8B_5507FDD203E1_impl*
 {$IfNDef NoVCL}
 if (f_Alien <> nil) then
  Result := f_Alien.PopAnswer
 else
  Result := mrNone;
 {$Else  NoVCL}
 Assert(false);
 {$EndIf NoVCL}
//#UC END# *FE26372CAD8B_5507FDD203E1_impl*
end;//Tl3BatchService.PopAnswer

procedure Tl3BatchService.LeaveBatchMode;
//#UC START# *FE46A80B1DA3_5507FDD203E1_var*
//#UC END# *FE46A80B1DA3_5507FDD203E1_var*
begin
//#UC START# *FE46A80B1DA3_5507FDD203E1_impl*
 if (f_Alien <> nil) then
  f_Alien.LeaveBatchMode;
//#UC END# *FE46A80B1DA3_5507FDD203E1_impl*
end;//Tl3BatchService.LeaveBatchMode

procedure Tl3BatchService.ClearFields;
 {-}
begin
 Alien := nil;
 inherited;
end;//Tl3BatchService.ClearFields

initialization
// Регистрация Tl3BatchScriptService
 {$If not defined(NoScripts)}
 Tl3ScriptService.Instance.Alien := Tl3BatchScriptService.Instance;
 {$IfEnd} //not NoScripts


end.