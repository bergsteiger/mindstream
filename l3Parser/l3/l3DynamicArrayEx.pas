unit l3DynamicArrayEx;

 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3DynamicArray
  ;

type
 Tl3DynamicArrayEx = class(Tl3DynamicArray)
 private
 // private fields
   f_ItemSize : Integer;
 protected
 // realized methods
   function pm_GetItemSize: Integer; override;
 public
 // public methods
   constructor Create(anItemSize: Integer); reintroduce;
 end;//Tl3DynamicArrayEx

implementation

// start class Tl3DynamicArrayEx

constructor Tl3DynamicArrayEx.Create(anItemSize: Integer);
//#UC START# *479F082A0193_479DFD65024D_var*
//#UC END# *479F082A0193_479DFD65024D_var*
begin
//#UC START# *479F082A0193_479DFD65024D_impl*
 inherited Create;
 f_ItemSize := anItemSize;
//#UC END# *479F082A0193_479DFD65024D_impl*
end;//Tl3DynamicArrayEx.Create

function Tl3DynamicArrayEx.pm_GetItemSize: Integer;
//#UC START# *47BEE7FD01DC_479DFD65024Dget_var*
//#UC END# *47BEE7FD01DC_479DFD65024Dget_var*
begin
//#UC START# *47BEE7FD01DC_479DFD65024Dget_impl*
 Result := f_ItemSize;
//#UC END# *47BEE7FD01DC_479DFD65024Dget_impl*
end;//Tl3DynamicArrayEx.pm_GetItemSize

end.