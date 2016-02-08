unit l3GetComponentFromPointHelper;
 
{$Include l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  Types,
  Classes,
  Controls,
  l3ProtoObject
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
(*
 Ml3GetComponentFromPointHelper = PureMixIn
  {* Контракт сервиса Tl3GetComponentFromPointHelper }
   procedure GetComponent(const aPoint: TPoint;
    out aComponent: TComponent;
    out aBindedControl: TControl);
     {* aBindedControl - если найденный компонент - контрол, то равен этому контролу, если нет, то его родитель }
 end;//Ml3GetComponentFromPointHelper
*)

type
 Il3GetComponentFromPointHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3GetComponentFromPointHelper }
   ['{8A45EBEB-1919-4ED9-AE29-39A44F9B3F6E}']
  // Ml3GetComponentFromPointHelper
   procedure GetComponent(const aPoint: TPoint;
    out aComponent: TComponent;
    out aBindedControl: TControl);
     {* aBindedControl - если найденный компонент - контрол, то равен этому контролу, если нет, то его родитель }
 end;//Il3GetComponentFromPointHelper

 Tl3GetComponentFromPointHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3GetComponentFromPointHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3GetComponentFromPointHelper);
 public
 // realized methods
   procedure GetComponent(const aPoint: TPoint;
     out aComponent: TComponent;
     out aBindedControl: TControl);
     {* aBindedControl - если найденный компонент - контрол, то равен этому контролу, если нет, то его родитель }
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
   property Alien: Il3GetComponentFromPointHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3GetComponentFromPointHelper }
 public
 // singleton factory method
   class function Instance: Tl3GetComponentFromPointHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3GetComponentFromPointHelper
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3GetComponentFromPointHelper

var g_Tl3GetComponentFromPointHelper : Tl3GetComponentFromPointHelper = nil;

procedure Tl3GetComponentFromPointHelperFree;
begin
 l3Free(g_Tl3GetComponentFromPointHelper);
end;

class function Tl3GetComponentFromPointHelper.Instance: Tl3GetComponentFromPointHelper;
begin
 if (g_Tl3GetComponentFromPointHelper = nil) then
 begin
  l3System.AddExitProc(Tl3GetComponentFromPointHelperFree);
  g_Tl3GetComponentFromPointHelper := Create;
 end;
 Result := g_Tl3GetComponentFromPointHelper;
end;


procedure Tl3GetComponentFromPointHelper.pm_SetAlien(const aValue: Il3GetComponentFromPointHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3GetComponentFromPointHelper.pm_SetAlien

class function Tl3GetComponentFromPointHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3GetComponentFromPointHelper <> nil;
end;//Tl3GetComponentFromPointHelper.Exists

procedure Tl3GetComponentFromPointHelper.GetComponent(const aPoint: TPoint;
  out aComponent: TComponent;
  out aBindedControl: TControl);
//#UC START# *77F02E022F3C_551AB8CA014A_var*
//#UC END# *77F02E022F3C_551AB8CA014A_var*
begin
//#UC START# *77F02E022F3C_551AB8CA014A_impl*
 if Assigned(f_Alien) then
  f_Alien.GetComponent(aPoint, aComponent, aBindedControl)
 else
 begin
  aComponent := nil;
  aBindedControl := nil;
 end;
 if not Assigned(aComponent) then
 begin
  aBindedControl := FindDragTarget(aPoint, True);
  aComponent := aBindedControl;
 end;
//#UC END# *77F02E022F3C_551AB8CA014A_impl*
end;//Tl3GetComponentFromPointHelper.GetComponent

procedure Tl3GetComponentFromPointHelper.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3GetComponentFromPointHelper.ClearFields

{$IfEnd} //not NoVCL

end.