unit l3GetComponentBoundsHelper;

 
{$Include l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  Types,
  Classes,
  l3ProtoObject
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
(*
 Ml3GetComponentBoundsHelper = PureMixIn
  {* Контракт сервиса Tl3GetComponentBoundsHelper }
   function GetBounds(aComponent: TComponent): TRect;
 end;//Ml3GetComponentBoundsHelper
*)

type
 Il3GetComponentBoundsHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3GetComponentBoundsHelper }
   ['{B081F2FC-089F-4E17-A5BC-DE28732B26EB}']
  // Ml3GetComponentBoundsHelper
   function GetBounds(aComponent: TComponent): TRect;
 end;//Il3GetComponentBoundsHelper

 Tl3GetComponentBoundsHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3GetComponentBoundsHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3GetComponentBoundsHelper);
 public
 // realized methods
   function GetBounds(aComponent: TComponent): TRect;
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
   property Alien: Il3GetComponentBoundsHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3GetComponentBoundsHelper }
 public
 // singleton factory method
   class function Instance: Tl3GetComponentBoundsHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3GetComponentBoundsHelper
{$IfEnd} //not NoVCL

  {$If not defined(NoVCL)}
var
   EmptyRect : TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);
  {$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a},
  Controls
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3GetComponentBoundsHelper

var g_Tl3GetComponentBoundsHelper : Tl3GetComponentBoundsHelper = nil;

procedure Tl3GetComponentBoundsHelperFree;
begin
 l3Free(g_Tl3GetComponentBoundsHelper);
end;

class function Tl3GetComponentBoundsHelper.Instance: Tl3GetComponentBoundsHelper;
begin
 if (g_Tl3GetComponentBoundsHelper = nil) then
 begin
  l3System.AddExitProc(Tl3GetComponentBoundsHelperFree);
  g_Tl3GetComponentBoundsHelper := Create;
 end;
 Result := g_Tl3GetComponentBoundsHelper;
end;


procedure Tl3GetComponentBoundsHelper.pm_SetAlien(const aValue: Il3GetComponentBoundsHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3GetComponentBoundsHelper.pm_SetAlien

class function Tl3GetComponentBoundsHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3GetComponentBoundsHelper <> nil;
end;//Tl3GetComponentBoundsHelper.Exists

function Tl3GetComponentBoundsHelper.GetBounds(aComponent: TComponent): TRect;
//#UC START# *BB0BB5CAA29B_5522D7A90252_var*
var
 C, P : TControl;
//#UC END# *BB0BB5CAA29B_5522D7A90252_var*
begin
//#UC START# *BB0BB5CAA29B_5522D7A90252_impl*
 if Assigned(f_Alien) then
  Result := f_Alien.GetBounds(aComponent);

 if EqualRect(Result, EmptyRect) then
  if (aComponent is TControl) then
  begin
   C := TControl(aComponent);
   P := C.Parent;
   if not Assigned(P) then
    Result := C.BoundsRect
   else
    Result := Rect(P.ClientToScreen(C.BoundsRect.TopLeft), P.ClientToScreen(C.BoundsRect.BottomRight));                
  end;
//#UC END# *BB0BB5CAA29B_5522D7A90252_impl*
end;//Tl3GetComponentBoundsHelper.GetBounds

procedure Tl3GetComponentBoundsHelper.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3GetComponentBoundsHelper.ClearFields

{$IfEnd} //not NoVCL

end.