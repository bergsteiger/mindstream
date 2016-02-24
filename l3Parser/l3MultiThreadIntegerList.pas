unit l3MultiThreadIntegerList;
 
{$Include l3Define.inc}

interface

uses
  l3ProtoObject,
  l3ProtoIntegerList,
  SyncObjs
  ;

type
  IntegerIterator_ForEachF_Action = function (anItem: Integer): Boolean;
   {* Тип подитеративной функции для IntegerIterator.ForEachF }

  IntegerIterator_ForOneF_Action = function (anItem: Integer): Boolean;
   {* Тип подитеративной функции для IntegerIterator.ForOneF }

(*
 IntegerIterator = PureMixIn
   {iterator} procedure ForEachF(anAction: IntegerIterator_ForEachF_Action);
   {iterator} procedure ForOneF(anAction: IntegerIterator_ForOneF_Action;
    anIndex: Integer);
 end;//IntegerIterator
*)

 _l3CriticalSectionHolder_Parent_ = Tl3ProtoObject;
 {$Include l3CriticalSectionHolder.imp.pas}
 Tl3MultiThreadIntegerList = class(_l3CriticalSectionHolder_)
 private
 // private fields
   f_Items : Tl3ProtoIntegerList;
    {* Поле для свойства Items}
 public
 // realized methods
   {iterator} procedure ForEachF(anAction: IntegerIterator_ForEachF_Action);
   {iterator} procedure ForOneF(anAction: IntegerIterator_ForOneF_Action;
    anIndex: Integer);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 protected
 // protected methods
   function NeedSort: Boolean; virtual;
 public
 // public methods
   procedure Add(anItem: Integer);
   procedure Remove(anItem: Integer);
   procedure Clear;
 protected
 // protected properties
   property Items: Tl3ProtoIntegerList
     read f_Items;
 end;//Tl3MultiThreadIntegerList
function L2IntegerIteratorForEachFAction(anAction: pointer): IntegerIterator_ForEachF_Action;
   {* Функция формирования заглушки для ЛОКАЛЬНОЙ подитеративной функции для IntegerIterator.ForEachF }
function L2IntegerIteratorForOneFAction(anAction: pointer): IntegerIterator_ForOneF_Action;
   {* Функция формирования заглушки для ЛОКАЛЬНОЙ подитеративной функции для IntegerIterator.ForOneF }

implementation

uses
  l3Base,
  SysUtils
  ;

// start class IntegerIterator

function L2IntegerIteratorForEachFAction(anAction: pointer): IntegerIterator_ForEachF_Action;
 {-}
asm
 jmp l3LocalStub
end;//L2IntegerIteratorForEachFAction

function L2IntegerIteratorForOneFAction(anAction: pointer): IntegerIterator_ForOneF_Action;
 {-}
asm
 jmp l3LocalStub
end;//L2IntegerIteratorForOneFAction
{$Include l3CriticalSectionHolder.imp.pas}

// start class Tl3MultiThreadIntegerList

procedure Tl3MultiThreadIntegerList.Add(anItem: Integer);
//#UC START# *53A2C8C10024_53A2C7AA03BF_var*
//#UC END# *53A2C8C10024_53A2C7AA03BF_var*
begin
//#UC START# *53A2C8C10024_53A2C7AA03BF_impl*
 Lock;
 try
  Items.Add(anItem);
 finally
  Unlock;
 end;//try..finally
//#UC END# *53A2C8C10024_53A2C7AA03BF_impl*
end;//Tl3MultiThreadIntegerList.Add

procedure Tl3MultiThreadIntegerList.Remove(anItem: Integer);
//#UC START# *53A2C8EE02B5_53A2C7AA03BF_var*
//#UC END# *53A2C8EE02B5_53A2C7AA03BF_var*
begin
//#UC START# *53A2C8EE02B5_53A2C7AA03BF_impl*
 Lock;
 try
  Items.Remove(anItem);
 finally
  Unlock;
 end;//try..finally
