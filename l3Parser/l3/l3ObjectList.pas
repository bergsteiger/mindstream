unit l3ObjectList;

 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3SimpleDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = TObject;
 _l3ObjectPtrList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3ObjectPtrList.imp.pas}
 Tl3ObjectList = class(_l3ObjectPtrList_)
  {* Списсок указателей на объект. }
 protected
 // overridden protected methods
   procedure DoDelete(Index: Integer); override;
     {* Удаляет элемент с индексом Index. Не проверяет валидность индекса. }
 end;//Tl3ObjectList

implementation

uses
  RTLConsts,
  l3Base,
  l3MinMax,
  SysUtils
  ;

type _Instance_R_ = Tl3ObjectList;

{$Include ..\L3\l3ObjectPtrList.imp.pas}

// start class Tl3ObjectList

procedure Tl3ObjectList.DoDelete(Index: Integer);
//#UC START# *47B4895F01BE_4773DBBD000D_var*
var
 l_P : PItemType;
//#UC END# *47B4895F01BE_4773DBBD000D_var*
begin
//#UC START# *47B4895F01BE_4773DBBD000D_impl*
 // !!! отличается от _l3Items_.DoDelete только отсутствием FreeSlot
 //     это можно со временем почистить
 {$IfNDef l3Items_NoChanging}
 Changing;
 try
 {$EndIf l3Items_NoChanging}
  l_P := ItemSlot(Index);
  Dec(f_Count);
  if (Index = f_Count) then
   l_P^ := nil
  else
   MoveItems(Index, Succ(Index), f_Count-Index, Self);
 {$IfNDef l3Items_NoChanging}
 finally
  Changed;
 end;//try..finally
 {$EndIf  l3Items_NoChanging}
//#UC END# *47B4895F01BE_4773DBBD000D_impl*
end;//Tl3ObjectList.DoDelete

end.