unit l3FrameLineList;
 
{$Include l3Define.inc}

interface

uses
  l3FrameLine,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Tl3FrameLine;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UncomparabeObjectRefList.imp.pas}
 Tl3FrameLineList = class(_l3UncomparabeObjectRefList_)
  {* Массив выравнивающих линий. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3FrameLineList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3FrameLineList

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_48CA61B900B2_var*
//#UC END# *47B2C42A0163_48CA61B900B2_var*
begin
//#UC START# *47B2C42A0163_48CA61B900B2_impl*
 Assert(false);
//#UC END# *47B2C42A0163_48CA61B900B2_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_48CA61B900B2_var*
//#UC END# *47B99D4503A2_48CA61B900B2_var*
begin
//#UC START# *47B99D4503A2_48CA61B900B2_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_48CA61B900B2_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3FrameLineList;

{$Include l3UncomparabeObjectRefList.imp.pas}

// start class Tl3FrameLineList

{$If not defined(DesignTimeLibrary)}
class function Tl3FrameLineList.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_48CA61B900B2_var*
//#UC END# *47A6FEE600FC_48CA61B900B2_var*
begin
//#UC START# *47A6FEE600FC_48CA61B900B2_impl*
 Result := true;
//#UC END# *47A6FEE600FC_48CA61B900B2_impl*
end;//Tl3FrameLineList.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.