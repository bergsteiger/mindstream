unit l3InterfaceList;


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
 _ItemType_ = IUnknown;
 _l3InterfaceRefList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3InterfaceRefList.imp.pas}
 Tl3InterfaceList = class(_l3InterfaceRefList_)
  {* —писок интерфейсов. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3InterfaceList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = Tl3InterfaceList;

{$Include ..\L3\l3InterfaceRefList.imp.pas}

// start class Tl3InterfaceList

{$If not defined(DesignTimeLibrary)}
class function Tl3InterfaceList.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4773DC580043_var*
//#UC END# *47A6FEE600FC_4773DC580043_var*
begin
//#UC START# *47A6FEE600FC_4773DC580043_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4773DC580043_impl*
end;//Tl3InterfaceList.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.