//#UC END# *53A2C8EE02B5_53A2C7AA03BF_impl*
end;//Tl3MultiThreadIntegerList.Remove

function Tl3MultiThreadIntegerList.NeedSort: Boolean;
//#UC START# *53A2C90A0344_53A2C7AA03BF_var*
//#UC END# *53A2C90A0344_53A2C7AA03BF_var*
begin
//#UC START# *53A2C90A0344_53A2C7AA03BF_impl*
 Result := false;
//#UC END# *53A2C90A0344_53A2C7AA03BF_impl*
end;//Tl3MultiThreadIntegerList.NeedSort

procedure Tl3MultiThreadIntegerList.Clear;
//#UC START# *53A84920013D_53A2C7AA03BF_var*
//#UC END# *53A84920013D_53A2C7AA03BF_var*
begin
//#UC START# *53A84920013D_53A2C7AA03BF_impl*
 Lock;
 try
  Items.Clear;
 finally
  Unlock;
 end;//try..finally
//#UC END# *53A84920013D_53A2C7AA03BF_impl*
end;//Tl3MultiThreadIntegerList.Clear

{iterator} procedure Tl3MultiThreadIntegerList.ForEachF(anAction: IntegerIterator_ForEachF_Action);
//#UC START# *53A2C89B0302_53A2C7AA03BF_var*

 function DoIt(aData : PInteger; anIndex : Integer) : Boolean;
 begin
  Result := anAction(aData^);
 end;

var
 Hack : Pointer absolute anAction;
//#UC END# *53A2C89B0302_53A2C7AA03BF_var*
begin
//#UC START# *53A2C89B0302_53A2C7AA03BF_impl*
 try
  Lock;
  try
   f_Items.IterateAllF(l3L2IA(@DoIt));
  finally
   Unlock;
  end;//try..finally
 finally
  l3FreeLocalStub(Hack);
 end;//try..finally
//#UC END# *53A2C89B0302_53A2C7AA03BF_impl*
end;//Tl3MultiThreadIntegerList.ForEachF

{iterator} procedure Tl3MultiThreadIntegerList.ForOneF(anAction: IntegerIterator_ForOneF_Action;
  anIndex: Integer);
//#UC START# *53A84EAD0005_53A2C7AA03BF_var*
var
 Hack : Pointer absolute anAction;
//#UC END# *53A84EAD0005_53A2C7AA03BF_var*
begin
//#UC START# *53A84EAD0005_53A2C7AA03BF_impl*
 try
  Lock;
  try
   if (anIndex >= 0) AND (anIndex < f_Items.Count) then
    anAction(f_Items[anIndex]);
  finally
   Unlock;
  end;//try..finally
 finally
  l3FreeLocalStub(Hack);
 end;//try..finally
//#UC END# *53A84EAD0005_53A2C7AA03BF_impl*
end;//Tl3MultiThreadIntegerList.ForOneF

procedure Tl3MultiThreadIntegerList.Cleanup;
//#UC START# *479731C50290_53A2C7AA03BF_var*
//#UC END# *479731C50290_53A2C7AA03BF_var*
begin
//#UC START# *479731C50290_53A2C7AA03BF_impl*
 FreeAndNil(f_Items);
 inherited;
//#UC END# *479731C50290_53A2C7AA03BF_impl*
end;//Tl3MultiThreadIntegerList.Cleanup

procedure Tl3MultiThreadIntegerList.InitFields;
//#UC START# *47A042E100E2_53A2C7AA03BF_var*
//#UC END# *47A042E100E2_53A2C7AA03BF_var*
begin
//#UC START# *47A042E100E2_53A2C7AA03BF_impl*
 inherited;
 if NeedSort then
  f_Items := Tl3ProtoIntegerList.MakeSorted
 else
  f_Items := Tl3ProtoIntegerList.Create;
//#UC END# *47A042E100E2_53A2C7AA03BF_impl*
end;//Tl3MultiThreadIntegerList.InitFields

end.