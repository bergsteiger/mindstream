unit l3PopupMenuHelper;

 
{$Include l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  Types,
  Classes,
  Controls,
  Menus,
  l3ProtoObject
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
type
 Tl3PopupMenuHelperCallback = procedure (aMenu: TMenuItem) of object;

(*
 Ml3PopupMenuHelper = PureMixIn
  {* Контракт сервиса Tl3PopupMenuHelper }
   function GetPopupMenu(aControl: TComponent;
    const aPoint: TPoint): TMenuItem;
   procedure GetPopupMenuForComponentInfo(aControl: TComponent;
    const aPoint: TPoint;
    aCallback: Tl3PopupMenuHelperCallback);
 end;//Ml3PopupMenuHelper
*)

 Il3PopupMenuHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3PopupMenuHelper }
   ['{0FC02FC0-1297-4100-A3A7-8D342CAD75B2}']
  // Ml3PopupMenuHelper
   function GetPopupMenu(aControl: TComponent;
    const aPoint: TPoint): TMenuItem;
   procedure GetPopupMenuForComponentInfo(aControl: TComponent;
    const aPoint: TPoint;
    aCallback: Tl3PopupMenuHelperCallback);
 end;//Il3PopupMenuHelper

 Tl3PopupMenuHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3PopupMenuHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3PopupMenuHelper);
 public
 // realized methods
   function GetPopupMenu(aControl: TComponent;
     const aPoint: TPoint): TMenuItem;
   procedure GetPopupMenuForComponentInfo(aControl: TComponent;
     const aPoint: TPoint;
     aCallback: Tl3PopupMenuHelperCallback);
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
   property Alien: Il3PopupMenuHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3PopupMenuHelper }
 public
 // singleton factory method
   class function Instance: Tl3PopupMenuHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3PopupMenuHelper
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3PopupMenuHelper

var g_Tl3PopupMenuHelper : Tl3PopupMenuHelper = nil;

procedure Tl3PopupMenuHelperFree;
begin
 l3Free(g_Tl3PopupMenuHelper);
end;

class function Tl3PopupMenuHelper.Instance: Tl3PopupMenuHelper;
begin
 if (g_Tl3PopupMenuHelper = nil) then
 begin
  l3System.AddExitProc(Tl3PopupMenuHelperFree);
  g_Tl3PopupMenuHelper := Create;
 end;
 Result := g_Tl3PopupMenuHelper;
end;


type
  TControlFriend = {abstract} class(TControl)
   {* Друг для TControl }
  end;//TControlFriend

// start class Tl3PopupMenuHelper

procedure Tl3PopupMenuHelper.pm_SetAlien(const aValue: Il3PopupMenuHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3PopupMenuHelper.pm_SetAlien

class function Tl3PopupMenuHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3PopupMenuHelper <> nil;
end;//Tl3PopupMenuHelper.Exists

function Tl3PopupMenuHelper.GetPopupMenu(aControl: TComponent;
  const aPoint: TPoint): TMenuItem;
//#UC START# *1FF8AE53688A_550013770000_var*
var
 l_M : TMenu;
//#UC END# *1FF8AE53688A_550013770000_var*
begin
//#UC START# *1FF8AE53688A_550013770000_impl*
 if (f_Alien = nil) then
 begin
  if (aControl Is TControl) then
  begin
   l_M := TControlFriend(aControl).PopupMenu;
   if (l_M = nil) then
    Result := nil
   else
    Result := l_M.Items;
  end//aControl Is TControl
  else
   Result := nil;
 end//f_Alien = nil
 else
  Result := f_Alien.GetPopupMenu(aControl, aPoint);
//#UC END# *1FF8AE53688A_550013770000_impl*
end;//Tl3PopupMenuHelper.GetPopupMenu

procedure Tl3PopupMenuHelper.GetPopupMenuForComponentInfo(aControl: TComponent;
  const aPoint: TPoint;
  aCallback: Tl3PopupMenuHelperCallback);
//#UC START# *E1C719B751DC_550013770000_var*
//#UC END# *E1C719B751DC_550013770000_var*
begin
//#UC START# *E1C719B751DC_550013770000_impl*
 if Assigned(f_Alien) then
  f_Alien.GetPopupMenuForComponentInfo(aControl, aPoint, aCallback)
 else
  aCallback(Self.GetPopupMenu(aControl, aPoint));
//#UC END# *E1C719B751DC_550013770000_impl*
end;//Tl3PopupMenuHelper.GetPopupMenuForComponentInfo

procedure Tl3PopupMenuHelper.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3PopupMenuHelper.ClearFields

{$IfEnd} //not NoVCL

end.