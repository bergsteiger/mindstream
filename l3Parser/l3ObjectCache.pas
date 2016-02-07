unit l3ObjectCache;

{$Include l3Define.inc}

interface

uses
  l3SimpleDataContainer,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Tl3ProtoDataContainer;
 _l3UncomparabeObjectRefList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UncomparabeObjectRefList.imp.pas}
 Tl3ObjectCache = class(_l3UncomparabeObjectRefList_)
  {*  еш объектов. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3ObjectCache

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3ObjectCache

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4773DB430315_var*
//#UC END# *47B2C42A0163_4773DB430315_var*
begin
//#UC START# *47B2C42A0163_4773DB430315_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4773DB430315_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4773DB430315_var*
//#UC END# *47B99D4503A2_4773DB430315_var*
begin
//#UC START# *47B99D4503A2_4773DB430315_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Integer(CI.rA^) - Integer(CI.rB^);
//#UC END# *47B99D4503A2_4773DB430315_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3ObjectCache;

{$Include l3UncomparabeObjectRefList.imp.pas}

// start class Tl3ObjectCache

{$If not defined(DesignTimeLibrary)}
class function Tl3ObjectCache.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4773DB430315_var*
//#UC END# *47A6FEE600FC_4773DB430315_var*
begin
//#UC START# *47A6FEE600FC_4773DB430315_impl*
 Result := false;
//#UC END# *47A6FEE600FC_4773DB430315_impl*
end;//Tl3ObjectCache.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.