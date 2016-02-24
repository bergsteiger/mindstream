unit l3DynamicArray;
 
{$Include l3Define.inc}

interface

uses
  l3Memory,
  l3SimpleDataContainer,
  l3Interfaces,
  l3Types,
  l3Except,
  Classes
  ;

 {$Define _l3Items_NeedsBeforeFreeItem}

type
 _DataType_ = Tl3Ptr;
 _l3UntypedList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UntypedList.imp.pas}
 Tl3DynamicArray = class(_l3UntypedList_)
  {* Базовый класс для динамических массовов. }
 protected
 // property methods
   function pm_GetItems(anIndex: Integer): Pointer;
 public
 // public properties
   property Items[anIndex: Integer]: Pointer
     read pm_GetItems;
     default;
 end;//Tl3DynamicArray

implementation

uses
  l3Base,
  RTLConsts,
  SysUtils,
  l3MinMax
  ;

type _Instance_R_ = Tl3DynamicArray;

{$Include l3UntypedList.imp.pas}

// start class Tl3DynamicArray

function Tl3DynamicArray.pm_GetItems(anIndex: Integer): Pointer;
//#UC START# *479DFDBE0123_479DFD5300C5get_var*
//#UC END# *479DFDBE0123_479DFD5300C5get_var*
begin
//#UC START# *479DFDBE0123_479DFD5300C5get_impl*
 Result := ItemSlot(anIndex);
//#UC END# *479DFDBE0123_479DFD5300C5get_impl*
end;//Tl3DynamicArray.pm_GetItems

end.