unit l3ObjectRefList1;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3_Base,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Tl3_Base;
 _l3ObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3ObjectRefList.imp.pas}
 Tl3ObjectRefList1 = class(_l3ObjectRefList_)
  {* —писок ссылок на объекты. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3ObjectRefList1

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = Tl3ObjectRefList1;

{$Include ..\L3\l3ObjectRefList.imp.pas}

// start class Tl3ObjectRefList1

{$If not defined(DesignTimeLibrary)}
class function Tl3ObjectRefList1.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4773DAAA02AA_var*
//#UC END# *47A6FEE600FC_4773DAAA02AA_var*
begin
//#UC START# *47A6FEE600FC_4773DAAA02AA_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4773DAAA02AA_impl*
end;//Tl3ObjectRefList1.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.