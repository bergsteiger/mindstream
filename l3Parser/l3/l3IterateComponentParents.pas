unit l3IterateComponentParents;

{$Include ..\L3\l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  Classes,
  l3ProtoObject
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
type
  Ml3IterateComponentParents_IterateF_Action = function (anItem: TComponent): Boolean;
   {* Тип подитеративной функции для Ml3IterateComponentParents.IterateF }

(*
 Ml3IterateComponentParents = PureMixIn
  {* Контракт сервиса Tl3IterateComponentParents }
   {iterator} procedure IterateF(anAction: Ml3IterateComponentParents_IterateF_Action;
    aComponent: TComponent);
 end;//Ml3IterateComponentParents
*)

 Il3IterateComponentParents = interface(IUnknown)
  {* Интерфейс сервиса Tl3IterateComponentParents }
   ['{5A7F04AD-BABF-4265-8160-3A5BDA277D22}']
  // Ml3IterateComponentParents
   {iterator} procedure IterateF(anAction: Ml3IterateComponentParents_IterateF_Action;
    aComponent: TComponent);
 end;//Il3IterateComponentParents

 Tl3IterateComponentParents = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3IterateComponentParents;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3IterateComponentParents);
 public
 // realized methods
   {iterator} procedure IterateF(anAction: Ml3IterateComponentParents_IterateF_Action;
     aComponent: TComponent);
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
   property Alien: Il3IterateComponentParents
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3IterateComponentParents }
 public
 // singleton factory method
   class function Instance: Tl3IterateComponentParents;
    {- возвращает экземпляр синглетона. }
 end;//Tl3IterateComponentParents
{$IfEnd} //not NoVCL
 {$If not defined(NoVCL)}
function L2Ml3IterateComponentParentsIterateFAction(anAction: pointer): Ml3IterateComponentParents_IterateF_Action;
   {* Функция формирования заглушки для ЛОКАЛЬНОЙ подитеративной функции для Ml3IterateComponentParents.IterateF }
 {$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a},
  Controls
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3IterateComponentParents

var g_Tl3IterateComponentParents : Tl3IterateComponentParents = nil;

procedure Tl3IterateComponentParentsFree;
begin
 l3Free(g_Tl3IterateComponentParents);
end;

class function Tl3IterateComponentParents.Instance: Tl3IterateComponentParents;
begin
 if (g_Tl3IterateComponentParents = nil) then
 begin
  l3System.AddExitProc(Tl3IterateComponentParentsFree);
  g_Tl3IterateComponentParents := Create;
 end;
 Result := g_Tl3IterateComponentParents;
end;


function L2Ml3IterateComponentParentsIterateFAction(anAction: pointer): Ml3IterateComponentParents_IterateF_Action;
 {-}
asm
 jmp l3LocalStub
end;//L2Ml3IterateComponentParentsIterateFAction

procedure Tl3IterateComponentParents.pm_SetAlien(const aValue: Il3IterateComponentParents);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3IterateComponentParents.pm_SetAlien

class function Tl3IterateComponentParents.Exists: Boolean;
 {-}
begin
 Result := g_Tl3IterateComponentParents <> nil;
end;//Tl3IterateComponentParents.Exists

{iterator} procedure Tl3IterateComponentParents.IterateF(anAction: Ml3IterateComponentParents_IterateF_Action;
  aComponent: TComponent);
//#UC START# *3410F441967F_551AA9BD01EE_var*
var
 Hack : Pointer absolute anAction;
 l_C: TControl;
//#UC END# *3410F441967F_551AA9BD01EE_var*
begin
//#UC START# *3410F441967F_551AA9BD01EE_impl*
 if Assigned(f_Alien) then
  f_Alien.IterateF(anAction, aComponent)
 else
 begin
  try
   anAction(aComponent);
   if aComponent is TControl then
   begin
    l_C := TControl(aComponent);
    while Assigned(l_C.Parent) do
    begin
     l_C := l_C.Parent;
     anAction(l_C);
    end;
   end;
  finally
   l3FreeLocalStub(Hack);
  end;//try..finally
 end;//f_Alien <> nil
//#UC END# *3410F441967F_551AA9BD01EE_impl*
end;//Tl3IterateComponentParents.IterateF

procedure Tl3IterateComponentParents.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3IterateComponentParents.ClearFields

{$IfEnd} //not NoVCL

end.