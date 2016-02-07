unit l3FormsService;
 
{$Include ..\L3\l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  Classes,
  Forms,
  l3ProtoObject
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
type
 TCustomForm = Forms.TCustomForm;

(*
 Ml3FormsService = PureMixIn
  {* Контракт сервиса Tl3FormsService }
   function GetParentForm(Component: TPersistent): TCustomForm;
   function GetAnotherParentForm(Component: TPersistent): TCustomForm;
   function GetTopParentForm(Component: TPersistent): TCustomForm;
   function GetMainForm(Component: TPersistent): TCustomForm;
 end;//Ml3FormsService
*)

 Il3FormsService = interface(IUnknown)
  {* Интерфейс сервиса Tl3FormsService }
   ['{69FEDDF5-3C91-4527-B7FA-B2965BA459E9}']
  // Ml3FormsService
   function GetParentForm(Component: TPersistent): TCustomForm;
   function GetAnotherParentForm(Component: TPersistent): TCustomForm;
   function GetTopParentForm(Component: TPersistent): TCustomForm;
   function GetMainForm(Component: TPersistent): TCustomForm;
 end;//Il3FormsService

 Tl3FormsService = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3FormsService;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3FormsService);
 public
 // realized methods
   function GetAnotherParentForm(Component: TPersistent): TCustomForm;
   function GetMainForm(Component: TPersistent): TCustomForm;
   function GetParentForm(Component: TPersistent): TCustomForm;
   function GetTopParentForm(Component: TPersistent): TCustomForm;
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
   property Alien: Il3FormsService
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3FormsService }
 public
 // singleton factory method
   class function Instance: Tl3FormsService;
    {- возвращает экземпляр синглетона. }
 end;//Tl3FormsService
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3FormsService

var g_Tl3FormsService : Tl3FormsService = nil;

procedure Tl3FormsServiceFree;
begin
 l3Free(g_Tl3FormsService);
end;

class function Tl3FormsService.Instance: Tl3FormsService;
begin
 if (g_Tl3FormsService = nil) then
 begin
  l3System.AddExitProc(Tl3FormsServiceFree);
  g_Tl3FormsService := Create;
 end;
 Result := g_Tl3FormsService;
end;


procedure Tl3FormsService.pm_SetAlien(const aValue: Il3FormsService);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3FormsService.pm_SetAlien

class function Tl3FormsService.Exists: Boolean;
 {-}
begin
 Result := g_Tl3FormsService <> nil;
end;//Tl3FormsService.Exists

function Tl3FormsService.GetAnotherParentForm(Component: TPersistent): TCustomForm;
//#UC START# *1077E9580F6F_5506D56601D6_var*
//#UC END# *1077E9580F6F_5506D56601D6_var*
begin
//#UC START# *1077E9580F6F_5506D56601D6_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.GetAnotherParentForm(Component)
 else
 begin
  Result := nil;
  Assert(false, 'Сервис не реализован');
 end;//f_Alien <> nil
//#UC END# *1077E9580F6F_5506D56601D6_impl*
end;//Tl3FormsService.GetAnotherParentForm

function Tl3FormsService.GetMainForm(Component: TPersistent): TCustomForm;
//#UC START# *207716257CFB_5506D56601D6_var*
//#UC END# *207716257CFB_5506D56601D6_var*
begin
//#UC START# *207716257CFB_5506D56601D6_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.GetMainForm(Component)
 else
 begin
  Result := nil;
  Assert(false, 'Сервис не реализован');
 end;//f_Alien <> nil
//#UC END# *207716257CFB_5506D56601D6_impl*
end;//Tl3FormsService.GetMainForm

function Tl3FormsService.GetParentForm(Component: TPersistent): TCustomForm;
//#UC START# *32D6965B86E7_5506D56601D6_var*
//#UC END# *32D6965B86E7_5506D56601D6_var*
begin
//#UC START# *32D6965B86E7_5506D56601D6_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.GetParentForm(Component)
 else
 begin
  Result := nil;
  Assert(false, 'Сервис не реализован');
 end;//f_Alien <> nil
//#UC END# *32D6965B86E7_5506D56601D6_impl*
end;//Tl3FormsService.GetParentForm

function Tl3FormsService.GetTopParentForm(Component: TPersistent): TCustomForm;
//#UC START# *D9663D6CD433_5506D56601D6_var*
//#UC END# *D9663D6CD433_5506D56601D6_var*
begin
//#UC START# *D9663D6CD433_5506D56601D6_impl*
 if (f_Alien <> nil) then
  Result := f_Alien.GetTopParentForm(Component)
 else
 begin
  Result := nil;
  Assert(false, 'Сервис не реализован');
 end;//f_Alien <> nil
//#UC END# *D9663D6CD433_5506D56601D6_impl*
end;//Tl3FormsService.GetTopParentForm

procedure Tl3FormsService.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3FormsService.ClearFields

{$IfEnd} //not NoVCL

end.