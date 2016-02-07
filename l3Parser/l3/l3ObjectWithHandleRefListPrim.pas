unit l3ObjectWithHandleRefListPrim;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoDataContainer,
  l3ProtoObjectWithHandle,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Tl3ProtoObjectWithHandle;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3UncomparabeObjectRefList.imp.pas}
 Tl3ObjectWithHandleRefListPrim = class(_l3UncomparabeObjectRefList_)
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3ObjectWithHandleRefListPrim

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3ObjectWithHandleRefListPrim

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_52FCBFC3000D_var*
//#UC END# *47B2C42A0163_52FCBFC3000D_var*
begin
//#UC START# *47B2C42A0163_52FCBFC3000D_impl*
 Assert(false);
//#UC END# *47B2C42A0163_52FCBFC3000D_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_52FCBFC3000D_var*
//#UC END# *47B99D4503A2_52FCBFC3000D_var*
begin
//#UC START# *47B99D4503A2_52FCBFC3000D_impl*
 Result := CI.rA.CompareWith(CI.rB^);
//#UC END# *47B99D4503A2_52FCBFC3000D_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3ObjectWithHandleRefListPrim;

{$Include ..\L3\l3UncomparabeObjectRefList.imp.pas}

// start class Tl3ObjectWithHandleRefListPrim

{$If not defined(DesignTimeLibrary)}
class function Tl3ObjectWithHandleRefListPrim.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_52FCBFC3000D_var*
//#UC END# *47A6FEE600FC_52FCBFC3000D_var*
begin
//#UC START# *47A6FEE600FC_52FCBFC3000D_impl*
 Result := true;
//#UC END# *47A6FEE600FC_52FCBFC3000D_impl*
end;//Tl3ObjectWithHandleRefListPrim.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.